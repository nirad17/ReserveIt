import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[100],
      child: Center(
        child: SpinKitWave(
          color: Colors.blue[600],
          size:50.0,
          ),
          ),
    );
  }
}