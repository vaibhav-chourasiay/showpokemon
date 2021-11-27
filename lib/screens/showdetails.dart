import 'package:flutter/material.dart';

class ShowDetails extends StatefulWidget {
  final details;
  ShowDetails({required this.details});
  static const detailpage = "/details";

  @override
  _ShowDetailsState createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hello World",
        ),
      ),
    );
  }
}
