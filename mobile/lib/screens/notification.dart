import 'package:flutter/material.dart';

import '../../utility/style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: double.maxFinite,
        color: whiteColor,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          const Text('Notification',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          const SizedBox(height: 8),
          Container(height: 2, color: grayColor),
          const SizedBox(height: 20),
          const Card(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            child: ListTile(
              minLeadingWidth: 1,
              leading:
                  Icon(Icons.schedule_outlined, color: grayTextColor, size: 18),
              title: Text("Cek",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              subtitle: Text("cek",
                  style: TextStyle(color: grayTextColor, fontSize: 10)),
            ),
          )
        ]),
      ),
    );
  }
}
