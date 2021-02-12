import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ReserveList extends StatefulWidget {
  @override
  _ReserveListState createState() => _ReserveListState();
}

class _ReserveListState extends State<ReserveList> {
  @override
  Widget build(BuildContext context) {

    final reserves=Provider.of<List<ReserveList>>(context);
    print(reserves);
    return ListView.builder(
      itemCount: reserves.length,
      itemBuilder: (context,index) {

      },
    );
  }
}
