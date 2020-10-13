import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calculator'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
          Row(
            children: <Widget>[
              customBtn("1"),
              customBtn("2"),
              customBtn("3"),
              customBtn("+"),
            ],
          ),
          Row(
            children: <Widget>[
              customBtn("4"),
              customBtn("5"),
              customBtn("6"),
              customBtn("-"),
            ],
          ),
          Row(
            children: <Widget>[
              customBtn("7"),
              customBtn("8"),
              customBtn("9"),
              customBtn("*"),
            ],
          ),
          Row(
            children: <Widget>[
              customBtn("C"),
              customBtn("0"),
              customBtn("/"),
              customBtn("="),
            ],
          ),
        ],
      )),
    );
  }

  Widget customBtn(String val) {
    return Expanded(
        child: OutlineButton(
      onPressed: () {
        btnClick(val);
      },
      padding: EdgeInsets.all(25.0),
      child: Text(
        val,
        style: TextStyle(fontSize: 25.0),
      ),
    ));
  }

  String res, text = "", op;
  int num1, num2;
  void btnClick(String newVal) {
    // print(val);
    if (newVal == "C") {
      res = "";
      text = "";
      num1 = num2 = 0;
    } else if ((newVal == "+") ||
        (newVal == "-") ||
        (newVal == "*") ||
        (newVal == "/")) {
      num1 = int.parse(text);
      res = "";
      op = newVal;

      //print(res);
    } else if (newVal == "=") {
      num2 = int.parse(text);
      num1 = (op == "+")
          ? num1 + num2
          : (op == "-")
              ? num1 - num2
              : (op == "*")
                  ? num1 * num2
                  : (op == "/")
                      ? num1 / num2
                      : 0;
      res = num1.toString();
    } else {
      res = text + newVal;
    }

    setState(() {
      text = res;
    });
  }
}
