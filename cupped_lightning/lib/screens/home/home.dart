import 'package:cupped_lightning/models/cup.dart';
import 'package:cupped_lightning/screens/home/cup_list.dart';
import 'package:cupped_lightning/screens/home/settings_form.dart';
import 'package:cupped_lightning/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cupped_lightning/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel()
    {
      showModalBottomSheet(
      context: context,
      builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      }
      );
    }
    return StreamProvider<List<Cup>>.value(
      value: DatabaseService().cups,
          child: Scaffold(
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
           ),
           IconButton(
             onPressed: (){
               _showSettingsPanel();
             },
             icon: Icon(
               Icons.settings
             ),
              )
        ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg_2.png'),
              fit: BoxFit.cover
            )
          ),
          child: CupList()
          ),
      ),
    );
  }
}