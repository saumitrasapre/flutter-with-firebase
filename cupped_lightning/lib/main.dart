import 'package:cupped_lightning/models/user.dart';
import 'package:cupped_lightning/screens/wrapper.dart';
import 'package:cupped_lightning/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(

        value: AuthService().user,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        theme: ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.pink,
    accentColor: Colors.pinkAccent,
    textSelectionHandleColor: Colors.pinkAccent
    ),
  )
);

  }
}
