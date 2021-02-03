import 'package:flutter/material.dart';
import 'package:reservelt/services/auth.dart';
import 'package:reservelt/shared/loading.dart';
import 'package:reservelt/shared/constants.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;
  //text field state

  String email='',error='';
  String password='';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
          title: Text('Sign in to Reservelt'),
          actions: <Widget>[
            FlatButton.icon(
              icon:Icon(Icons.person),
              label: Text('Register'),
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
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an email':null,
                  onChanged: (val) {
                    setState(() => email =val);
                  }
                ),
                SizedBox(height: 20.0),
                TextFormField(
                 decoration: textInputDecoration.copyWith(hintText: 'Password'),
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
                        setState(() => loading=true);
                      dynamic result=_auth.signInWithEmailAndPassword(email,password);
                        if (result==null){
                          setState(() { 
                            error='Sign in failed';
                            loading=false;
                            });
                        }
                      }
                    },
                    color:Colors.red[800],
                    child:Text(
                      'Sign In',
                      style: TextStyle(color:Colors.white),
                  )
                ),
                SizedBox(height: 12.0,),
                Text(
                  error,),
              ],)
          )
          ),
    );
  }
}