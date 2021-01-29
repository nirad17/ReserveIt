import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservelt/screens/authenticate/authenticate.dart';
import 'package:reservelt/screens/home/home.dart';
import 'package:reservelt/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user=Provider.of<ThisUser>(context);
    print(user);
    //either return home screen or authenticate widget
    if (user==null){
      return Authenticate();
    }
    else{
      return Home();
    }
    
  }
}