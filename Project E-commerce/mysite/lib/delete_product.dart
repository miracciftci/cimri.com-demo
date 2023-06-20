
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysite/product.dart';
import 'dart:math';

class deleteProductPage extends StatelessWidget{
  var docUser = FirebaseFirestore.instance.collection("Products").doc();

  static const String route = '/deleteProduct';
  @override
  Widget build(BuildContext context) {
    Product siliceneckUrun = Product("", "", 0, "", "", "",Random().nextInt(1000));
    deletetoDatabase(Product silinecekUrun) async {
      var json = silinecekUrun.toJson();
      await docUser.delete();
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Urun Ekleme Ekranı"),centerTitle: true),
        body: Container(
          margin: EdgeInsets.all(120),
          width: 500,
          height: 900,
          color: Colors.blue,
          child: Column(children: [
            TextField(  decoration: InputDecoration(
                labelText: "id"
            ),onChanged: (String input){siliceneckUrun.Marka = input;}),

            OutlinedButton(onPressed: (){}, child: Text("sil",style: TextStyle(color: Colors.white),))
          ]),
        ),

      ),

    );
  }


}