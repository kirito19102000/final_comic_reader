class CustomUser {
  final String id;
  String name;
  List<String>? subscribedComics = [];

  CustomUser({required this.id, required this.name, this.subscribedComics});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subscribedComics': subscribedComics,
    };
  }

  void subscribeToComic(String comicId) {
    subscribedComics?.add(comicId);
  }

  void unsubscribeComic(String comicId) {
    subscribedComics?.remove(comicId);
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, subscribedComics: $subscribedComics}';
  }
}
