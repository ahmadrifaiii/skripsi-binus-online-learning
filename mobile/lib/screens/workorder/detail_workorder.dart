import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pln/utility/apiservice.dart';
import 'package:pln/utility/style.dart';

class WorkOrderDetailScreen extends StatelessWidget {
  const WorkOrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    String idJob = arguments.isNotEmpty && arguments.containsKey('id_job')
        ? arguments['id_job'].toString()
        : "";

    // print(idJob);

    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
            future: ApiService().jobDetail(idJob),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var detail = snapshot.data;
                print(detail);
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: OutlinedButton(
                              onPressed: () {
                                // if (Navigator.canPop(context)) {
                                Navigator.of(context).pop();
                                // } else {
                                // SystemNavigator.pop();
                                // }
                              },
                              child: const Icon(Icons.chevron_left,
                                  color: primaryColor),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                backgroundColor: grayColor,
                                primary: grayTextColor,
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          const Text('Work Order Detail',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(height: 2, color: grayColor),
                      const SizedBox(height: 20),
                      Text(detail.workorderNumber,
                          style: const TextStyle(
                              color: blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: blackColor,
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: const EdgeInsets.all(5.0),
                            child: Text(detail.status,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: warningColor,
                                    fontSize: 10.0)),
                          ),
                          const SizedBox(width: 5),
                          for (var itemInfo in detail.info)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(itemInfo,
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          color: whiteColor,
                                          fontSize: 10.0)),
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(detail.workorderDescription,
                          style: const TextStyle(color: grayTextColor)),
                      const SizedBox(height: 20),
                      Container(height: 2, color: grayColor),
                      const SizedBox(height: 20),
                      const Text('Pelaksana',
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      for (var itemExecutor in detail.workorderExecutor)
                        ItemPelaksana(context, itemExecutor.photo,
                            itemExecutor.name, "Mechanical"),
                    ],
                  ),
                );
              } else {
                return SizedBox(
                  child: Text('Detail item tidak ditemukan'),
                );
              }
            }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Container(
          height: 110,
          child: Column(
            children: [
              RaisedButton(
                onPressed: () => null,
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                color: Colors.transparent,
                textColor: Colors.white,
                child: Container(
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    height: 50,
                    child: const Center(child: Text('Start Working'))),
              ),
              const SizedBox(height: 10),
              RaisedButton(
                onPressed: () => null,
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                color: Colors.transparent,
                textColor: Colors.white,
                child: Container(
                    decoration: const BoxDecoration(
                        color: successColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    height: 50,
                    child: const Center(child: Text('Finish'))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container ItemPelaksana(context, String photo, String nama, String jabatan) {
    return Container(
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamedAndRemoveUntil('/user-detail', (route) => false),
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
            horizontalTitleGap: 10,
            minLeadingWidth: 0,
            leading: Image.network(
              photo,
              height: 80,
            ),
            title: Text(nama,
                style: const TextStyle(
                    color: blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(jabatan,
                style: const TextStyle(color: grayTextColor, fontSize: 10)),
          ),
        ),
      ),
    );
  }
}
