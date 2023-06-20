
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysite/product.dart';
import 'dart:math';

class addProductPage extends StatelessWidget{
  static const String route = '/addProduct';

  @override
  Widget build(BuildContext context) {
    Product eklenecekUrun = Product("", "", 0, "", "", "",Random().nextInt(1000));
    addtoDatabase(Product eklenecekUrun) async {
      final docUser = FirebaseFirestore.instance.collection("Products").doc("my-id");
      final json = eklenecekUrun.toJson();
        await docUser.set(json);
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
                  labelText: "Marka"
              ),onChanged: (String input){eklenecekUrun.Marka = input;}),
              TextField(decoration: InputDecoration(
                  labelText: "Acıklama"
              ),onChanged: (String input){eklenecekUrun.Name = input;}),
              TextField(decoration: InputDecoration(
                  labelText: "Fiyat"
              ),onChanged: (String input){eklenecekUrun.Fiyat = double.parse(input);}),
              TextField(decoration: InputDecoration(
                  labelText: "Web Sitesi"
              ),onChanged: (String input){eklenecekUrun.WebSitesi = input;}),
              TextField(decoration: InputDecoration(
                  labelText: "rating"
              ),onChanged: (String input){eklenecekUrun.Rating = input;}),
              TextField(decoration: InputDecoration(
                  labelText: "Kargo Durumu"
              ),onChanged: (String input){eklenecekUrun.KargoDurumu = input;}),
              Container(margin: EdgeInsets.all(12),child: OutlinedButton(onPressed: (){addtoDatabase(eklenecekUrun);}, child: Text("Ekle",style: TextStyle(color: Colors.white),)))
            ]),
          ),

        ),

    );
  }


}