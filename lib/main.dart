import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(),);
  }

}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Practise Module 7 '),),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Orders())) ;
            },
              child: Text('Orders'),),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings())) ;
            }, child: Text('Setting'))
          ],
        ),
      ),
    );
  }
}

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders'),),
      body:
      Center(
        child: ElevatedButton(onPressed: (){
          // Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings())) ;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Settings())) ;

        },child: Text('Setting'),),
      ),

    );

  }
}
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),),
      body:
      Center(
        child: ElevatedButton(onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())) ;
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>HomeScreen()), (route) => false);//true kore dile ar aager route theke jabe 

        },child: Text('Home Button'),),
      ),
    );
  }
}


