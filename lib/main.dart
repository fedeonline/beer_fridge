import 'package:beer_fridge/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
            stream: FirebaseAuth.instance.onAuthStateChanged),
      ],

      // All data will be available in this child and descendents
      child: MaterialApp(
        title: 'Beer Fridge',
        theme: ThemeData.dark().copyWith(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        home: HomePage(title: 'Beer Fridge'),
      ),
    );
  }
}
