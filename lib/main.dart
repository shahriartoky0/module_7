import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_7/style.dart';

void main ()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(title: 'Form Handling',home: HomeScreen(),);
  }

}
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenUI();
  }
}
class _HomeScreenUI extends State<HomeScreen>
{
  double calculated_bmi =0;
  Map<String , double > bma = {'weight' : 0, 'height' : 0,} ;
  InputonChange (inputKey, inputValue) {
    bma.update(inputKey, (value) => double.parse(inputValue));
  }
  calculate_bmi (){
    calculated_bmi = bma['weight']!/ bma['height']!;

  }
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(title: const Text("Calculating BMA"),centerTitle: true,),
     body:
     Center(
       child: Container(margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
         width: 500,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('Calculate Your BMA',style: HeadlineText(),),
             SizedBox(height: 40,),
           TextFormField(onChanged: (value){InputonChange('weight',value);setState(() {});},decoration: AppInputDecoration('Weight in KG'),),
           SizedBox(height: 10,),
           TextFormField(onChanged: (value){InputonChange('height',value);setState(() {});},decoration: AppInputDecoration('Height in Meter'),),
           SizedBox(height: 20,),
           Container(width:double.infinity,child: ElevatedButton(onPressed: (){
             calculate_bmi();
             setState(() {});
             Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiShow(bmi_number: calculated_bmi)));
             },style: AppButtonStyle(), child: const Text('Submit'),))
         ],),
       ),
     ),
   );
  }
}
class BmiShow extends StatelessWidget{
  double bmi_number = 0;
   BmiShow({super.key, required this.bmi_number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculating BMA"),centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            if (bmi_number > 25)
              Text(
                'Your BMI is $bmi_number, which indicates that you are overweight.',
                style: TextStyle(fontSize: 20),
              )
            else
              Text(
                'Your BMI is $bmi_number, which is within the healthy range.',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }

}