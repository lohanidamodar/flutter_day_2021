import 'package:flutter/material.dart';
import 'package:flutter_day_2021/models/job.dart';
import 'package:flutter_day_2021/services/db_service.dart';
import 'package:flutter_day_2021/widgets/appwrite_logo.dart';
import 'package:flutter_day_2021/widgets/job_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppwriteLogo(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text('FlAppwrite Jobs'),
          ),
          titleTextStyle:
              Theme.of(context).textTheme.headline6?.copyWith(fontSize: 16.0),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text("Logout"),
              onPressed: () async {
                final loggedOut = await DBService.instance.logout();
                if (loggedOut) {
                  Navigator.pushReplacementNamed(context, '/login');
                }
              },
            ),
            const SizedBox(width: 24.0),
          ],
        ),
        body: FutureBuilder(
          future: DBService.instance.getJobs(context),
          builder: (context, AsyncSnapshot<List<Job>?> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Find your dream",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          "Job",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                  ...snapshot.data!.map(
                    (job) => JobCard(
                      title: job.title,
                      company: job.company,
                      location: job.location,
                      description: job.description,
                      url: job.link,
                      logo: job.logo,
                    ),
                  ),
                  const SizedBox(height: 60.0),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
