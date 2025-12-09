import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Project {
  final String title;
  final String blurb;
  final List<String> tags;
  final List<String> skills; 
  final Map<String, String> links; 

  const Project({
    required this.title,
    required this.blurb,
    required this.tags,
    required this.skills,
    required this.links,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'] as String,
      blurb: json['blurb'] as String,
      tags: List<String>.from(json['tags'] as List),
      skills: List<String>.from(json['skills'] as List),
      links: Map<String, String>.from(json['links'] as Map),
    );
  }
}

const skills = [
{'key': 'appdev', 'label': 'App Development'},
{'key': 'pm', 'label': 'Project Management'},
{'key': 'ml', 'label': 'ML Research'},
];


class ProjectRepository {
  // List of asset paths for each project
  static const List<String> _projectAssetPaths = [
    'assets/project_info/shoppy.json',
    'assets/project_info/tornado.json',
    'assets/project_info/shell.json',
    'assets/project_info/ai_image.json',
  ];

  static Future<List<Project>> loadProjects() async {
    final List<Project> loaded = [];
    for (final path in _projectAssetPaths) {
      final jsonStr = await rootBundle.loadString(path);
      final Map<String, dynamic> data = json.decode(jsonStr);
      loaded.add(Project.fromJson(data));
    }
    return loaded;
  }
}
