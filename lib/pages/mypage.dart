import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class infopage extends StatelessWidget {
  const infopage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
           appBar: AppBar(
            title: Text("User Info", style:  TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.white),),
            centerTitle: true ,
            backgroundColor: Colors.purple[300],
           ),
         body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
   
          children: [
           const  SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                   
                    image: DecorationImage(image: AssetImage("img/base1.png"))
                  
                    ),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            Row(
            children: [
               const SizedBox(width: 30,),
              const Text("User Name :", style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),),
                 const  SizedBox( width: 40,),
                  Text("Oussema Ferchichi", style: TextStyle(color: Colors.purple[200]),),


            ],

           ),
           const SizedBox(height: 40,),
           Row(
            children: [
              const SizedBox(width:30),
              const Text("User Email Address: ",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(width: 10,),
              Text("oussema.ferchichi@gmail.com",style: TextStyle(color: Colors.purple[200]),),

            ],
           ),
           const SizedBox(height:40  ,),

           Row(
            children: [
              const SizedBox(width:30),
              const Text("Phone Number :",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(width: 10,),
              Text("97388536",style: TextStyle(color: Colors.purple[200]),),
              ]
           ),
           const SizedBox(height: 40  ,),
           
           Row(
            children: [
              const SizedBox(width:30),
              const Text("Location :",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(width: 10,),
              Text("Djerba, mednine ",style: TextStyle(color: Colors.purple[200]),),
              ]
           ),

           Container(
            child: Text("Update Your Account "),
            decoration: BoxDecoration(
             
            ),

           )
           
           
         ])


    );
  }
}
