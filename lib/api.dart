import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class apiTest extends StatefulWidget {
  const apiTest({super.key});

  @override
  State<apiTest> createState() => _apiTestState();
}

class _apiTestState extends State<apiTest> {

  final TextEditingController birthday = TextEditingController();

   Map<String,dynamic>? map;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
          title: Text("Api Test",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: birthday,
                decoration: InputDecoration(
                    label: Text("生日")
                ),
              ),
              ElevatedButton(onPressed: (){
                fetchData();
              },
                  child: Text("开始测试")),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                color: Colors.blueGrey,
                child: Text(
                  map != null ? "年齢 :" + map!["age"].toString() : '',textAlign: TextAlign.center,style: TextStyle(color: Colors.lime),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Colors.blueGrey,
                child: Text(
                  map != null ? "生肖 :" + map!["animal"] : '',textAlign: TextAlign.center,style: TextStyle(color: Colors.lime),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Colors.blueGrey,
                child: Text(
                  map != null ? "星座 :" + map!["constellation"] : '',textAlign: TextAlign.center,style: TextStyle(color: Colors.lime),
                ),
              ),
            ],
          ),
        )
    );
  }
  void fetchData() async{
    var dio = Dio();
    String birthdayStr = birthday.text;
    print(birthdayStr);
    final response = await dio.get("https://zj.v.api.aa1.cn/api/Age-calculation/",
        queryParameters: {"birthday" : birthdayStr});
    map = response.data;
    print(map);
    // print(map);
    setState(() {
      map;
    });
  }
}
