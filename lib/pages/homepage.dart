import 'package:flutter/material.dart';
import 'package:julio_routine/utils/dialog_box.dart';
import 'package:julio_routine/utils/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //text controller
  final _controller = TextEditingController();

  List toDolist = [
    ["Wake up", false],
    ["Greet Grandma", false]
  ];

  //method checkbox was tapped

  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDolist[index][1] = !toDolist[index][1];
    });
  }
  //saves new task
  void saveNewTask(){
    setState(() {
      toDolist.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }
  //create a new task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop()
        );
      }
    );
  }

  //text editing controller



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          "JULIO TIMEPAD",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            //color: Colors.white
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createNewTask,
      ),
      body: ListView.builder(
        itemCount: toDolist.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDolist[index][0], 
            taskCompleted: toDolist[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            );
        },
      ),
    );
  }
}