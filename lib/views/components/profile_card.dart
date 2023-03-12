import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  IconData iconVal;
  String text;
  InfoCard({required this.text,required this.iconVal});


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: ListTile(
        leading: Icon(
          iconVal,
          color: Colors.teal,
        ),
        title: Text(
          text!,
          style: const TextStyle(
            color: Colors.teal,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
