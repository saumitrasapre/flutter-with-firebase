import 'package:cupped_lightning/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

 final FirebaseAuth _auth=FirebaseAuth.instance;

 //create user object based on the FirebaseUser object
 User _userFromFirebaseUser(FirebaseUser user)
  {
    if(user!=null)
    {
      return User(uid: user.uid);
    }
    else
    {
      return null;
    }
  }

  //auth changed user stream
  
  Stream<User> get user{
    return _auth.onAuthStateChanged.map((FirebaseUser user)
    {
      return _userFromFirebaseUser(user);
    });
    //.map(_userFromFirebaseUser);
  }
  //sign in anonymously

  Future signInAnonymous() async{

    try{

      AuthResult result=await _auth.signInAnonymously();
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);

    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
  //register with email & password

  Future registerWithEmailAndPassword(String email, String password) async {
    try
    {
    AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user=result.user;
    return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password

  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);

    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //sign out

  Future signOut() async{
    
    try{

      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}

