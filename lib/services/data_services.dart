import 'dart:convert';

import 'package:adventure/model/data_model.dart';
import 'package:http/http.dart' as http;
 
 class dataservices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future <List<datamodel> >getinfo()async{
    var apiurl="/getplaces";
    http.Response respnse = await  http.get(Uri.parse(baseUrl+apiurl));// type de return json object 
    try{
      if(respnse.statusCode == 200){

        List<dynamic> list = json.decode(respnse.body);
        return list.map((e) => datamodel.fromJson(e)).toList();


        
      }
      else {
       return <datamodel>[];
      }


    }catch(e){
      print(e);
      return <datamodel>[];

    }





  }

 }