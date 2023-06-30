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
  var age;
  var animal;
  var constellation;

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
                  age != null ? "年齢 :" + age.toString() : '',textAlign: TextAlign.center,style: TextStyle(color: Colors.lime),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Colors.blueGrey,
                child: Text(
                  animal != null ? "生肖 :" + animal : '',textAlign: TextAlign.center,style: TextStyle(color: Colors.lime),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Colors.blueGrey,
                child: Text(
                  constellation != null ? "星座 :" + constellation : '',textAlign: TextAlign.center,style: TextStyle(color: Colors.lime),
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
    var response = await dio.get("https://zj.v.api.aa1.cn/api/Age-calculation/",
        queryParameters: {"birthday" : birthdayStr});
    Map<String,dynamic> map = response.data;
    print(map);
    setState(() {
      age = map["age"];
      animal = map["animal"];
      constellation = map["constellation"];
    });
  }
}
