import 'package:cupped_lightning/models/cup.dart';
import 'package:cupped_lightning/screens/home/cup_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class CupList extends StatefulWidget {
  @override
  _CupListState createState() => _CupListState();
}

class _CupListState extends State<CupList> {
  @override
  Widget build(BuildContext context) {

    final cups=Provider.of<List<Cup>>(context);
    //print(cups.documents);
    // cups.forEach((cup) { 

    //   print(cup.name);
    //   print(cup.sugar);
    //   print(cup.strength);
    // });
    return ListView.builder(
      itemCount: cups.length,
      itemBuilder: (context,index){
        return CupTile(cup: cups[index]);
      },
      );
  }
}