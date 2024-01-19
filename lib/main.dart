import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController? tabController;
  int cur_tab = 0;
  List str = ["one", "two", "three","four","five","Six","Seven"];
  List str1 = ["one", "two", "three","four","five","Six","Seven"];
  List str2 = ["one", "two", "three","four","five","Six","Seven"];
  List<Widget> tab_class = [one(), two(), three(),four(),five(),six(),seven(),];
  List<Widget> tab_icon = [
    Icon(Icons.home),
    Icon(Icons.account_box),
    Icon(Icons.access_alarm),
    Icon(Icons.access_time),
    Icon(Icons.account_balance),
    Icon(Icons.account_balance_wallet),
    Icon(Icons.add_business_outlined),
    Icon(Icons.input),
    Icon(Icons.add_chart_rounded),
    Icon(Icons.accessibility)

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
        initialIndex: cur_tab,
        animationDuration: Duration(seconds: 1),
        length: str.length,
        vsync: this);
    tabController!.addListener(() {
      cur_tab = tabController!.index;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture:
                Icon(Icons.supervised_user_circle_outlined),
                accountName: Text("DemoName"),
                accountEmail: Text("DemoName@gmail.com")),
            Expanded(
              child: ListTile(
                title:Text("") ,
                onTap: () {
                  cur_tab = 0;
                  tabController!.animateTo(cur_tab);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: true,
          onTap: (value) {
            cur_tab = value;
            setState(() {});
          },
          controller: tabController,
          tabs: str.map((e) {
            int ind = str.indexOf(e);
            return Tab(
              child: Text("${e}"),
              icon: tab_icon[ind],
            );
          }).toList(),),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return str2.map((e){
              return PopupMenuItem(
                child: Text("$e"),
                onTap: () {
                  int ind = str2.indexOf(e);
                  cur_tab=ind;
                  tabController!.animateTo(cur_tab);
                  setState(() {});
                },
              );
            }).toList();
          })
        ],
        title: Text("Demo"),
      ),
      body: TabBarView(
          controller: tabController,children: tab_class ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cur_tab,
        onTap: (value) {
          cur_tab = value;
          tabController!.animateTo(value);
          setState(() {});
        },
        items: str.map((e) {
          int ind = str.indexOf(e);
          return BottomNavigationBarItem(
            icon: tab_icon[ind],
            backgroundColor: Colors.black12,
            label: "${e}",
          );
        }).toList(),
      ),
    );
  }
}

class one extends StatefulWidget {
  const one({super.key});

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.grey,
      child: Text("One"),
    );
  }
}

class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.yellow,
      child: Text("two"),
    );
  }
}

class three extends StatefulWidget {
  const three({super.key});

  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.teal,
      child: Text("three"),
    );
  }
}

class four extends StatefulWidget {
  const four({super.key});

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.green,
      child: Text("four"),
    );
  }
}

class five extends StatefulWidget {
  const five({super.key});

  @override
  State<five> createState() => _fiveState();
}

class _fiveState extends State<five> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.red,
      child: Text("five"),
    );
  }
}

class six extends StatefulWidget {
  const six({super.key});

  @override
  State<six> createState() => _sixState();
}

class _sixState extends State<six> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.pinkAccent,
      child: Text("six"),
    );
  }
}

class seven extends StatefulWidget {
  const seven({super.key});

  @override
  State<seven> createState() => _sevenState();
}

class _sevenState extends State<seven> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.pink,
      child: Text("seven"),
    );
  }
}
