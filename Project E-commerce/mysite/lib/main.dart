
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mysite/product.dart';
import 'package:mysite/products_detail.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'admin_page.dart';
import 'add_product.dart';
import 'delete_product.dart';
import 'update_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:FirebaseOptions(apiKey: "AIzaSyDHT3gqiP-XC1qDCMdAoRIMF9zLUu7hA0c", appId: "1:539950024217:web:1fc32e77b447de2be4cc88", messagingSenderId: "539950024217", projectId: "mysite-12e18",) );;
  runApp(const MyApp());
}


List<String> tumMarkalar = ["Asus","Apple","Lenovo","Dell","Monster","MSI"];
List<String> markalarFiltre = [];
String username="";
String password ="";
int currentState = 0;
int sifirlaControl = 0;
Color StateController1(){
  if(currentState == 1)
    return Colors.blueAccent;
  else
    return Colors.white;
}
Color StateController2(){
  if(currentState == 2)
    return Colors.blueAccent;
  else
    return Colors.white;
}
Color StateController3(){
  if(currentState == 3)
    return Colors.blueAccent;
  else
    return Colors.white;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initalization = Firebase.initializeApp(options:FirebaseOptions(apiKey: "AIzaSyDHT3gqiP-XC1qDCMdAoRIMF9zLUu7hA0c", appId: "1:539950024217:web:1fc32e77b447de2be4cc88", messagingSenderId: "539950024217", projectId: "mysite-12e18",) );
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference productsRef = FirebaseFirestore.instance.collection('Products');
  DocumentReference docRef = FirebaseFirestore.instance.collection('Products').doc();



  @override
  void initState() {
    super.initState();
  }
  //Filter list
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        adminPage.route:(context) => adminPage() ,
        ProductsDetail.route:(context) => ProductsDetail(),
        addProductPage.route:(context) => addProductPage(),
        deleteProductPage.route:(context) => deleteProductPage(),
        updateProductPage.route:(context) => updateProductPage(),

//Navigator.of(context).pushNamed(ProductsDetail.route);
      },
      home:FutureBuilder(
        future: _initalization,
        builder: (context,snapshot){
          String getImageLink(String marka){
            if(marka == "Asus")
              return "https://n11scdn.akamaized.net/a1/226_339/elektronik/dizustu-bilgisayar/asus-x415ea-ek977-i5-1135g7-8-gb-256-gb-ssd-14-free-dos-fhd-dizustu-bilgisayar__1346263594648522.jpg";
            else if(marka == "Lenovo")
              return "https://n11scdn.akamaized.net/a1/226_339/elektronik/dizustu-bilgisayar/asus-x415ea-ek977-i5-1135g7-8-gb-256-gb-ssd-14-free-dos-fhd-dizustu-bilgisayar__1346263594648522.jpg";
            else if(marka == "Monster")
              return "https://n11scdn.akamaized.net/a1/226_339/elektronik/dizustu-bilgisayar/asus-x415ea-ek977-i5-1135g7-8-gb-256-gb-ssd-14-free-dos-fhd-dizustu-bilgisayar__1346263594648522.jpg";
            else if(marka == "Hp")
              return "https://n11scdn.akamaized.net/a1/226_339/elektronik/dizustu-bilgisayar/asus-x415ea-ek977-i5-1135g7-8-gb-256-gb-ssd-14-free-dos-fhd-dizustu-bilgisayar__1346263594648522.jpg";
            else if(marka == "Dell")
              return "https://n11scdn.akamaized.net/a1/226_339/elektronik/dizustu-bilgisayar/asus-x415ea-ek977-i5-1135g7-8-gb-256-gb-ssd-14-free-dos-fhd-dizustu-bilgisayar__1346263594648522.jpg";
            else if(marka == "MSI")
              return "https://n11scdn.akamaized.net/a1/226_339/elektronik/dizustu-bilgisayar/asus-x415ea-ek977-i5-1135g7-8-gb-256-gb-ssd-14-free-dos-fhd-dizustu-bilgisayar__1346263594648522.jpg";
            else
              return"https://n11scdn.akamaized.net/a1/226_339/elektronik/dizustu-bilgisayar/asus-x415ea-ek977-i5-1135g7-8-gb-256-gb-ssd-14-free-dos-fhd-dizustu-bilgisayar__1346263594648522.jpg";
          }
          Widget GetOutlinedButon(String CompanyName,double Price,Product gidilecekUrun){
            return OutlinedButton(onPressed: (){
              Product.putProduct(gidilecekUrun);
              Navigator.of(context).pushNamed(ProductsDetail.route);
            },style: OutlinedButton.styleFrom(
              alignment: Alignment.centerLeft,
              backgroundColor: Colors.white,
              foregroundColor: Colors.blueAccent,
            ), child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${Price*1000} TL",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                Text(CompanyName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
              ],
            ), );
          }
          Widget getStreamBuilder(){
            if(currentState == 1){
              if(markalarFiltre.isEmpty == true || sifirlaControl == 1)
              {
                sifirlaControl = 0;
                markalarFiltre = [];
                tumMarkalar.forEach((element) {markalarFiltre.add(element);});
                //markalarFiltre = tumMarkalar;
              }
              return StreamBuilder<QuerySnapshot>(
                stream:productsRef.orderBy('rating',descending: true).snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> asyncsnapshot){
                  List<DocumentSnapshot> listOfDocumentSnapshots = asyncsnapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listOfDocumentSnapshots.length,
                    itemBuilder: (context,index){
                      bool exists = false;
                      for(int i=0;i<markalar.length;i++){
                        if(markalar[i].name.toUpperCase().compareTo('${listOfDocumentSnapshots[index]["marka"]}'.toUpperCase()) == 0)
                        {
                          exists = true;
                          break;
                        }
                      }
                      if(exists == false)
                      {
                        setState(() {
                          markalar.add(Brand('${listOfDocumentSnapshots[index]["marka"]}', false));
                        });
                      }
                      else{
                        exists = false;
                      }
                      Product urun = Product('${listOfDocumentSnapshots[index]["name"]}', '${listOfDocumentSnapshots[index]["webSitesi"]}', double.parse('${listOfDocumentSnapshots[index]["fiyat"]}'),  '${listOfDocumentSnapshots[index]["kargoDurumu"]}',  '${listOfDocumentSnapshots[index]["marka"]}',  '${listOfDocumentSnapshots[index]["rating"]}', int.parse('${listOfDocumentSnapshots[index]["id"]}'));

                      return Container(
                        decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black87),borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        width: 1200,
                        padding: EdgeInsets.all(2),
                        child: Row(children: [
                          Expanded(flex: 1,child:Image.network(fit: BoxFit.contain,getImageLink('${listOfDocumentSnapshots[index]["marka"]}')),),
                          Expanded(
                            flex: 3,
                            child: Column(children: [
                              Expanded(flex: 1,child: Center(child: Text('${listOfDocumentSnapshots[index]["name"]}',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),)),
                              Expanded(
                                flex: 2,
                                child: Row(children: [
                                  Expanded(flex: 1,child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GetOutlinedButon('${listOfDocumentSnapshots[index]["webSitesi"]}',double.parse('${listOfDocumentSnapshots[index]["fiyat"]}'),urun),
                                  )
                                  ),
                                  Expanded(flex: 1,child: Padding(
                                    padding: const EdgeInsets.all(22.0),
                                    child: Column(
                                      children: [
                                        Text('${listOfDocumentSnapshots[index]["kargoDurumu"]}',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 14)),
                                        Divider(color: Colors.black,height: 1),
                                        Text('${listOfDocumentSnapshots[index]["rating"]} kez satın alındı.',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 14))
                                      ],
                                    ),
                                  )),
                                ],),
                              ),
                            ],),
                          ),

                        ]
                        ),);


                      Text(listOfDocumentSnapshots[index].data().toString());

                    },
                  );
                },

              );
            }
            else if(currentState == 2){
              if(markalarFiltre.isEmpty == true || sifirlaControl == 1)
              {
                sifirlaControl = 0;
                markalarFiltre = [];
                tumMarkalar.forEach((element) {markalarFiltre.add(element);});
                //markalarFiltre = tumMarkalar;
              }
              return StreamBuilder<QuerySnapshot>(
                stream:productsRef.orderBy('fiyat', descending: false).snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> asyncsnapshot){
                  print(markalarFiltre);
                  List<DocumentSnapshot> listOfDocumentSnapshots = asyncsnapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listOfDocumentSnapshots.length,
                    itemBuilder: (context,index){
                      bool exists = false;
                      for(int i=0;i<markalar.length;i++){
                        if(markalar[i].name.toUpperCase().compareTo('${listOfDocumentSnapshots[index]["marka"]}'.toUpperCase()) == 0)
                        {
                          exists = true;
                          break;
                        }
                      }
                      if(exists == false)
                      {
                        setState(() {
                          markalar.add(Brand('${listOfDocumentSnapshots[index]["marka"]}', false));
                        });
                      }
                      else{
                        exists = false;
                      }
                      Product urun = Product('${listOfDocumentSnapshots[index]["name"]}', '${listOfDocumentSnapshots[index]["webSitesi"]}', double.parse('${listOfDocumentSnapshots[index]["fiyat"]}'),  '${listOfDocumentSnapshots[index]["kargoDurumu"]}',  '${listOfDocumentSnapshots[index]["marka"]}',  '${listOfDocumentSnapshots[index]["rating"]}', int.parse('${listOfDocumentSnapshots[index]["id"]}'));

                      return Container(
                        decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black87),borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        width: 1200,
                        padding: EdgeInsets.all(2),
                        child: Row(children: [
                          Expanded(flex: 1,child:Image.network(fit: BoxFit.contain,getImageLink('${listOfDocumentSnapshots[index]["marka"]}')),),
                          Expanded(
                            flex: 3,
                            child: Column(children: [
                              Expanded(flex: 1,child: Center(child: Text('${listOfDocumentSnapshots[index]["name"]}',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),)),
                              Expanded(
                                flex: 2,
                                child: Row(children: [
                                  Expanded(flex: 1,child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GetOutlinedButon('${listOfDocumentSnapshots[index]["webSitesi"]}',double.parse('${listOfDocumentSnapshots[index]["fiyat"]}'),urun),
                                  )
                                  ),
                                  Expanded(flex: 1,child: Padding(
                                    padding: const EdgeInsets.all(22.0),
                                    child: Column(
                                      children: [
                                        Text('${listOfDocumentSnapshots[index]["kargoDurumu"]}',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 14)),
                                        Divider(color: Colors.black,height: 1),
                                        Text('${listOfDocumentSnapshots[index]["rating"]} kez satın alındı.',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 14))
                                      ],
                                    ),
                                  )),
                                ],),
                              ),
                            ],),
                          ),

                        ]
                        ),);


                      Text(listOfDocumentSnapshots[index].data().toString());

                    },
                  );
                },

              );
            }
            else if(currentState == 3){
              if(markalarFiltre.isEmpty == true || sifirlaControl == 1)
              {
                sifirlaControl = 0;
                markalarFiltre = [];
                tumMarkalar.forEach((element) {markalarFiltre.add(element);});
                //markalarFiltre = tumMarkalar;
              }
              return StreamBuilder<QuerySnapshot>(
                stream:productsRef.orderBy('fiyat', descending: true).snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> asyncsnapshot){
                  List<DocumentSnapshot> listOfDocumentSnapshots = asyncsnapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listOfDocumentSnapshots.length,
                    itemBuilder: (context,index){
                      bool exists = false;
                      for(int i=0;i<markalar.length;i++){
                        if(markalar[i].name.toUpperCase().compareTo('${listOfDocumentSnapshots[index]["marka"]}'.toUpperCase()) == 0)
                        {
                          exists = true;
                          break;
                        }
                      }
                      if(exists == false)
                      {
                        setState(() {
                          markalar.add(Brand('${listOfDocumentSnapshots[index]["marka"]}', false));
                        });
                      }
                      else{
                        exists = false;
                      }
                      Product urun = Product('${listOfDocumentSnapshots[index]["name"]}', '${listOfDocumentSnapshots[index]["webSitesi"]}', double.parse('${listOfDocumentSnapshots[index]["fiyat"]}'),  '${listOfDocumentSnapshots[index]["kargoDurumu"]}',  '${listOfDocumentSnapshots[index]["marka"]}',  '${listOfDocumentSnapshots[index]["rating"]}', int.parse('${listOfDocumentSnapshots[index]["id"]}'));

                      return Container(
                        decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black87),borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        width: 1200,
                        padding: EdgeInsets.all(2),
                        child: Row(children: [
                          Expanded(flex: 1,child:Image.network(fit: BoxFit.contain,getImageLink('${listOfDocumentSnapshots[index]["marka"]}')),),
                          Expanded(
                            flex: 3,
                            child: Column(children: [
                              Expanded(flex: 1,child: Center(child: Text('${listOfDocumentSnapshots[index]["name"]}',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),)),
                              Expanded(
                                flex: 2,
                                child: Row(children: [
                                  Expanded(flex: 1,child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GetOutlinedButon('${listOfDocumentSnapshots[index]["webSitesi"]}',double.parse('${listOfDocumentSnapshots[index]["fiyat"]}'),urun),
                                  )
                                  ),
                                  Expanded(flex: 1,child: Padding(
                                    padding: const EdgeInsets.all(22.0),
                                    child: Column(
                                      children: [
                                        Text('${listOfDocumentSnapshots[index]["kargoDurumu"]}',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 14)),
                                        Divider(color: Colors.black,height: 1),
                                        Text('${listOfDocumentSnapshots[index]["rating"]} kez satın alındı.',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 14))
                                      ],
                                    ),
                                  )),
                                ],),
                              ),
                            ],),
                          ),

                        ]
                        ),);


                      Text(listOfDocumentSnapshots[index].data().toString());

                    },
                  );
                },

              );
            }
            else{

              if(markalarFiltre.isEmpty == true || sifirlaControl == 1)
              {
                sifirlaControl = 0;
                markalarFiltre = [];
                tumMarkalar.forEach((element) {markalarFiltre.add(element);});
                //markalarFiltre = tumMarkalar;
              }
              return StreamBuilder<QuerySnapshot>(
                stream:productsRef.where('marka',whereIn:markalarFiltre).snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> asyncsnapshot){
                  List<DocumentSnapshot> listOfDocumentSnapshots = asyncsnapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listOfDocumentSnapshots.length,
                    itemBuilder: (context,index){
                      bool exists = false;
                      for(int i=0;i<markalar.length;i++){
                        if(markalar[i].name.toUpperCase().compareTo('${listOfDocumentSnapshots[index]["marka"]}'.toUpperCase()) == 0)
                        {
                          exists = true;
                          break;
                        }
                      }
                      if(exists == false)
                      {
                        setState(() {
                          markalar.add(Brand('${listOfDocumentSnapshots[index]["marka"]}', false));
                        });
                      }
                      else{
                        exists = false;
                      }
                      Product urun = Product('${listOfDocumentSnapshots[index]["name"]}', '${listOfDocumentSnapshots[index]["webSitesi"]}', double.parse('${listOfDocumentSnapshots[index]["fiyat"]}'),  '${listOfDocumentSnapshots[index]["kargoDurumu"]}',  '${listOfDocumentSnapshots[index]["marka"]}',  '${listOfDocumentSnapshots[index]["rating"]}', int.parse('${listOfDocumentSnapshots[index]["id"]}'));
                      return Container(
                        decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black87),borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        width: 1200,
                        padding: EdgeInsets.all(2),
                        child: Row(children: [
                          Expanded(flex: 1,child:Image.network(fit: BoxFit.contain,getImageLink('${listOfDocumentSnapshots[index]["marka"]}')),),
                          Expanded(
                            flex: 3,
                            child: Column(children: [
                              Expanded(flex: 1,child: Center(child: Text('${listOfDocumentSnapshots[index]["name"]}',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),)),
                              Expanded(
                                flex: 2,
                                child: Row(children: [
                                  Expanded(flex: 1,child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GetOutlinedButon('${listOfDocumentSnapshots[index]["webSitesi"]}',double.parse('${listOfDocumentSnapshots[index]["fiyat"]}'),urun),
                                  ),),
                                  Expanded(flex: 1,child: Padding(
                                    padding: const EdgeInsets.all(22.0),
                                    child: Column(
                                      children: [
                                        Text('${listOfDocumentSnapshots[index]["kargoDurumu"]}',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 14)),
                                        Divider(color: Colors.black,height: 1),
                                        Text('${listOfDocumentSnapshots[index]["rating"]} kez satın alındı.',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 14))
                                      ],
                                    ),
                                  )),

                                ],),
                              ),
                            ],),
                          ),

                        ]
                        ),);


                      Text(listOfDocumentSnapshots[index].data().toString());

                    },
                  );
                },

              );
            }
          }

          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          else if(snapshot.hasData){
            return Builder(
                builder: (context)=> Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.blueAccent,
                    title: Text("LEGENDCOMP", style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontStyle: FontStyle.italic
                      ,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,),),
                    foregroundColor: Colors.black,
                    centerTitle: true,
                  ),
                  body:Column(
                    children: [
                      Divider(color: Colors.black,height: 15,thickness: 2),
                      Expanded(
                        flex: 3,
                        child: ListView(
                          children: [Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 1,
                                  child: Column(
                                children: [
                                  SizedBox(height: 100,),
                                  ...GetCheckBoxs(),
                                  TextButton(onPressed: (){
                                    setState(() {
                                      currentState=0;
                                      sifirlaControl = 1;
                                      for(int i = 0; i < markalar.length; i++)
                                        {
                                          markalar[i].checked = false;
                                        }
                                    });
                                  }, child:Text("Sıfırla",style: TextStyle(fontSize: 13)),),
                                  TextButton(onPressed: (){
                                    //sifirlaControl = 0;
                                    for(int i = 0 ; i<markalar.length;i++){
                                      if(markalar[i].checked == true)
                                        {
                                          setState(() {
                                            if(markalarFiltre.contains(markalar[i].name) == false)
                                              {
                                                markalarFiltre.add(markalar[i].name);
                                              }

                                          });

                                        }
                                      else // is false
                                        {
                                          setState(() {
                                            if(markalarFiltre.contains(markalar[i].name) == true)
                                              {
                                                markalarFiltre.remove(markalar[i].name);
                                              }
                                          });
                                        }
                                    }

                                  }, child:Text("Uygula",style: TextStyle(fontSize: 13)),),
                                ],
                              )
                              ),
                              Expanded(flex: 4,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(flex: 5,
                                          child: TextField(
                                              onEditingComplete: (){},
                                              decoration: InputDecoration(
                                                  icon: Icon(Icons.search),
                                                  hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontStyle: FontStyle.italic,

                                                  ))),
                                        ),
                                        Expanded(flex: 1,child: TextButton(onPressed: ()  {}, child: Text("ARA",style: TextStyle(fontSize: 15),))),
                                        Expanded(flex:2,child: SizedBox()),
                                        Expanded(flex: 2,
                                          child: Container(
                                            height: 90,
                                            width: 10,
                                            child: Column(
                                              children: [
                                                Expanded(flex: 2,
                                                  child: TextField(
                                                      onChanged: (String input){
                                                        setState(() {
                                                          username=input;
                                                        });
                                                      },
                                                      decoration: InputDecoration(
                                                          labelText: "Kullanıcı adı"
                                                      )),
                                                ),
                                                Expanded(flex: 2,
                                                  child: TextField(
                                                      onChanged: (String input){
                                                        setState(() {
                                                          password=input;
                                                        });
                                                      },
                                                      decoration: InputDecoration(
                                                          labelText: "Şifre")),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(flex: 1,child: TextButton(child: Text("Giris yap"),onPressed: (){
                                          if(username == "admin" && password == "admin"){
                                            Navigator.of(context).pushNamed(adminPage.route);
                                          }
                                          else{
                                          }

                                        },))
                                      ],
                                    ),
                                    SizedBox(height: 30,),
                                    Row(children: [
                                      Expanded(
                                          child: Container(color:StateController1() ,
                                            child: TextButton(onPressed: (){setState(() {
                                              currentState = 1;
                                            });}, child: Text("En Cok Satanlar",style: TextStyle(color: Colors.black),)),
                                          )),
                                      Expanded(child: Container(
                                        color: StateController2(),
                                        child: TextButton(onPressed: (){setState(() {
                                          currentState = 2;
                                        });}, child: Text("Fiyat (artan)",style: TextStyle(color: Colors.black))),
                                      )),
                                      Expanded(child: Container(color: StateController3(),
                                        child: TextButton(onPressed: (){setState(() {
                                          currentState=3;
                                        });}, child: Text("Fiyat (azalan)",style: TextStyle(color: Colors.black))),
                                      ))]),

                                     /* Container(height: 600,
                                          width: 1250,child: ),*/
                                    getStreamBuilder()
                                    //...GetContainerProds(),


                                  ],
                                ),
                              ),
                            ],
                          ),
                          ],
                        ),

                      ),

                    ],
                  ),



                ));
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),



    );


  }



  List<Widget> GetCheckBoxs(){
    List<CheckboxListTile> checkBoxs= [];
    for(int i=0 ; i < markalar.length; i++)
    {
      checkBoxs.add(CheckboxListTile(enableFeedback: true,title: Text(markalar[i].name,style: TextStyle(fontSize: 14)),controlAffinity: ListTileControlAffinity.trailing,value: markalar[i].checked, onChanged: (newValue){setState(() {
        markalar[i].checked = newValue!;
      });}));
    }
    return checkBoxs;

  }



}
class Brand{
  String name = "";
  bool checked=false;
  Brand(name,checked){
    this.name= name;
    this.checked=checked;
  }
}

List<Brand> markalar=[];


