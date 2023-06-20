
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysite/product.dart';
import 'dart:math';

class updateProductPage extends StatefulWidget{
  static const String route = '/updateProduct';

  @override
  State<updateProductPage> createState() => _updateProductPageState();
}

class _updateProductPageState extends State<updateProductPage> {
  var docUser = FirebaseFirestore.instance.collection("Products").doc();
  @override
  Widget build(BuildContext context) {
    Product eklenecekUrun = Product("", "", 0, "", "", "",0);
    updatetoDatabase(Product guncellenecekUrun) async {
       var json = guncellenecekUrun.toJson();
      await docUser.update(
          {"name":json["name"],}
      );
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Urun guncelleme Ekranı"),centerTitle: true),
        body: Container(
          margin: EdgeInsets.all(120),
          width: 500,
          height: 900,
          color: Colors.blue,
          child: Column(children: [
            TextField(  decoration: InputDecoration(
                labelText: "Lutfen guncellemek istediginiz urunun id sini giriniz."
            ),onEditingComplete: (){
                //docUser = FirebaseFirestore.instance.collection("Products").where("id" == eklenecekUrun.id);
                print(docUser.toString());
            },onChanged: (String input){
              eklenecekUrun.id = int.parse(input);
            }),
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
            OutlinedButton(onPressed: (){updatetoDatabase(eklenecekUrun);}, child: Text("Guncelle",style: TextStyle(color: Colors.white),))
          ]),
        ),

      ),

    );
  }
}