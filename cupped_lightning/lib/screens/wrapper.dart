import 'package:cupped_lightning/models/user.dart';
import 'package:cupped_lightning/screens/authenticate/authenticate.dart';
import 'package:cupped_lightning/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user=Provider.of<User>(context);
    print(user);

    //Return either Home or Authenticate widgets
    
    if(user==null)
    {
      return Authenticate();
    }
    else {
       return Home();
    }

  }
}