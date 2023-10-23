import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class baritem extends StatelessWidget {
  const baritem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[50],

      child:const Center(child: Text("baritem")));
  }
}