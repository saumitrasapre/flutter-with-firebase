import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupped_lightning/models/cup.dart';
import 'package:cupped_lightning/models/user.dart';

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

  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){

    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength']);
  }
  

  //get user data stream
  Stream <UserData> get userData{
    return cupCollection.document(uid).snapshots().map((value){
      return(_userDataFromSnapshot(value));
    });
  }

}