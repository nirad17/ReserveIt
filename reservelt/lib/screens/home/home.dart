import "package:flutter/material.dart";
import 'package:reservelt/services/auth.dart';
import 'package:reservelt/shared/constants.dart';
import 'package:reservelt/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservelt/screens/home/reserve_list.dart';

class Home extends StatefulWidget {

  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth=AuthService();
  String name,sex,city,locality;

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context,builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: Text("Settings"),
        );
      });
    }
    return StreamProvider<QuerySnapshot>.value(
      value: Database().brews,
      child: Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        centerTitle: false,
        title: Text('Reservelt'),
        backgroundColor: Colors.indigo[500],
        elevation: 5.0,
        actions: <Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label: Text('Log out'),
            onPressed: () async {
              await _auth.signOut();
            },
            ),
          FlatButton.icon(
            icon:Icon(Icons.settings),
            label: Text(''),
            onPressed: () => _showSettingsPanel()
            )
        ],
        ),
        //body: ReserveList()
         body:Container(
          padding:EdgeInsets.symmetric(vertical: 20.0,horizontal:50.0),
          child: Form(
            //key:,
            child:Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  
                  decoration: textInputDecoration.copyWith(hintText: 'What should we call you?'),
                  validator: (val) => val.isEmpty ? 'Enter name ':null,
                  onChanged: (val) {
                    setState(() => name=val);
                    
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Which City you live in?'),
                  validator: (val) => val.isEmpty ? 'Please enter your City!':null,
                  onChanged: (val) {
                    setState(() => city=val);
                   
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'In which locality'),
                  validator: (val) => val.isEmpty ? 'Kindly give locality!':null,
                  onChanged: (val) {
                    setState(() => locality=val);
                  },
                  
                ),
              ],
              )
              )
        )
       )
       
    );
    
  }
}
