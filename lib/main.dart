import 'package:adventure/cubit/app_cubit.dart';
import 'package:adventure/cubit/app_cubit_logics.dart';
import 'package:adventure/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
       
        primarySwatch: Colors.red,
      ),
      home: BlocProvider<AppCubit>(
        create: (context) => AppCubit(dataservices()),
        child: const AppCubitLogics(),

      )
      
      
    );
  }
}
