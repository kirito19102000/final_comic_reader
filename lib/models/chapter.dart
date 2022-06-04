class Chapter {
  String? name;
  List<String>? links = [];

  Chapter({
    required this.name,
    this.links,
  });

  Chapter.fromJson(Map<String, dynamic> map) {
    name = map['Name'] ?? 'Default chapter name';
    links = map['Links'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Links': links,
      'Name': name,
    };
  }

  @override
  String toString() {
    return 'Chapter{name: $name, links: $links}';
  }
}
