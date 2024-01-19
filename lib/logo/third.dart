import 'dart:math';

import 'package:appbarfunction/logo/first.dart';
import 'package:appbarfunction/logo/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class three extends StatefulWidget {
  // const three({super.key});
  List list;
  int index;

  three(this.list, this.index);

  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  List<String> ans = [
    "FACEBOOK",
    "MERCEDES",
    "ADIDAS",
    "REDBULL",
    "STARBUCKS",
    "TOYOTA",
    "MCDONALDS",
    "GOOGLE",
    "SHALL",
    "HELLOCUTE",
    "HYUNDAI",
    "AMAZON",
    "DELL",
    "LOCOSTE",
    "VOLKSWAGEN",
    "DROPBOX",
    "NIKE",
    "BURGERKING",
    "VISA",
    "APPLE",
    "LOUISVUITTON",
    "AUDI",
    "CITROEN",
    "INTEL",
    "BARBIE",
    "WIKIPEDIA",
  ];
  List<String> random_op = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  List temp = [];
  List temp1 = [];
  int levelNo = 0;
  List user_ans = [];
  List option = [];
  List abc = [];
  List abc2 = [];
  List hint_later = [];
  int point=0;

  PageController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    levelNo = widget.index;
    point=first.prefs!.getInt('point') ?? 0;
    get();
  }

  get() {
    controller = PageController(initialPage: levelNo);
    user_ans = List.filled(ans[levelNo].toString().length, "");
    random_op.shuffle();
    option = List.filled(14, "");
    temp = List.filled(user_ans.length, "");
    temp1 = List.filled(user_ans.length, "");

    for (int i = 0; i < user_ans.length; i++) {
      option[i] = ans[levelNo][i];
    }
    for (int i = user_ans.length; i < 14; i++) {
      option[i] = random_op[i];
    }
    option.shuffle();
    setState(() {});
  }
  hint(){
    int r = Random().nextInt(user_ans.length);
    abc = List.filled(user_ans.length, "");
    if(point>0)
    {
      point=point-10;
      first.prefs!.setInt('point',point);
      for (int i = 0;
      i < ans[levelNo].length;
      i++) {
        abc[i] = ans[levelNo][i];
      }
      user_ans[r] = abc[r];
      for (int i = 0; i < option.length; i++) {
        if (abc[r] == option[i]) {
          temp[r] = i;
          temp1[r] = true;
          option[i] = "";
          won_ans();
          break;
        }
      }
      setState(() {});
    }else{
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:
            Text("not valid point"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ok"))
            ],
          );
        },
      );
    }
  }
  hint2(){
    int r = Random().nextInt(user_ans.length);
    int r1 = Random().nextInt(user_ans.length);
    abc = List.filled(user_ans.length, "");
    abc2 = List.filled(user_ans.length, "");
    if(point>0)
    {
      point=point-20;
      first.prefs!.setInt('point',point);
      for (int i = 0;
      i < ans[levelNo].length;
      i++) {
        abc[i] = ans[levelNo][i];
      }
      user_ans[r] = abc[r];
      for (int i = 0; i < option.length; i++) {
        if (abc[r] == option[i]) {
          temp[r] = i;
          temp1[r] = true;
          option[i] = "";
          won_ans();
          break;
        }
      }
      user_ans[r1] = abc2[r1];
      for (int i = 0; i < option.length; i++) {
        if (abc2[r1] == option[i]) {
          temp[r1] = i;
          temp1[r1] = true;
          option[i] = "";
          won_ans();
          break;
        }
      }
      hint_later=abc+abc2;
      setState(() {});
    }else{
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:
            Text("not valid point"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ok"))
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          child: Scaffold(
            appBar: AppBar(
              title: Text("logo ${levelNo + 1}/${widget.list.length}"),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blue.shade900, Colors.blue.shade400]),
                ),
              ),
              actions: [
                Container(
                  width: 40,
                  height: 50,
                  decoration: BoxDecoration(
                    // color: Colors.cyanAccent,
                      image: DecorationImage(
                          image: AssetImage("img/n_bulb_hints.png"))),
                ),
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  child: Text("${point} Hints"),
                ),
              ],
            ),
            body: PageView.builder(
              onPageChanged: (value) {
                levelNo = value;
                get();
                setState(() {});
              },
              controller: controller,
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                String test = first.prefs!.getString("level$index") ?? "";
                return (test == "yes")
                    ? Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                              // margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${widget.list[index]}"))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${ans[widget.index]}",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "img/game_complete_background_green.png"))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Text("2 x perfect in a row!",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text("Next points +20%",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 70,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "img/n_circle_points_green.png"),
                                            ),
                                          ),
                                          child: Text("22",
                                              style: TextStyle(fontSize: 20)),
                                        ),
                                        InkWell(
                                          // onTap: () {
                                          //   point = point + 10;
                                          //   home.prefs!.setInt('point', point);
                                          //   home.prefs?.setString(
                                          //       'level${widget.ind}', "yes");
                                          //   widget.ind++;
                                          //   controller!.animateToPage(
                                          //       widget.ind,
                                          //       duration: Duration(seconds: 1),
                                          //       curve: Curves.linear);
                                          //   setState(() {});
                                          // },
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "img/game_button_next.png"))),
                                            child: Text("NEXT",
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Colors.white)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Text("")),
                  ],
                )
                    : Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                if (levelNo > 0) {
                                  levelNo--;
                                }
                                controller!.jumpToPage(levelNo);
                                setState(() {});
                              },
                              child:
                              Icon(Icons.arrow_back_ios_sharp, size: 40)),
                          Expanded(
                            flex: 6,
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${widget.list[index]}"))),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                if (levelNo < widget.list.length - 1) {
                                  levelNo++;
                                }
                                controller!.jumpToPage(levelNo);
                                setState(() {});
                              },
                              child: Icon(Icons.arrow_forward_ios_sharp,
                                  size: 40)),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: List.generate(
                              user_ans.length,
                                  (index) => InkWell(
                                onTap: () {
                                  if (user_ans[index] != "") {
                                    option[temp[index]] = user_ans[index];
                                    user_ans[index] = "";
                                    if (temp1[index] == false) {
                                      option[temp[index]] = user_ans[index];
                                      user_ans[index] = "";
                                    }
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            (temp1[index] == true)
                                                ? Colors.black12
                                                : Colors.black54,
                                            Colors.black26
                                          ]),
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(color: Colors.grey)),
                                  child: Text("${user_ans[index]}"),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 3,
                            child: InkWell(
                              onTap: () {
                                showDialog(context: context, builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"))
                                    ],
                                    title: Container(
                                        alignment: Alignment.center,
                                        height: 100,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                          Expanded(
                                            child: Row(children: [
                                              InkWell(onTap: () {
                                               hint();
                                              },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color:
                                                      Colors.green.shade800,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                  child:  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text("randome letter",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                      Image.asset(
                                                          "img/n_bulb_hints.png"),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ]),
                                          ),
                                          Expanded(
                                            child: Row(children: [
                                              InkWell(onTap: () {
                                                hint2();
                                              },
                                                child: Container(
                                                  margin: EdgeInsets.all(5),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color:
                                                      Colors.green.shade800,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text("randome letter 2",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                      Image.asset(
                                                          "img/n_bulb_hints.png"),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ]),
                                          ),
                                          Expanded(
                                            child: Row(children: [
                                              InkWell(onTap: () {
                                                  if(point>0) {
                                                    point = point - 30;
                                                    for (int i = 0; i <
                                                        option.length; i++) {
                                                      option[i] = '';
                                                    }
                                                    for (int i = 0; i <
                                                        user_ans.length; i++) {
                                                      option[i] =
                                                      ans[levelNo][i];
                                                    }
                                                    option.shuffle();
                                                    setState(() {});
                                                  }
                                                  else{
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title:
                                                          Text("not valid point"),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(context);
                                                                },
                                                                child: Text("ok"))
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                              },
                                                child: Container(
                                                  margin: EdgeInsets.all(5),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color:
                                                      Colors.green.shade800,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text("remove extra latter",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                      Image.asset(
                                                          "img/n_bulb_hints.png"),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ]),
                                          ),
                                        ],)
                                    ),
                                  );
                                },);
                              },
                              child: Container(
                                height: 50,
                                width: 70,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.fromLTRB(50, 10, 5, 10),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      tileMode: TileMode.repeated,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.green.shade400,
                                        Colors.green.shade900
                                      ]),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("   "),
                                      Expanded(
                                          flex: 2,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  "img/n_bulb_hints.png"))),
                                      Text("   Use Hints   ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25)),
                                    ]),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                for (int i = 0; i < user_ans.length; i++) {
                                  if (user_ans[i] != "") {
                                    option[temp[i]] = user_ans[i];
                                    user_ans[i] = "";
                                  }
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      tileMode: TileMode.repeated,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.pink.shade400,
                                        Colors.pink.shade900
                                      ]),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.close_sharp,
                                    color: Colors.white, size: 50),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                for (int i = temp.length - 1; i >= 0; i--) {
                                  if (temp[i] != '') {
                                    option[temp[i]] = user_ans[i];
                                    temp[i] = "";
                                    user_ans[i] = "";
                                    break;
                                  }
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.fromLTRB(0, 10, 40, 10),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      tileMode: TileMode.repeated,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.pink.shade400,
                                        Colors.pink.shade900
                                      ]),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.arrow_back,
                                    color: Colors.white, size: 50),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: GridView.builder(
                        itemCount: 14,
                        padding: EdgeInsets.all(10),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                        ),
                        itemBuilder: (context, index) {
                          return (option[index] != "")
                              ? InkWell(
                            onTap: () {
                              for (int i = 0;
                              i < user_ans.length;
                              i++) {
                                if (user_ans[i] == "") {
                                  user_ans[i] = option[index];
                                  temp[i] = index;
                                  temp1[i] = false;
                                  option[index] = "";
                                  won_ans();
                                  break;
                                }
                              }
                              setState(() {});
                            },
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Colors.grey.shade500,
                                        Colors.grey.shade200
                                      ]),
                                  borderRadius:
                                  BorderRadius.circular(2),
                                  border:
                                  Border.all(color: Colors.grey)),
                              child: Text("${option[index]}"),
                            ),
                          )
                              : Text("");
                        },
                      ),
                    ),
                    Expanded(flex: 1, child: Text("")),
                  ],
                );
              },
            ),
          ),
          onWillPop: () async {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return second();
              },
            ));
            return true;
          },
        ));
  }

  won_ans() {
    String ans1 = user_ans.join("");
    print(ans1);
    if (ans[levelNo] == ans1) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("WIN!!!"),
            actions: [
              TextButton(
                  onPressed: () {
                    point=point+10;
                    first.prefs!.setInt('point',point);
                    first.prefs!.setString("level$levelNo", "yes");
                    levelNo++;
                    controller!.animateToPage(levelNo,
                        duration: Duration(seconds: 1), curve: Curves.linear);
                    Navigator.pop(context);
                  },
                  child: Text("NEXT"))
            ],
          );
        },
      );
    }
    setState(() {});
  }
}
