import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/utlis/todotile.dart';

import '../utlis/alterbox.dart';

// import '../utlis/alterbox.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// final _controller = TextEditingController();

// class _HomepageState extends State<Homepage> {
//   //reference hive
//   final _mybox = Hive.box('mybox');
//   //Controller
//   ToDoDataBase db = ToDoDataBase();
//   // List toDolist = [
//   //   ['Coding', false],
//   //   ['Excercie', false],
//   // ];

//   @override
//   void initState() {
//     //if the application is running for the 1 time
//     if (_mybox.get('TOODOLIST') == null) {
//       db.creationInitData();
//     } else {
//       db.loadData();
//     }
//     super.initState();
//   }

// //method for checkbox change
//   void checkBoxChanged(bool? value, int index) {
//     setState(() {
//       db.toDolist[index][1] = !db.toDolist[index][1];
//     });
//     db.updateData();
//   }

// // //creating new method ofr savenewtask
// //   void saveNewTask() {
// //     setState(() {
// //       db.toDolist.add([_controller.text, false, _controller.clear()]);
// //       Navigator.of(context).pop();
// //       db.updateData();
// //     });
// //   }

// //create alertbox function
//   void createNewTask() {
//     showDialog(
//       context: context,
//       builder: ((context) {
//         return DBox(
//           controller: _controller,
//           onSave: saveNewTask,
//           onCancel: () => Navigator.of(context).pop(),
//         );
//         Navigator.of(context).pop();
//       }),
//     );
//   }

//   //delete function
//   void deleteTask(int index) {
//     setState(() {
//       db.toDolist.removeAt(index);
//     });
//     db.updateData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.yellow.shade200,
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             'To-Do',
//             style: TextStyle(fontFamily: 'Beabus', fontSize: 30),
//           ),
//         ),
//         elevation: 0,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: createNewTask,
//         child: Icon(
//           Icons.add,
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: db.toDolist.length,
//         itemBuilder: (context, index) {
//           return TodoTile(
//             taskName: db.toDolist[index][0],
//             taskCompleted: db.toDolist[index][1],
//             onChanged: (value) => checkBoxChanged(value, index),
//             deleteFunction: (context) => deleteTask(index),
//           );
//         },
//         // children: [
//         //   TodoTile(
//         //     taskName: 'Start Coding',
//         //     taskCompleted: false,
//         //     onChanged: ((p0) {}),
//         //   ),
//         //   TodoTile(
//         //       taskName: 'Get 8 hr sleep',
//         //       taskCompleted: true,
//         //       onChanged: ((p0) {})),
//         //   TodoTile(
//         //       taskName: 'Have Breakfast',
//         //       taskCompleted: true,
//         //       onChanged: ((p0) {})),
//         //   TodoTile(
//         //       taskName: 'Excersie', taskCompleted: false, onChanged: ((p0) {})),
//         // ],
//       ),
//     );
//   }
// }
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.creationInitData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updateData();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(
          child: Text(
            'TO DO',
            style: TextStyle(fontFamily: 'Beabus', fontSize: 25),
          ),
        ),
        actions: [IconButton(onPressed: aboutDialog, icon: Icon(Icons.info))],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDolist.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDolist[index][0],
            taskCompleted: db.toDolist[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }

  aboutDialog() async {
    showAboutDialog(
        context: context,
        applicationName: 'To-Do Application',
        // applicationIcon: Image.asset(
        //   'images/appstore.png',
        //   height: 50,
        //   width: 50,
        // ),
        applicationVersion: '1.0.0',
        children: [
          const Text('Developed by : Mohd Akhil\nDate : 11-9-2022'),
        ]);
  }
}
