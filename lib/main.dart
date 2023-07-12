


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyApiExample(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyApiExample extends StatefulWidget {
  const MyApiExample({super.key, required this.title});

 
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyApiExampleState createState() => _MyApiExampleState();
}

class _MyApiExampleState extends State<MyApiExample> {

  String name = "amr";
  int age = 22;
  String phone = '12121212';
  String country = "New Zealand";
  String location = "cairo, cairo";
  String email = "you@gmail.com";



bool awaitData = true;

  getDataFromApi() async {
    Response  response = await Dio()
        .get("https://randomuser.me/api/?results=1");
      //print(response.data); 
awaitData = false;
setState(() {
  
    name = response.data['results'][0]['name']['first'];
    phone = response.data['results'][0]['phone'];
    location = response.data['results'][0]['location']['city'];
    email = response.data['results'][0]['email'];
});
      print('Name: $name');
      print('Location: $location');
      print('Phone: $phone');
      print('Email: $email');
  }
  @override
  void initState(){
    super.initState();
    getDataFromApi();
  }
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:
        awaitData? 
         Center(child: CircularProgressIndicator(color: Colors.lightBlueAccent,),)
        :
      SafeArea(
          child: Center(
            child: Column(
             
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(name),
                const SizedBox(
                  height: 20,
                ),
                Text(phone),
                SizedBox(
                  height: 20,
                ),
                Text(location),
                SizedBox(
                  height: 20,
                ),
                Text(email),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: (){
                  getDataFromApi();
                }, child: const Text('Get data!'),)
              ],
            ),
          ),
        ),
      );
  }
}

