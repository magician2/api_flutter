import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class apiTest extends StatefulWidget {
  const apiTest({super.key});

  @override
  State<apiTest> createState() => _apiTestState();
}

class _apiTestState extends State<apiTest> {

  final TextEditingController birthday = TextEditingController();
  String bd = "";

  Map<String,String> birthBox = {
    "code" : "200",
    "msg" : "年齢計算",
    "age" : "",
    "animal" : "",
    "constellation" : ""
  };


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
                  birthBox["age"]!,textAlign: TextAlign.center,style: TextStyle(color: Colors.lime),
                ),
              )

            ],
          ),
        )
    );
  }
  void fetchData() async{
    var dio = Dio();
    String birthdayStr = birthday.text;
    print(birthdayStr);
    var response = await dio.get("https://zj.v.api.aa1.cn/api/Age-calculation/",
        queryParameters: {"birthday" : birthdayStr});
    print(response.statusCode);
    print(response.data.toString());
    setState(() {
      birthBox = response.data;
    });
    if(response.data is Map){
      print("yes");
    }
  }
}
