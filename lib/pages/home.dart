import 'package:flutter/material.dart';
import 'package:flutter_day_2021/models/job.dart';
import 'package:flutter_day_2021/services/db_service.dart';
import 'package:flutter_day_2021/widgets/job_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('FlAppwrite Jobs'),
      ),
      body: FutureBuilder(
        future: DBService.instance.getJobs(context),
        builder: (context, AsyncSnapshot<List<Job>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                ...snapshot.data!.map(
                  (job) => JobCard(
                    title: job.title,
                    company: job.company,
                    location: job.location,
                    description: job.description,
                    url: job.url,
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
