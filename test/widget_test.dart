// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility that Flutter provides. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
import 'package:final_comic_reader/models/custom_user.dart';
import 'package:final_comic_reader/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:final_comic_reader/main.dart';

void main() {
  testWidgets('Create user in firestore', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(const App());

    late FirebaseFirestore db;

    Firebase.initializeApp().whenComplete(() {
      db = FirebaseFirestore.instance;
    });
    // WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();

    CustomUser user = CustomUser(name: 'Vince', id: 'id1');

    db.collection("users").add(user.toJson()).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
    int lenDB = 0;
    await db.collection("users").get().then((event) {
      lenDB = event.docs.length;
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });

    expect(lenDB, 2);
  });
}

// // Verify that our counter starts at 0.
// expect(find.text('0'), findsOneWidget);
// expect(find.text('1'), findsNothing);
//
// // Tap the '+' icon and trigger a frame.
// await tester.tap(find.byIcon(Icons.add));
// await tester.pump();
//
// // Verify that our counter has incremented.
// expect(find.text('0'), findsNothing);
// expect(find.text('1'), findsOneWidget);
