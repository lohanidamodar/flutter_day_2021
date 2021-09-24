// JobsService singleton class

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_day_2021/models/job.dart';

class JobsService {
  JobsService._();

  static final JobsService _instance = JobsService._();

  factory JobsService() {
    return _instance;
  }

  static JobsService get instance => _instance;

  Future<List<Job>> getJobs(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString('assets/jobs.json');
    List<dynamic> json = jsonDecode(data);
    List<Job> jobs = json.map((dynamic item) => Job.fromMap(item)).toList();
    return jobs;
  }
}
