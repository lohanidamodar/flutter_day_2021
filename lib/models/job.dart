import 'dart:convert';

class Job {
  final String id;
  final String title;
  final String description;
  final String company;
  final String location;
  final String url;
  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.company,
    required this.location,
    required this.url,
  });

  Job copyWith({
    String? id,
    String? title,
    String? description,
    String? company,
    String? location,
    String? url,
  }) {
    return Job(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      company: company ?? this.company,
      location: location ?? this.location,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'company': company,
      'location': location,
      'url': url,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      company: map['company'],
      location: map['location'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) =>
      Job.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JobData(id: $id, title: $title, description: $description, company: $company, location: $location, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Job &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.company == company &&
        other.location == location &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        company.hashCode ^
        location.hashCode ^
        url.hashCode;
  }
}
