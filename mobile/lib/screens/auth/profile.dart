import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:pln/utility/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _doLogout() async {
      await SessionManager().destroy();
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    }

    getUserAccount() async {
      var sesi = SessionManager();
      var akun = {
        'id': await sesi.get('userId') ?? '',
        'nama': await sesi.get('userName') ?? '',
        'email': await sesi.get('userEmail') ?? '',
      };
      return akun;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('General',
                    style: TextStyle(color: grayTextColor, fontSize: 10)),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil('/profile', (route) => false),
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: grayColor,
                    shadowColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: FutureBuilder(
                        future: getUserAccount(),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.hasData) {
                            var akun = snapshot.data as Map<String, dynamic>;
                            return ListTile(
                              contentPadding:
                                  const EdgeInsets.all(5.0).copyWith(left: 10),
                              horizontalTitleGap: 10,
                              minLeadingWidth: 0,
                              isThreeLine: true,
                              leading: const Icon(
                                FontAwesomeIcons.solidUserCircle,
                                size: 50,
                                color: primaryColor,
                              ),
                              title: Text(akun['nama'] + ' - ' + akun['email'],
                                  style: const TextStyle(
                                      color: blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Kepala Divisi - Pemeliharaan Umum",
                                      style: TextStyle(
                                          color: blackColor, fontSize: 10)),
                                  Text('1990 2001 009',
                                      style: TextStyle(
                                          color: blackColor, fontSize: 10))
                                ],
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        }),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('More',
                    style: TextStyle(color: grayTextColor, fontSize: 10)),
                const SizedBox(height: 10),
                Card(
                  color: grayColor,
                  margin: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 1,
                        title: const Text('Privacy Policy',
                            style: TextStyle(color: blackColor, fontSize: 14)),
                        leading: const Icon(
                          Icons.security,
                          size: 18,
                          color: blackColor,
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          size: 24,
                          color: grayTextColor,
                        ),
                        onTap: () => print('help'),
                      ),
                      Container(height: 1, color: const Color(0xFFC0C0C0)),
                      ListTile(
                        horizontalTitleGap: 1,
                        title: const Text('App Version',
                            style: TextStyle(color: blackColor, fontSize: 14)),
                        leading: const Icon(Icons.info_rounded,
                            size: 18, color: blackColor),
                        trailing: const Text(
                          '1.0.0 (890)',
                          style: TextStyle(color: grayTextColor),
                        ),
                        onTap: () => print('info'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                RaisedButton(
                  onPressed: () => _doLogout(),
                  elevation: 0,
                  hoverElevation: 0,
                  focusElevation: 0,
                  highlightElevation: 0,
                  color: Colors.transparent,
                  textColor: Colors.white,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: dangerColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      height: 50,
                      child: const Center(child: Text('Log out'))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
