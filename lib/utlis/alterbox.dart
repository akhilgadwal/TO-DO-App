import 'package:flutter/material.dart';
import 'package:to_do/utlis/button.dart';

class DBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 150,
        //creating Text - filed for new entry by user
        //Textfiled
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add New Task...',
                hintStyle: TextStyle(fontFamily: 'Beabus', fontSize: 20)),
          ),
          //Button for saving and cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save button
              Mybuttons(text: 'Save', onPressed: onSave),
              //sizedbox
              SizedBox(
                width: 10,
              ),
              //cancel button
              Mybuttons(text: 'Cancel', onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}
