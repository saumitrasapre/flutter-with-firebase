import 'package:cupped_lightning/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

   final AuthService _authService= AuthService();

  //text field state
   String email=' ';
   String password=' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        title: Text('Sign Up'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0 ,horizontal:50.0) ,
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value){
                  email=value;
                },

              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (value){
                  password=value;
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: ()async
                {
                  print(email);
                  print(password);
                },
                color: Colors.pink,
                child: Text('Register'),
                ),
              
            ],
            )
          )
      ),
    );
  }
}
