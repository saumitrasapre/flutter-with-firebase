import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupped_lightning/models/cup.dart';

class DatabaseService{
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference cupCollection =Firestore.instance.collection('lightningCups');

  Future updateUserData(String sugars, String name, int strength) async
  {
    return await cupCollection.document(uid).setData(
      {
        'sugars' : sugars,
        'name':name,
        'strength':strength
      }
    );
  }

  //cup list from snapshot
  List<Cup> _cupListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((document){
      return Cup(
        sugar: document.data['sugars']??'0',
        name: document.data['name']?? '',
        strength: document.data['strength']?? 0);
    }).toList();
  }

  //get lightning cups stream
  Stream <List<Cup>> get cups{
    return cupCollection.snapshots().map(
      (QuerySnapshot snapshot){
        return _cupListFromSnapshot(snapshot);
      });
  }

}