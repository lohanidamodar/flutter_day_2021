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
    this.logo,
  }) : super(key: key);

  final String title;
  final String company;
  final String location;
  final String description;
  final String url;
  final String? logo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launch(url),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (logo != null)
                Card(
                  margin: const EdgeInsets.all(0),
                  color: const Color(0xff302D39),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(
                      logo!,
                      height: 40,
                    ),
                  ),
                ),
              const SizedBox(height: 24.0),
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Text(company, style: Theme.of(context).textTheme.subtitle1),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 5.0,
                    height: 5.0,
                  ),
                  Text(location, style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
              const SizedBox(height: 24.0),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
