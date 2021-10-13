// JobsService singleton class
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_day_2021/models/job.dart';

class DBService {
  DBService._();

  static final DBService _instance = DBService._();

  factory DBService() {
    return _instance;
  }

  static DBService get instance => _instance;

  Future<List<Job>> getJobs(BuildContext context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/jobs.json');
    List<dynamic> json = jsonDecode(data);
    List<Job> jobs = json.map((dynamic item) => Job.fromMap(item)).toList();
    return jobs;
  }

  Future<bool> login(String email, String password) async {
    return true;
  }

  Future<bool> anonymousLogin() async {
    return true;
  }

  Future<bool> logout() async {
    return true;
  }

  Future<bool> createAccount(String name, String email, String password) async {
    return true;
  }
}
