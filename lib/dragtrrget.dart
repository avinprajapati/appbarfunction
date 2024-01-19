import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: demo(),
  ));
}

class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  List list = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
  List list1 = [];
  List temp = List.filled(9, true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list1.addAll(list);
    list.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    double tot_width = MediaQuery.of(context).size.width;
    double con_width = (tot_width - 20) / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Games"),
      ),
      body: GridView.builder(
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return (temp[index])
              ? Draggable(
                  onDraggableCanceled: (velocity, offset) {
                    temp = List.filled(9, true);
                    setState(() {});
                  },
                  onDragStarted: () {
                    temp = List.filled(9, false);
                    temp[index] = true;
                    setState(() {});
                  },
                  data: index,
                  child: Container(
                    height: con_width,
                    width: con_width,
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: Text(
                      "${list[index]}",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  feedback: Container(
                    height: con_width,
                    width: con_width,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text(
                      "${list[index]}",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ))
              : DragTarget(
                    onAccept: (data) {
                      temp=List.filled(9, true);
                      var c=list[data as int];
                      list[data as int]=list[index];
                      list[index]=c;
                      if(listEquals(list, list1)){
                        print("Your Are Win");
                      }
                      setState(() {});
                    },
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text(
                        "${list[index]}",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
