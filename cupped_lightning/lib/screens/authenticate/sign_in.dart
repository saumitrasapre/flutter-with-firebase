import 'package:cupped_lightning/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {

   final AuthService _authService= AuthService();

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        title: Text('Sign In to Cupped Lightning'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0 ,horizontal:50.0) ,
        child: RaisedButton(
          onPressed: () async{

            dynamic result =await _authService.signInAnonymous();

            if(result==null)
            {
              print("Error Signing In");
            }
            else
            {
              print("Sign In Successful");
              print(result.uid);
            }

          },
          child: Text('Sign In Anonymously'),
        ),
      ),
    );
  }
}