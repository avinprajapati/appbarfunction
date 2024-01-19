import 'package:appbarfunction/logo/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: first(),
    debugShowCheckedModeBanner: false,
  ));
}

class first extends StatefulWidget {
   static SharedPreferences? prefs;

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    share_pefer();

  }
  share_pefer() async {
    first.prefs = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: [
                      Text(""),
                      Text(""),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "LOGO GAME",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "QUIZ YOUR BRANDS KNOWLEDGE",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("img/main_background_top_logos.png"),
                          fit: BoxFit.fill)),
                )),
            Expanded(
                flex: 10,
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return second();
                                  },
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "PLAY",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                height: 180,
                                width: 180,
                                // margin: EdgeInsets.fromLTRB(90, 20, 90, 70),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(colors: [
                                      Colors.blueAccent.shade400,
                                      Colors.blue.shade900
                                    ])),
                              ),
                            ),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "img/main_button_ranking.png"),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          InkWell(child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "img/main_button_stats.png"),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          InkWell(child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "img/main_button_achievements.png"),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "img/main_background_bottom_logos.png"),
                          fit: BoxFit.fill)),
                ))
          ],
        ),
      ),
    );
  }
}
