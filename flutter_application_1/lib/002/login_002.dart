import 'package:flutter/material.dart';

class login002 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFieldAndCheckPageState();
}

class TextFieldAndCheckPageState extends State<login002> {
  var _isShowPwd = false; //是否显示密码
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  var focus = false; //设置焦点
  var choosed = true;
  TextEditingController phoneController = TextEditingController(); // 手机号码的控制器
  TextEditingController passController = TextEditingController(); // 密码的控制器
  Widget build(BuildContext context) {
    Container(
      width: 300,
      height: 200,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('输入和选择'),
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: [
            TextField(
              focusNode: focusNode1,
              controller: phoneController,
              keyboardType: TextInputType.number, //输入数字优先
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0), //内边距
                icon: Icon(Icons.phone),
                labelText: '请输入用户名',
              ),
              // autofocus: true,
            ),
            TextField(
              focusNode: focusNode2,
              controller: passController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.lock),
                  labelText: '请输入密码',
                  suffixIcon: IconButton(
                    //设置是否显示密码
                    icon: Icon(
                        (_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isShowPwd = !_isShowPwd;
                      });
                    },
                  )),
              obscureText: !_isShowPwd, //为true隐藏文本内容
            ),
          ],
        ),
      ),
      // Widget xxx = new Container()
    );
  }
}
