import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    required this.url,
  }) : super(key: key);

  final String title;
  final String company;
  final String location;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8.0),
            Text(
              company,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              location,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              child: const Text('Apply'),
              onPressed: () {
                launch(url);
              },
            ),
          ],
        ),
      ),
    );
  }
}
