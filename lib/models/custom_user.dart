class CustomUser {
  final String id;
  String name;
  List<String> subscribedComics = [];

  CustomUser({required this.id, required this.name});

  void subscribeToComic(String comicId) {
    subscribedComics.add(comicId);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subscribedComics': subscribedComics,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, subscribedComics: $subscribedComics}';
  }
}
