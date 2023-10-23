
import 'package:adventure/pages/homepage.dart';
import 'package:adventure/pages/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'pages/baritempage.dart';
import 'pages/mypage.dart';
class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  int index=0;
  List page=<Widget>[// list des pages que on va affiche a laide de curved nav bar 
  // selon lindex ki chnage lors de la appyer sur le icon 
       const homepage(),
    const baritem(),
    const searchpage(),
    const infopage(),


  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: page[index],

    
    bottomNavigationBar: CurvedNavigationBar(// curved_navigation_bar with animatiion and colors
     onTap: (value) {
       setState(() {
         index=value;
       });
     },
     height: 60,
      index: 0,
      backgroundColor:  Colors.deepPurple[50]!,
      color: Colors.deepPurple[300]!,
      buttonBackgroundColor: Colors.white,
      animationDuration: const Duration(milliseconds: 300),


      items:const [
        Icon(Icons.apps),
        Icon(Icons.bar_chart_sharp),
        Icon(Icons.search),
        Icon(Icons.person)
      ]
       ) ,



    );
  }
}