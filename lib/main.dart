import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main ()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Shopping', home: HomeScreen(),);
  }

}

class HomeScreen extends StatefulWidget {


  List <dynamic> productDetails =[
    { 'name' : 'Product 1' , 'price' : "100", 'counter': 0},
    { 'name' : 'Product 2' , 'price' : "200",'counter': 0},
    { 'name' : 'Product 3' , 'price' : "1400",'counter': 0},
    { 'name' : 'Product 4' , 'price' : "1040",'counter': 0},
    { 'name' : 'Product 5' , 'price' : "2020",'counter': 0},
    { 'name' : 'Product 6' , 'price' : "500",'counter': 0},

  ] ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    double counter = 0;//setting counter value to 0
  @override
  Widget build(BuildContext context) {
    //function to show alertDialog
    MyAlertDialog(context,productName)
    {
      return showDialog(context: context, builder: (BuildContext context){return Expanded(child: AlertDialog(title: const Text('Congratulations!'),
      content: Text("You've bought 5 $productName "),actions: [ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text('OK'))],));});
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Product List'),
      centerTitle: true,),
      body:
      ListView.separated(itemBuilder: (context , index){
      // int productCounter = widget.productDetails[index]['counter'];
        return ListTile(
          title: Text(widget.productDetails[index]['name']),
        subtitle: Text(widget.productDetails[index]['price']),

          trailing: Column(
            children: [
              Text('Counter : '),
              const SizedBox(height: 3),
              ElevatedButton(onPressed: (){

               setState(() {counter++;
               widget.productDetails[index]['counter']++;

               if (widget.productDetails[index]['counter']==5)
               {
                 MyAlertDialog(context,widget.productDetails[index]['name']);
                 widget.productDetails[index]['counter'] = 0 ;
               }});
                print(counter);
                print(widget.productDetails[index]['counter']);
              },child: const Text('Buy Now'),),
            ],
          ),

        );

      }, separatorBuilder: (context , index){return const Divider();}, itemCount: widget.productDetails.length),

    );
  }
}
