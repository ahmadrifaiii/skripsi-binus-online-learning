import 'package:flutter/material.dart';

const primaryColor = Color(0xFF12A0B7);
const secondaryColor = Color(0xFF4DC9D1);
const royalblueColor = Color(0xFF0082CD);
const successColor = Color(0xFF4CAF50);
const warningColor = Color(0xFFFFC107);
const dangerColor = Color(0xFFEB5757);
const grayColor = Color(0xFFF6F7FA);
const grayTextColor = Color(0xFF9D9FA0);
const blackColor = Color(0xFF303030);
const whiteColor = Colors.white;

String inp = "ayaR nagaN natikgnabmeP anaskaleP tinU";
String dvlp = String.fromCharCodes(inp.runes.toList().reversed);

Container ItemWork(
    context, String id, String kode, String title, String status) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    decoration: const BoxDecoration(
        color: grayColor, borderRadius: BorderRadius.all(Radius.circular(8.0))),
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: () =>
          Navigator.pushNamed(context, '/wo-detail', arguments: {'id_job': id}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(kode,
              style: const TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          Card(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            child: ListTile(
              minLeadingWidth: 1,
              leading: getIcon(status),
              title: Text(title,
                  style: const TextStyle(
                      color: blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(status.toUpperCase(),
                  style: const TextStyle(color: grayTextColor, fontSize: 10)),
            ),
          ),
        ],
      ),
    ),
  );
}

Card ItemRecent(context, String id, String kode, String title, String status) {
  return Card(
    shadowColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      side: BorderSide.none,
    ),
    child: InkWell(
      onTap: () =>
          Navigator.pushNamed(context, '/wo-detail', arguments: {'id_job': id}),
      child: ListTile(
        minLeadingWidth: 1,
        leading: getIcon(status),
        title: Text('$title $kode',
            style: const TextStyle(
                color: blackColor, fontSize: 12, fontWeight: FontWeight.bold)),
        subtitle: Text(status.toUpperCase(),
            style: const TextStyle(color: grayTextColor, fontSize: 10)),
      ),
    ),
  );
}

Icon getIcon(status) {
  Icon icon =
      const Icon(Icons.schedule_outlined, color: grayTextColor, size: 18);
  if (status == "onprogress") {
    icon = const Icon(Icons.schedule_outlined, color: grayTextColor, size: 18);
  }
  if (status == "onhold") {
    icon = const Icon(Icons.back_hand, color: grayTextColor, size: 18);
  }
  if (status == "cancel") {
    icon = const Icon(Icons.warning_rounded, color: grayTextColor, size: 18);
  }
  if (status == "done") {
    icon =
        const Icon(Icons.check_circle_outline, color: grayTextColor, size: 18);
  }
  return icon;
}
