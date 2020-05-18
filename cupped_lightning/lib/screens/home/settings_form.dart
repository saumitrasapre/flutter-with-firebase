import 'package:cupped_lightning/models/user.dart';
import 'package:cupped_lightning/services/database.dart';
import 'package:cupped_lightning/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:cupped_lightning/shared/constants.dart';
import 'package:provider/provider.dart';


class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey=GlobalKey<FormState>();
  final List<String> sugars=['0','1','2','3','4','5'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;
  
  @override
  Widget build(BuildContext context) {

    final user=Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid:user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData)
        {
          UserData userData=snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your lightning cup',
                  style: TextStyle(
                    fontSize: 18.0
                  )
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.name,
                  decoration:textInputDecoration,
                  onChanged: (value){
                    setState(() {
                    _currentName=value;
                  });},
                  validator: (value){
                    if(value.isEmpty)
                    {
                      return 'Please enter a name';
                    }
                    else
                    {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20.0),
                //dropdown
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: _currentSugars ?? userData.sugars,
                  items: sugars.map((sugar){
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar sugars'),
                    );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      _currentSugars=value;
                    });
                  },
                ),

                //slider
                Slider(
                  min: 100.0,
                  max: 900.0,
                  divisions: 8,
                  activeColor: Colors.brown[_currentStrength ?? userData.strength],
                  inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                  value: (_currentStrength ?? userData.strength).toDouble(),
                  onChanged: (value){
                    setState(() {
                      _currentStrength=value.round();
                    });
                  }
                  ),

                RaisedButton(
                  onPressed:()async{
                    if(_formKey.currentState.validate())
                    {
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentSugars ?? userData.sugars,
                        _currentName ?? userData.name, 
                        _currentStrength ?? userData.strength);
                      Navigator.pop(context);
                    }
                  },
                  color: Colors.pinkAccent,
                  child: Text(
                    'Update',
                  ),
                  )

              ],
            ),
        );
        }
        else{
            return Loading();
        }
        
      }
    );
  }
}
