class Project {
  String name;
  String link;
  String description;

  Project({
    required this.name,
    required this.link,
    required this.description,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'] as String,
      link: json['link'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'link': link,
      'description': description,
    };
  }
}
