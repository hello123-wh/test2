import 'package:flutter/material.dart';
import 'package:flutter_application_1/register/regis.dart';
import 'dart:ui';

// import 'dart:mirrors';
class InforMation {
  List usename = ['11111111111', '22222222222', '33333333333'];
  List password = ['1222222222', '2333333333', '3444444444'];
  List name;
  var sex;
  var age;
  var grade;
}

void main() {
  var p = new InforMation();
  print(p.password.asMap().keys);
}
