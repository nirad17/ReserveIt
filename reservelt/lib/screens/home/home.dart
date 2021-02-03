import "package:flutter/material.dart";
import 'package:reservelt/services/auth.dart';
import 'package:reservelt/shared/constants.dart';

class Home extends StatelessWidget {

  final AuthService _auth=AuthService();
  String name,sex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: Text('Reservelt'),
        backgroundColor: Colors.indigo[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label: Text('Log out'),
            onPressed: () async {
              await _auth.signOut();

            },)
        ],
        ),
        body:Container(
          padding:EdgeInsets.symmetric(vertical: 20.0,horizontal:50.0),
          child: Form(
            //key:,
            child:Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Name'),
                  validator: (val) => val.isEmpty ? 'name':null,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: ''),
                  validator: (val) => val.isEmpty ? 'name':null,
                ),
              ],
              )
              )
        )
        );
  }
}