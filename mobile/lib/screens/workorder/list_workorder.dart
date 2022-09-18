import 'package:flutter/material.dart';

import '../../utility/apiservice.dart';
import '../../utility/style.dart';

class WorkOrderListScreen extends StatelessWidget {
  const WorkOrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      child: Container(
        width: double.maxFinite,
        color: whiteColor,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          const Text('Work Order',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          const SizedBox(height: 8),
          Container(height: 2, color: grayColor),
          const SizedBox(height: 20),
          TextFormField(
            style: const TextStyle(fontSize: 13),
            decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: grayColor)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: grayColor)),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => null,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(0),
            child: FutureBuilder(
                future: ApiService().getJobList(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data[index];
                          return Column(children: <Widget>[
                            ItemWork(context, item.id, item.workorderNumber,
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
          ),
        ]),
      ),
    );
  }
}
