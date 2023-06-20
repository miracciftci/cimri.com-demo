


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adminPage  extends StatefulWidget{
  static const String route = '/admin';

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(centerTitle: true,leading: TextButton(onPressed: () {Navigator.pop(context);}, child: Icon(Icons.arrow_back  ,color:Colors.black,size: 20,)),title: Text("Admin Page",style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,),)),

      body: Column(
        children: [
          Text("Admin Sayfasına Hoşgeldiniz. Yapmak istediğiniz işlemi seçebilirsiniz."),
          Expanded(flex: 1,child: TextButton(onPressed: (){}, child: Text("Ürün Fiyat Değiştirme "))),
          Expanded(flex: 1,child: TextButton(onPressed: (){}, child: Text("Ürün Fiyat Değiştirme"))),
          Expanded(flex: 1,child: TextButton(onPressed: (){}, child: Text("Ürün Fiyat Değiştirme"))),
          Expanded(flex: 1,child: TextButton(onPressed: (){}, child: Text("Ürün Fiyat Değiştirme"))),
        ],
      ),


      ),);


  }
}