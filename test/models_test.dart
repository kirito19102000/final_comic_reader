// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility that Flutter provides. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
import 'package:final_comic_reader/models/chapter.dart';
import 'package:final_comic_reader/models/comic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Model Comic and Chapter test', () {
    Chapter chapter = Chapter(name: 'Pilot', links: ['link1.com', 'link2.com']);
    var chapterJson = chapter.toJson();
    // print(chapterJson);
    expect(chapterJson['Name'], 'Pilot');
    expect(chapterJson['Links'][1], 'link2.com');
    expect(Chapter.fromJson(chapterJson).links?[1], 'link2.com');
    // print(Chapter.fromJson(chapterJson));

    Comic comic = Comic(
        name: 'Beelze',
        image: 'somelink.com',
        categories: ['action', 'comedy'],
        chapters: [chapter, chapter]);
    var comicJson = comic.toJson();

    // print(comicJson);
    expect(comicJson['Category'][1], 'comedy');
    expect(comicJson['Image'], 'somelink.com');
    expect(comicJson['Chapters'].length, 2);
    expect(comicJson['Chapters'][0]['Links'][0], 'link1.com');
    expect(Comic.fromJson(comicJson).categories?[0], 'action');
    expect(Comic.fromJson(comicJson).chapters?[1].links?[1], 'link2.com');
    // print(Comic.fromJson(comicJson));
  });
}

// testWidgets('Create user in firestore', (WidgetTester tester) async {
//   // Build our app and trigger a frame.
//   // await tester.pumpWidget(const App());
//
//   late FirebaseFirestore db;
//
//   Firebase.initializeApp().whenComplete(() {
//     db = FirebaseFirestore.instance;
//   });
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//
//   CustomUser user = CustomUser(name: 'Vince', id: 'id1');
//
//   db.collection("users").add(user.toJson()).then((DocumentReference doc) =>
//       print('DocumentSnapshot added with ID: ${doc.id}'));
//   int lenDB = 0;
//   await db.collection("users").get().then((event) {
//     lenDB = event.docs.length;
//     for (var doc in event.docs) {
//       print("${doc.id} => ${doc.data()}");
//     }
//   });
//
//   expect(lenDB, 2);
// });
