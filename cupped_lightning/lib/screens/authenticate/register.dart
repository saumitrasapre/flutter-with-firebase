import 'package:cupped_lightning/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleFunc;
  Register({this.toggleFunc});

  @override
  _RegisterState createState() => _RegisterState();
}
//text field state
   String email='';
   String password='';
   String error='';
class _RegisterState extends State<Register> {

   final AuthService _authService= AuthService();
   final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        title: Text('Sign Up'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleFunc();
            },
             icon: Icon(
               Icons.person
             ),
              label: Text('Sign In')
              )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0 ,horizontal:50.0) ,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (value){
                  if(value.isEmpty)
                  {
                    return 'Email field cannot be empty';
                  }
                  else
                  {
                    return null;
                  }
                },
                onChanged: (value){
                  setState(() {
                    email=value;
                  });
                },

              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (value){
                  if(value.length<6)
                  {
                    return 'Password should be at least 6 chars long';
                  }
                  else
                  {
                    return null;
                  }
                },
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
                  if(_formKey.currentState.validate())
                  {
                    dynamic result= await _authService.registerWithEmailAndPassword(email, password);
                    if(result==null)
                    {
                      setState(() {
                        error='Registration failed';
                      });
                    }
                  }
                },
                color: Colors.pink,
                child: Text('Register'),
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0
                  ),
                  )
              
            ],
            )
          )
      ),
    );
  }
}
