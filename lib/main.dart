import 'package:flutter/material.dart';
import 'package:thax_vendas/src/Home.dart';
import 'package:thax_vendas/src/Login.dart';
void main(){
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
    routes: {
      "home" :(context) =>  const Home()
    },
  ));
}