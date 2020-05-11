import 'package:cupped_lightning/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  AuthService _auth=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
      
      title: Text('Cupped Lightning'),
      backgroundColor: Colors.grey[850],
      elevation: 0.0,
      actions: <Widget>[
        FlatButton.icon(
          onPressed: () async{
           await _auth.signOut();
        }, 
        icon: Icon(
          Icons.person,
          color: Colors.grey[200]
        ),
         label: Text(
           'Log Out',
           style: TextStyle(
             color: Colors.grey[200]
           ),
           ),
         )
      ],
      ),
    );
  }
}