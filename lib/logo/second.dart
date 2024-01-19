import 'package:appbarfunction/logo/data.dart';
import 'package:appbarfunction/logo/first.dart';
import 'package:appbarfunction/logo/third.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    double Status_bar = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: <Color>[Colors.black, Colors.blue]),
          ),
        ),
        title: Text("LEVEL 1"),
        centerTitle: true,
        actions: [Image(image: AssetImage("img/n_bulb_hints.png"))],
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(top: 10),
        child: Container(
          margin: EdgeInsets.all(20),
          child: GridView.builder(
            itemCount: data.img.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 30, mainAxisSpacing: 30),
            itemBuilder: (context, index) {
              String test=first.prefs!.getString("level$index") ?? "";
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return three(data.img, index);
                    },
                  ));
                },
                child:Container(
                    height: 100,
                    width: 100,
                    child: (test != "yes")
                        ? Image(image: AssetImage("${data.img[index]}"))
                        : Image(image: AssetImage("${data.img[index]}")),
                    decoration: BoxDecoration(
                      image: (test == "yes")
                          ? DecorationImage(
                          alignment: Alignment.bottomLeft,
                          image: AssetImage("img/level_guessed_badge.png"),
                          scale: 5)
                          : DecorationImage(
                        image: AssetImage("${data.img[index]}"),
                      ),
                    )),
              );
            },
          ),
        ),
      ),
    );
  }
}
