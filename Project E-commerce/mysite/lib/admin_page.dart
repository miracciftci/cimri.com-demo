


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysite/add_product.dart';
import 'package:mysite/delete_product.dart';
import 'package:mysite/update_product.dart';

class adminPage  extends StatefulWidget{
  static const String route = '/admin';

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        addProductPage.route:(context) => addProductPage(),
        deleteProductPage.route:(context) => deleteProductPage(),
        updateProductPage.route:(context) => updateProductPage(),
      },

      home:Scaffold(
        appBar: AppBar(centerTitle: true,leading: TextButton(onPressed: () {Navigator.pop(context);}, child: Icon(Icons.arrow_back  ,color:Colors.black,size: 20,)),title: Text("Admin Page",style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,),)),

      body: Column(
        children: [
          Center(child: Text("Admin Sayfasına Hoşgeldiniz.")),
          Expanded(flex: 1,child: TextButton(onPressed: (){Navigator.of(context).pushNamed(addProductPage.route);}, child: Text("Ürün Ekleme."))),
          Expanded(flex: 1,child: TextButton(onPressed: (){Navigator.of(context).pushNamed(updateProductPage.route);}, child: Text("Ürün Ozellik Guncelleme."))),
          Expanded(flex: 1,child: TextButton(onPressed: (){Navigator.of(context).pushNamed(deleteProductPage.route);}, child: Text("Ürün Silme."))),

        ],
      ),


      ),);


  }
}