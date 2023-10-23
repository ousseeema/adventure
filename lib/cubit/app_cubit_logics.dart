import 'package:adventure/cubit/app_cubit.dart';
import 'package:adventure/cubit/app_cubit_state.dart';
import 'package:adventure/mainpage.dart';
import 'package:adventure/pages/detailpage.dart';
 import 'package:adventure/xelcome/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(builder: (context,State){
        if(State is WelcomeState){
          return const welcomepage();}

          else if(State is loadedState){
          return const mainpage();
           } 
           else if(State is detailsState){
          return const detailspage();
           }   
     
        else if(State is loadingState){
          return const Center(child: CircularProgressIndicator(),);}
        else{
          return Container();
        }


      }),
    );
  }
}