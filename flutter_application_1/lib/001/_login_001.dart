import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/register/regis.dart';
import 'package:flutter_application_1/all_information/information.dart';
import 'package:flutter_application_1/login/_login.dart';

class login001 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFieldAndCheckPageState();
}

class TextFieldAndCheckPageState extends State<login001> {
  var _isShowPwd = false; //是否显示密码
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  var focus = false; //设置焦点
  var choosed = true;
  var news = new InforMation();
  var flag = false;

  TextEditingController phoneController = TextEditingController(); // 手机号码的控制器
  TextEditingController passController = TextEditingController(); // 密码的控制器
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录界面'),
        centerTitle: true, //居中
      ),
      // title: Text(),
      body: Column(
        children: <Widget>[
          TextField(
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly, //只允许输入数字
              LengthLimitingTextInputFormatter(11)
            ],
            focusNode: focusNode1,
            controller: phoneController,
            keyboardType: TextInputType.number, //输入数字优先
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0), //内边距
              icon: Icon(Icons.phone),
              labelText: '请输入用户名',
            ),
          ),
          TextField(
            inputFormatters: [
              WhitelistingTextInputFormatter(
                  RegExp("[a-zA-Z]|[0-9]")), //只允许输入数字和字母
              LengthLimitingTextInputFormatter(16)
            ],
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
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  flag = false;
                  if (phoneController.text.length != 11) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('手机号格式不对'),
                            ));
                    focus = true;
                    phoneController.clear();
                  } else if (!news.usename.contains(phoneController.text)) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('账号不存在'),
                            ));
                    focus = true;
                    phoneController.clear();
                  } else if (passController.text.length == 0) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('密码不能为空'),
                            ));
                    focus = false;
                  } else if (news.password[
                          news.usename.indexOf(phoneController.text)] !=
                      passController.text) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('密码错误'),
                            ));
                    focus = false;
                    passController.clear();
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('登录成功'),
                            ));
                    flag = true;
                    phoneController.clear(); //清楚账号文本
                    passController.clear(); //清楚密码文本
                  }
                  FocusScope.of(context) //光标停留位置
                      .requestFocus(focus ? focusNode1 : focusNode2); //焦点切换
                  if (flag) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }
                },
                child: Text(
                  '登录',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              RaisedButton(
                child: Text('注册'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisTer()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
