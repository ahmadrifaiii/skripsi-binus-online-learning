import 'package:flutter/material.dart';
import 'package:pln/utility/style.dart';

import '../../utility/apiservice.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      child: Container(
        color: whiteColor,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          const Text('Beranda',
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          const SizedBox(height: 8),
          Container(height: 2, color: grayColor),
          const SizedBox(height: 8),
          const Text('On Progress',
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          FutureBuilder(
              future: ApiService().getJobCurrentList(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // itemCount: snapshot.data.length,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        var item = snapshot.data[index];
                        return Column(children: <Widget>[
                          ItemRecent(context, item.id, item.workorderNumber,
                              item.workorderName, item.status)
                        ]);
                      });
                } else {
                  return Column(
                    children: const [
                      SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator()),
                    ],
                  );
                }
              }),
          const SizedBox(height: 20),
          Container(height: 2, color: grayColor),
          const SizedBox(height: 20),
          const Text('Recents',
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          FutureBuilder(
              future: ApiService().getJobRecentList(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 5,
                      // itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var item = snapshot.data[index];
                        return Column(children: <Widget>[
                          ItemRecent(context, item.id, item.workorderNumber,
                              item.workorderName, item.status)
                        ]);
                      });
                } else {
                  return Column(
                    children: const [
                      SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator()),
                    ],
                  );
                }
              }),
        ]),
      ),
    );
  }
}
