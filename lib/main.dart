import 'dart:io';

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
  return MyHomePageState();
  }
}
class MyHomePageState extends State<MyHomePage>{

  TextEditingController wtController= TextEditingController();
  TextEditingController feetController=TextEditingController();
  TextEditingController inchcontroller=TextEditingController();
  num bmi=0;
  String health="";
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   appBar: AppBar(centerTitle: true,
     title: Text("BMI CALCULATOR",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.red.shade500),),
   ),
   body: Container(width: double.infinity,
     height: 800,
     child: Column(mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Container(width: 400,
             child: TextField(controller: wtController,
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
               hintText: "Enter Your Weight Here",
                 labelText: "Weight",
                 border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(30),
                 borderSide: BorderSide(width: 4,color: Colors.lightGreen)
               )
             ),
             )),
         SizedBox(height: 20,),
         Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(width: 190,
                 child: TextField(
                   controller: feetController,
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     hintText: "Enter Your Height In Feet",
                     labelText: "Feet",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30),
                       borderSide: BorderSide(
                         width: 4,color: Colors.lightGreen
                       )
                     )
                   ),
                 )),
             SizedBox(width: 10,),
             Container(width: 190,
                 child: TextField(
                   controller: inchcontroller,
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     hintText: "Enter your Height In Inches",
                     labelText: "Inch",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30),
                       borderSide:BorderSide(
                         width: 4,color: Colors.lightGreen
                       )
                     )
                   ),
                 ))
           ],
         ),
         SizedBox(height: 50,),
         ElevatedButton(onPressed: (){
           num weight = num.parse(wtController.text.toString());
           num heightInFeet = num.parse(feetController.text.toString());
           num heightInInches=num.parse(inchcontroller.text.toString());
           num totalHeightInInches = heightInFeet*12 + heightInInches;
           num totalHeightInCM = totalHeightInInches*2.54;
           num totalHeightInMeter = totalHeightInCM/100;
           bmi = num.parse((weight/(totalHeightInMeter*totalHeightInMeter)).toStringAsFixed(2));
           if(bmi<18){
             health="You are Underweight";
           } else if (bmi>28){
             health=  "You are Overweight";
             }
           else{
           health="You Are Healthy";
           }
           setState(() {
             
           });

         }, child: Text("Calculate BMI",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),)
         ),
         SizedBox(height: 30,),
   Text("Your BMI Is $bmi , $health",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.orange),)
       ],
     ),
   ),
 );
  }
}