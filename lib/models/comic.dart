import 'chapter.dart';

class Comic {
  String? name, image;
  List<String>? categories = [];
  List<Chapter>? chapters = [];

  Comic({
    required this.name,
    required this.image,
    this.categories,
    this.chapters,
  });

  Comic.fromJson(Map<String, dynamic> map) {
    name = map['Name'] ?? 'Default Comic';
    image = map['Image'] ??
        'https://upload.wikimedia.org/wikipedia/vi/4/4f/Dragon_Ball_Super_artwork.jpg';
    categories = map['Category'] ?? [];
    if (map['Chapters'] != null) {
      chapters = map['Chapters']
          .map<Chapter>((jsonChapter) => Chapter.fromJson(jsonChapter))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'Chapters': chapters?.map((chapter) => chapter.toJson()).toList(),
      'Category': categories,
      'Image': image,
      'Name': name,
    };
  }

  @override
  String toString() {
    return 'Comic{name: $name, image: $image, categories: $categories, chapters: $chapters}';
  }
}
