import 'package:flutter/material.dart';
import 'package:cupped_lightning/models/cup.dart';

class CupTile extends StatelessWidget {

  final Cup cup;
  CupTile({this.cup});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child:ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[cup.strength],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(cup.name),
          subtitle: Text('Takes ${cup.sugar} sugar(s)'),
        ),
      ),
    );
  }
}