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


  //sign in with username and password


  //register with usernaame and password


  //sign out 
}

