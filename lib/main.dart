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
    { 'name' : 'Product 1' , 'price' : "100"},
    { 'name' : 'Product 2' , 'price' : "200"},
    { 'name' : 'Product 3' , 'price' : "1400"},
    { 'name' : 'Product 4' , 'price' : "1040"},
    { 'name' : 'Product 5' , 'price' : "2020"},
    { 'name' : 'Product 6' , 'price' : "500"},

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
      content: Text("You've bought $counter $productName "),actions: [ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('OK'))],));});
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Product List'),
      centerTitle: true,),
      body: ListView.separated(itemBuilder: (context , index){
        return ListTile(
          title: Text(widget.productDetails[index]['name']),
        subtitle: Text(widget.productDetails[index]['price']),

          trailing: Column(
            children: [
              Text('Counter : '),
              const SizedBox(height: 3),
              ElevatedButton(onPressed: (){
               counter++;
               if (counter==5)
               {
                 MyAlertDialog(context,widget.productDetails[index]['name']);
               }
               setState(() {});
                print(counter);
              },child: const Text('Buy Now'),),
            ],
          ),

        );

      }, separatorBuilder: (context , index){return const Divider();}, itemCount: widget.productDetails.length),

    );
  }
}
