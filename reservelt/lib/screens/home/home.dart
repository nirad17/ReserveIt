import "package:flutter/material.dart";
import 'package:reservelt/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth=AuthService();
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
        );
  }
}