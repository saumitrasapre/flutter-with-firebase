import 'package:cupped_lightning/screens/authenticate/authenticate.dart';
import 'package:cupped_lightning/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //Return either Home or Authenticate widgets
    
    return Authenticate();
  }
}