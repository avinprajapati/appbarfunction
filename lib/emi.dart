import 'dart:math';

import 'package:flutter/material.dart';
void main()
{
  runApp(
      MaterialApp(
        home: home(),
        debugShowCheckedModeBanner: false,
      )
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  double amo = 0;
  double intr = 0;
  double intr1 = 0;
  double year = 0;
  double year1 = 0;
  double amount = 10000;
  double instal=0;
  double totl_intr=0;
  double total=0;
  // get()
  // {
  //   //E = P x R x (1+r)^n/((1+r)^N – 1
  //   // instal = amo * intr/12/100 *(1+intr/12/100)*year/12 / (1+intr/12/100)*year/12 -1;
  //   // instal = 1000000 * 0.006 * (1 + 0.006)*120 / ((1 + 0.006)*120-1);
  //    intr1 = intr/12/100;
  //    year1 = year*12;
  //    instal = (amo * intr1 * pow((1+intr1), year1) / (pow((1+intr1), year1) -1));
  //    print(instal.toStringAsFixed(0));
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loan Amount"),
      ),
      body: Column(
        children: [
          Text(
            "Home Loan Amount",
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
            child: Center(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2, color: Colors.black)),
                child: Text(
                  "${amo.toStringAsFixed(0)}", style: TextStyle(fontSize: 20),),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100000,
            divisions: 10,
            value: amo,
            onChanged: (value) {
              // print(amo.toStringAsFixed(0));
              amount = amo;
              setState(() {
                amo = value;
                intr1 = intr/12/100;
                year1 = year*12;
                instal = (amo * intr1 * pow((1+intr1), year1) / (pow((1+intr1), year1) -1));
                // totl_intr = amo*intr/100* year;
                totl_intr = instal*year1 - amo;
                total = amo+totl_intr;
                print(totl_intr);
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Intrest Rate",
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
            child: Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  child: Text("${intr.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 20),),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2, color: Colors.black)),
                )),
          ),
          Expanded(
            child: Slider(
              min: 0,
              max: 20,
              value: intr,
              divisions: 20,
              onChanged: (value) {
                print(intr.toStringAsFixed(2));
                amount = intr;
                intr = value;
                intr1 = intr/12/100;
                year1 = year*12;
                instal = (amo * intr1 * pow((1+intr1), year1) / (pow((1+intr1), year1) -1));
                totl_intr = amo*intr/100* year;
                totl_intr = instal*year1 - amo;
                total = amo+totl_intr;
                print(totl_intr);
                setState(() {});
              },
            ),
          ),
          Text(
            "Loan Year",
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
            child: Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  child: Text("${year.toStringAsFixed(1)}",
                    style: TextStyle(fontSize: 20),),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2, color: Colors.black)),
                )),
          ),
          Expanded(
            child: Slider(
              min: 0,
              max: 20,
              value: year,
              divisions: 20,
              onChanged: (value) {
                print(year.toStringAsFixed(2));
                //amount = year;
                year = value;
                intr1 = intr/12/100;
                year1 = year*12;
                instal = (amo * intr1 * pow((1+intr1), year1) / (pow((1+intr1), year1) -1));
                //totl_intr = amo*intr/100 * year;
                totl_intr = instal*year1 - amo;
                total = amo+totl_intr;
                // print(totl_intr);
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text("EMi AMount", style: TextStyle(fontSize: 20),),
              Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    child: Text("${instal.toStringAsFixed(0)}",style: TextStyle(fontSize: 25),),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2, color: Colors.black)),
                  )),
            ],),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text("Total Inrest Payable", style: TextStyle(fontSize: 20),),
              Center(
                  child: Container(
                    child: Text("${totl_intr.toStringAsFixed(0)}",style: TextStyle(fontSize: 20),),
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2, color: Colors.black)),
                  )),
            ],),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text("Total Payable Amount", style: TextStyle(fontSize: 20),),
              Center(
                  child: Container(
                    child: Text("${total.toStringAsFixed(0)}",style: TextStyle(fontSize: 20),),
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2, color: Colors.black)),
                  )),
            ],),
          )
        ],
      ),
    );
  }
}