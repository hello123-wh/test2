import 'package:flutter/material.dart';
import 'package:flutter_application_1/all_information/information.dart';

class RegisTer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFieldAndCheckPageState();
}

class TextFieldAndCheckPageState extends State<RegisTer> {
  var _isShowPwd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册界面'),
        centerTitle: true, //居中
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 350,
              height: 30,
              decoration: new BoxDecoration(
                  // color: Colors.white,
                  border: new Border.all(width: 1, color: Colors.blue)),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '昵称',
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 350,
              height: 30,
              decoration: new BoxDecoration(
                  // color: Colors.white,
                  border: new Border.all(width: 1, color: Colors.blue)),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '密码',
                  suffixIcon: IconButton(
                    icon: Icon(
                        (_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isShowPwd = !_isShowPwd;
                      });
                    },
                  ),
                ),
                obscureText: !_isShowPwd,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 350,
              height: 30,
              decoration: new BoxDecoration(
                  // color: Colors.white,
                  border: new Border.all(width: 1, color: Colors.blue)),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '电话',
                ),
              ),
            ),
          ),
          RaisedButton(
            child: Text('注册'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('注册成功'),
                      ));
            },
          )
        ],
      ),
    );
  }
}
