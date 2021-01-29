import 'package:flutter/material.dart';
import 'package:reservelt/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();

  String email='',password='',error='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
          title: Text('Sign up to Reservelt'),
          actions: <Widget>[
            FlatButton.icon(
              icon:Icon(Icons.person),
              label: Text('Sign in'),
              onPressed: () {
                widget.toggleView(); 
              }
            )
          ],
          backgroundColor: Colors.indigo[400],
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal:50.0),
          child: Form( 
            key: _formKey,
            child:Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an email':null,
                  onChanged: (val) {
                    setState(() => email =val);
                  }
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.length<6 ? 'Enter a password >6+ chars':null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password =val);
                  },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()){
                        dynamic result=_auth.registerWithEmailAndPassword(email,password);
                        if (result==null){
                          setState(() => error='enter valid email!');
                        }
                      }
                    },
                    color:Colors.red[800],
                    child:Text(
                      'Register',
                      style: TextStyle(color:Colors.white),
                  )
                ),
              ],)
          )
          ),
    );
  }
}
