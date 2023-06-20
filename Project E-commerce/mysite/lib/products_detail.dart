import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysite/product.dart';

class ProductsDetail extends StatelessWidget{
  static const String route = '/productsdetail';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.greenAccent,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(leading: OutlinedButton(onPressed: (){ Navigator.of(context).pop();},child: Icon(Icons.arrow_back_rounded,color: Colors.white,)),centerTitle: true,title: Text("Ürün Detay Sayfasına Hosgeldiniz. İyi Alısverisler".toUpperCase(),style: TextStyle(fontSize: 14,color: Colors.white,fontStyle: FontStyle.italic),)),
        body: Container(
          margin: EdgeInsets.all(150),
          color: Colors.blueAccent,
          child: Row(
            children: [
              Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(50.0),
                child:Image.network(fit: BoxFit.cover,Product.getImageLink('${Product.seciliUrun!.Marka}')),

              )),
              Expanded(flex: 3,child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,children: [
                Text("ACIKLAMA:  ${Product.seciliUrun!.Name}",style: TextStyle(fontSize: 12,color: Colors.black,fontStyle: FontStyle.italic),),
                Divider(color: Colors.black,height: 15,thickness: 2),
                Text("MARKA:  ${Product.seciliUrun!.Marka}",style: TextStyle(fontSize: 12,color: Colors.black,fontStyle: FontStyle.italic),),
                Divider(color: Colors.black,height: 15,thickness: 2),
                Text("SATICI:  ${Product.seciliUrun!.WebSitesi}",style: TextStyle(fontSize: 12,color: Colors.black,fontStyle: FontStyle.italic),),
                Divider(color: Colors.black,height: 15,thickness: 2),
                Text("FIYAT:  ${Product.seciliUrun!.Fiyat}",style: TextStyle(fontSize: 12,color: Colors.black,fontStyle: FontStyle.italic),),
                Divider(color: Colors.black,height: 15,thickness: 2),
                Text("ID:  ${Product.seciliUrun!.id}",style: TextStyle(fontSize: 12,color: Colors.black,fontStyle: FontStyle.italic),),

                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: OutlinedButton(onPressed:(){}, child: ListTile(leading:Icon(Icons.shopping_basket_outlined) ,tileColor: Colors.white,title: Text("Sepete Ekle",style: TextStyle(fontSize: 12,color: Colors.black,fontStyle: FontStyle.italic),)))),
                    Expanded(child: OutlinedButton(onPressed: (){},child: ListTile(leading: Icon(Icons.favorite),tileColor: Colors.white,title: Text("Favorilere Ekle",style: TextStyle(fontSize: 12,color: Colors.black,fontStyle: FontStyle.italic),)))),
                  ],
                ),
                

              ],))
            ],
          ),
        ),
      ),



    );

  }
}