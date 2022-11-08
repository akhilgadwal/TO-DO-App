import 'package:flutter/material.dart';
import 'package:to_do/utlis/todotile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List toDolist = [
    ['Coding', false],
    ['Excercie', false],
  ];
//method for checkbox change
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDolist[index][1] = !toDolist[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: Center(
          child: Text(
            'To-Do',
          ),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDolist.length,
        itemBuilder: (context, index) {
          return TodoTile(
              taskName: toDolist[index][0],
              taskCompleted: toDolist[index][1],
              onChanged: (value) => checkBoxChanged(value, index));
        },
        // children: [
        //   TodoTile(
        //     taskName: 'Start Coding',
        //     taskCompleted: false,
        //     onChanged: ((p0) {}),
        //   ),
        //   TodoTile(
        //       taskName: 'Get 8 hr sleep',
        //       taskCompleted: true,
        //       onChanged: ((p0) {})),
        //   TodoTile(
        //       taskName: 'Have Breakfast',
        //       taskCompleted: true,
        //       onChanged: ((p0) {})),
        //   TodoTile(
        //       taskName: 'Excersie', taskCompleted: false, onChanged: ((p0) {})),
        // ],
      ),
    );
  }
}
