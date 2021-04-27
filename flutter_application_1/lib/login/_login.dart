import 'package:flutter/material.dart';
import 'package:flutter_application_1/all_information/information.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFieldAndCheckPageState();
}

class TextFieldAndCheckPageState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('主界面'),
          centerTitle: true, //居中
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                width: 1000,
                height: 800,
                decoration: new BoxDecoration(
                    // color: Colors.white,
                    border: new Border.all(width: 1, color: Colors.blue)),
                child: Text('个人主界面'),
              ),
            )
          ],
        ));
  }
}
