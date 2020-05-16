import 'package:cupped_lightning/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleFunc;
  SignIn({this.toggleFunc});
  @override
  _SignInState createState() => _SignInState();
}
//text field state
   String email=' ';
   String password=' ';
class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {

   final AuthService _authService= AuthService();
  
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleFunc();
            },
             icon: Icon(
               Icons.person_add
             ),
              label: Text('Register')
              )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0 ,horizontal:50.0) ,
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    email=value;
                  });
                  
                },

              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (value){
                  setState(() {
                    password=value;
                  });
                  
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
                child: Text('Sign In'),
                ),
                
              
            ],
            )
          )
        /*RaisedButton(
          onPressed: () async{

            dynamic result =await _authService.signInAnonymous();

            if(result==null)
            {
              print("Error Signing In");
            }
            else
            {
              print("Sign In Successful");
              //print(result.uid);
            }

          },
          child: Text('Sign In Anonymously'),
        ),
        */
      ),
    );
  }
}