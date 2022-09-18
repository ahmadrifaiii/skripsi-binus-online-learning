import 'package:flutter/material.dart';

import '../../utility/style.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

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
          const Text('Empty Screen',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          const SizedBox(height: 8),
          Container(height: 2, color: grayColor),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
