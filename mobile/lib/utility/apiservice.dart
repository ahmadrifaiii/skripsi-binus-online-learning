import 'dart:convert';
import 'package:http/http.dart' show Client;

import '../models/model_job.dart';

class ApiService {
  final String baseUrl = "https://pltu.online";

  Client client = Client();

  Future getJobList() async {
    try {
      var headers = {
        "Authorization":
            "V6mOgtD8QJE4uIOzVLbM9vqvWcSiP1ycquG6Wlzky46uVas8G9vE5mQYzWuO",
      };
      final response = await client.get(Uri.parse("$baseUrl/api/joborder/list"),
          headers: headers);
      if (response.statusCode == 200) {
        dynamic result = jsonDecode(response.body);
        if (result['status'] == "success") {
          return (result['data'] as List)
              .map((e) => JobList.fromJson(e))
              .toList();
        }
        // print(result);
      } else {
        throw Exception('Load data empty');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getJobRecentList() async {
     // ignore: avoid_print
    try {
      var headers = {
        "Authorization":
            "V6mOgtD8QJE4uIOzVLbM9vqvWcSiP1ycquG6Wlzky46uVas8G9vE5mQYzWuO",
      };
      final response = await client.get(Uri.parse("$baseUrl/api/joborder/recent"),
          headers: headers);
      if (response.statusCode == 200) {
        dynamic result = jsonDecode(response.body);
        if (result['status'] == "success") {
          return (result['data'] as List)
              .map((e) => JobList.fromJson(e))
              .toList();
        }
        // print(result);
      } else {
        throw Exception('Load data empty');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getJobCurrentList() async {
    try {
      var headers = {
        "Authorization":
            "V6mOgtD8QJE4uIOzVLbM9vqvWcSiP1ycquG6Wlzky46uVas8G9vE5mQYzWuO",
      };
      final response = await client.get(Uri.parse("$baseUrl/api/joborder/current"),
          headers: headers);
      if (response.statusCode == 200) {
        dynamic result = jsonDecode(response.body);
        if (result['status'] == "success") {
          return (result['data'] as List)
              .map((e) => JobList.fromJson(e))
              .toList();
        }
        // print(result);
      } else {
        throw Exception('Load data empty');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

   Future jobDetail(String idJob) async {
    try {
      var headers = {
        "Authorization":
            "V6mOgtD8QJE4uIOzVLbM9vqvWcSiP1ycquG6Wlzky46uVas8G9vE5mQYzWuO",
      };
      final response = await client
          .get(Uri.parse("$baseUrl/api/joborder/$idJob"), headers: headers);
      if (response.statusCode == 200) {
        dynamic result = jsonDecode(response.body);
        if (result['status'] == "success") {
          print(result['data']);
          return JobDetail.fromJson(result['data']);
          return (result['data'] as List)
              .map((e) => JobDetail.fromJson(e))
              .toList();
        }
        // return (result as List).map((e) => PaketList.fromJson(e)).toList();
      } else {
        throw Exception('Load data empty');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

}


