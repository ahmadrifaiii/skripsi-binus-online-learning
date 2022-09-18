import 'dart:convert';

class JobList {
  String? id;
  String? workorderName;
  String? workorderNumber;
  String? status;

  JobList({this.id, this.workorderName, this.workorderNumber, this.status});

  factory JobList.fromJson(Map<String, dynamic> json) {
    return JobList(
        id: json['id'],
        workorderName: json['workorder_name'],
        workorderNumber: json['workorder_number'],
        status: json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['workorder_name'] = workorderName;
    data['workorder_number'] = workorderNumber;
    data['status'] = status;
    return data;
  }
}

// -------------------------------------------------------------------------------
// To parse this JSON data, do
//
//     final jobDetail = jobDetailFromJson(jsonString);

JobDetail jobDetailFromJson(String str) => JobDetail.fromJson(json.decode(str));

String jobDetailToJson(JobDetail data) => json.encode(data.toJson());

class JobDetail {
  JobDetail({
    required this.id,
    required this.workorderName,
    required this.workorderNumber,
    required this.workorderDescription,
    required this.info,
    required this.workorderExecutor,
    required this.status,
  });

  String id;
  String workorderName;
  String workorderNumber;
  String workorderDescription;
  List<String> info;
  List<WorkorderExecutor> workorderExecutor;
  String status;

  factory JobDetail.fromJson(Map<String, dynamic> json) {
    return JobDetail(
      id: json["id"],
      workorderName: json["workorder_name"],
      workorderNumber: json["workorder_number"],
      workorderDescription: json["workorder_description"],
      info: List<String>.from(json["info"].map((x) => x)),
      workorderExecutor: List<WorkorderExecutor>.from(
          json["workorder_executor"].map((x) => WorkorderExecutor.fromJson(x))),
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "workorder_name": workorderName,
      "workorder_number": workorderNumber,
      "workorder_description": workorderDescription,
      "info": List<dynamic>.from(info.map((x) => x)),
      "workorder_executor":
          List<dynamic>.from(workorderExecutor.map((x) => x.toJson())),
      "status": status,
    };
  }
}

class WorkorderExecutor {
  WorkorderExecutor({
    required this.photo,
    required this.name,
  });

  String photo;
  String name;

  factory WorkorderExecutor.fromJson(Map<String, dynamic> json) =>
      WorkorderExecutor(
        photo: json["photo"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "name": name,
      };
}
