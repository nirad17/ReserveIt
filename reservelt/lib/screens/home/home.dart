import "package:flutter/material.dart";
import 'package:reservelt/services/auth.dart';
import 'package:reservelt/shared/constants.dart';
import 'package:reservelt/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {

  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth=AuthService();
  String name,sex;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: Database().brews,
      child: Scaffold(
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
        body: ReserveList()
        body:Container(
          padding:EdgeInsets.symmetric(vertical: 20.0,horizontal:50.0),
          child: Form(
            //key:,
            child:Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Enter Name'),
                  validator: (val) => val.isEmpty ? 'name':null,
                  onChanged: (val) {
                    setState(() => name=val);
                  },
                ),
                SizedBox(height: 20.0),

                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Your locality'),
                  validator: (val) => val.isEmpty ? 'locality':null,
                ),
              ],
              )
              )
        )
        )
    );
  }
}