import 'package:cupped_lightning/services/auth.dart';
import 'package:cupped_lightning/shared/constants.dart';
import 'package:cupped_lightning/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleFunc;
  Register({this.toggleFunc});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //text field state
   String email='';
   String password='';
   String error='';
   bool loading=false;

   final AuthService _authService= AuthService();
   final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
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

                decoration: textInputDecoration.copyWith(hintText: 'Email'),
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
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
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
                    setState(() {
                      loading=true;
                    });
                    dynamic result= await _authService.registerWithEmailAndPassword(email, password);
                    if(result==null)
                    {
                      setState(() {
                        loading=false;
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
