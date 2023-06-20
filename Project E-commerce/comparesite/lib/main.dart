
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:comparesite/ProductModel.dart';
import 'admin_page.dart';
import 'api_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService _myService = ApiService();
  myModels = await _myService.fetchProducts();
  runApp(const MyApp());
}


List<String> markalarFiltre = [];
List<String> tumMarkalar = ["Asus","Apple","Lenovo","Dell","Monster"];
List<ProductModel> myModels = [];
String username="";
String password ="";
int sifirlaControl = 0;
int currentState = 0;

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
  Color filterColor = Colors.blue;
  bool checkedValue = false;
  getProducts() async {
    List<ProductModel> myModels;
    ApiService _myService = ApiService();
    myModels = await _myService.fetchProducts();
  }

  @override
  void initState (){
    super.initState();
    for(int i = 0 ; i < myModels.length ; i++)
    {
      if(markalar.every((element){
        if(element.name == myModels[i].marka)
          return false;
        else
          return true;}) == true){
          markalar.add(Brand(myModels[i].marka,false));}
    }
  }

  //Filter list
  @override
  Widget build(BuildContext context) {
    List<Widget> getSortedSites(int i){
      List<Widget> lst= [];
      if(myModels[i].fiyatN11 == "" && myModels[i].fiyatTrendyol == "")
      {
        if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) < double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
          ),),);
          return lst;
        }
        else
        {
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
          )),);
          return lst;
        }

      }
      else if(myModels[i].fiyatN11 == "" && myModels[i].fiyatHepsiburada == "")
      {
        if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) < double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
          ),),);
          return lst;
        }
        else
        {
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
          )),);
          return lst;
        }

      }
      else if(myModels[i].fiyatN11 == "" && myModels[i].fiyatTeknosa == "")
      {
        if(double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) < double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("Hepsiburada.com",myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
          ),),);
          return lst;
        }
        else
        {
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("Hepsiburada.com",myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!),
          )),);
          return lst;
        }

      }
      else if(myModels[i].fiyatTrendyol == "" && myModels[i].fiyatHepsiburada == "")
      {
        if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) < double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("N11.com",myModels[i].fiyatN11.toString(),myModels[i].linkN11!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Teknosa.com", myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!)
          ),),);
          return lst;
        }
        else
        {
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Teknosa.com", myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("N11.com",myModels[i].fiyatN11.toString(),myModels[i].linkN11!),
          )),);
          return lst;
        }

      }
      else if(myModels[i].fiyatTrendyol == "" && myModels[i].fiyatTeknosa == "")
      {
        if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) < double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("N11.com",myModels[i].fiyatN11.toString(),myModels[i].linkN11!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
          ),),);
          return lst;
        }
        else
        {
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("N11.com",myModels[i].fiyatN11.toString(),myModels[i].linkN11!),
          )),);
          return lst;
        }

      }
      else if(myModels[i].fiyatHepsiburada == "" && myModels[i].fiyatTeknosa == "")
      {
        if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) < double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("N11.com",myModels[i].fiyatN11.toString(),myModels[i].linkN11!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
          ),),);
          return lst;
        }
        else
        {
          lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
          lst.add(Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon("N11.com",myModels[i].fiyatN11.toString(),myModels[i].linkN11!),
          )),);
          return lst;
        }

      }
      else if(myModels[i].fiyatN11 == "")
      {
        if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <= double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) &&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
          {
            if(double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) < double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
              {
                {
                  lst.add(Expanded(flex: 1,child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
                  )),);
                  lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
                  lst.add(Expanded(flex: 1,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
                  ),),);
                  lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
                  lst.add(Expanded(flex: 1,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
                  ),),);

                  return lst;
                }
              }
            else
              {
                lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
                )),);
                lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
                lst.add(Expanded(flex: 1,child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
                ),),);
                lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
                lst.add(Expanded(flex: 1,child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
                ),),);

                return lst;
              }

          }
        else if(double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) < double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
          {
            {
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
              ),),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
              )),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
              ),),);

              return lst;
            }
          }
          else
          {
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
            )),);

            return lst;
          }

        }
        else if(double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) < double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
          {
            {
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
              ),),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
              )),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
              ),),);

              return lst;
            }
          }
          else
          {
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
            )),);

            return lst;
          }

        }

      }
      else if(myModels[i].fiyatHepsiburada == "")
      {
        if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <= double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) &&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) < double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
          {
            {
              lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
              )),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].fiyatN11!)
              ),),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
              ),),);

              return lst;
            }
          }
          else
          {
            lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
            )),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].fiyatN11!)
            ),),);

            return lst;
          }

        }
        else if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) < double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
          {
            {
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
              ),),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
              )),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
              ),),);

              return lst;
            }
          }
          else
          {
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
            )),);

            return lst;
          }

        }
        else if(double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
        {
          if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) < double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
          {
            {
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
              ),),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
              )),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
              ),),);

              return lst;
            }
          }
          else
          {
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Trendyol.com", myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
            )),);

            return lst;
          }

        }
      }
      else if(myModels[i].fiyatTrendyol == "")
      {
        if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <= double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) &&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) < double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
          {
            {
              lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
              )),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
              ),),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
              ),),);

              return lst;
            }
          }
          else
          {
            lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
            )),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
            ),),);

            return lst;
          }

        }
        else if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <= double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) < double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
          {
            {
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
              ),),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
              )),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
              ),),);

              return lst;
            }
          }
          else
          {
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
            )),);

            return lst;
          }

        }
        else if(double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
        {
          if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) < double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
          {
            {
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
              ),),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
              )),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
              ),),);

              return lst;
            }
          }
          else
          {
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Teknosa.com",myModels[i].fiyatTeknosa.toString(),myModels[i].linkTeknosa!),
            )),);

            return lst;
          }

        }

      }
      else if(myModels[i].fiyatTeknosa == "")
      {
        if(double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <= double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) &&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) < double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
          {
            {
              lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Trendyol.com",myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!),
              )),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].fiyatN11!)
              ),),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
              ),),);

              return lst;
            }
          }
          else
          {
            lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Trendyol.com",myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!),
            )),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].fiyatN11!)
            ),),);

            return lst;
          }

        }
        else if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <= double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) &&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          if(double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) < double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
          {
            {
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
              ),),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Trendyol.com",myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!),
              )),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
              ),),);

              return lst;
            }
          }
          else
          {
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Trendyol.com",myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!),
            )),);

            return lst;
          }

        }
        else if(double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <= double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) &&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
        {
          if(double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) < double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
          {
            {
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
              ),),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("Trendyol.com",myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!),
              )),);
              lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
              lst.add(Expanded(flex: 1,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
              ),),);

              return lst;
            }
          }
          else
          {
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),myModels[i].linkHepsiburada!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),myModels[i].linkN11!)
            ),),);
            lst.add(VerticalDivider(color: Colors.black26,width: 1,thickness: 1),);
            lst.add(Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("Trendyol.com",myModels[i].fiyatTrendyol.toString(),myModels[i].linkTrendyol!),
            )),);

            return lst;
          }

        }

      }
      // eger 4 yerden de fiyat bilgisi geliyorsa ama sıralamayı henuz yapmadım
      else {
        if(double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <= double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) &&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(",")))&&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <= double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) &&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(",")))&&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <= double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) &&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(",")))&&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <= double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) &&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(",")))&&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(",")))&&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(",")))&&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <= double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) &&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(",")))&&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <= double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) &&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(",")))&&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <= double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) &&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(",")))&&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <= double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) &&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(",")))&&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(",")))&&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(",")))&&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <= double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) &&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(",")))&&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <= double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) &&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(",")))&&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <= double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) &&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(",")))&&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <= double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) &&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(",")))&&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(",")))&&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <= double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) &&  double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(",")))&&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <= double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) &&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(",")))&&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <= double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) &&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(",")))&&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <= double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) &&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(",")))&&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <= double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) &&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(",")))&&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <= double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) &&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(",")))&&  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon(
                  "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
                  myModels[i].linkHepsiburada!)
          ),),);
          return lst;
        }
        else if(double.parse(myModels[i].fiyatTeknosa!.substring(0,myModels[i].fiyatTeknosa!.indexOf(","))) <= double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) &&  double.parse(myModels[i].fiyatTrendyol!.substring(0,myModels[i].fiyatTrendyol!.indexOf(","))) <=  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(",")))&&  double.parse(myModels[i].fiyatN11!.substring(0,myModels[i].fiyatN11!.indexOf(","))) <=  double.parse(myModels[i].fiyatHepsiburada!.substring(0,myModels[i].fiyatHepsiburada!.indexOf(","))))
        {
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
                myModels[i].linkTeknosa!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetOutlinedButon(
                "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
                myModels[i].linkTrendyol!),
          )),);
          lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
          lst.add(Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
                  myModels[i].linkN11!)
          ),),);
          return lst;
        }
      }
      lst.add(Expanded(flex: 1, child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetOutlinedButon(
              "hepsiburada.com", myModels[i].fiyatHepsiburada.toString(),
              myModels[i].linkHepsiburada!)
      ),),);
      lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
      lst.add(Expanded(flex: 1, child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetOutlinedButon("N11.com", myModels[i].fiyatN11.toString(),
              myModels[i].linkN11!)
      ),),);
      lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
      lst.add(Expanded(flex: 1, child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetOutlinedButon(
            "Trendyol.com", myModels[i].fiyatTrendyol.toString(),
            myModels[i].linkTrendyol!),
      )),);
      lst.add(VerticalDivider(color: Colors.black26, width: 1, thickness: 1),);
      lst.add(Expanded(flex: 1, child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetOutlinedButon(
            "Teknosa.com", myModels[i].fiyatTeknosa.toString(),
            myModels[i].linkTeknosa!),
      )),);
return lst;
    }
    Widget getProductsListView(){
      if(markalarFiltre.isEmpty == true || sifirlaControl == 1)
      {
        sifirlaControl = 0;
        markalarFiltre = [];
        tumMarkalar.forEach((element) {markalarFiltre.add(element); });
        //markalarFiltre = tumMarkalar;
      }

      if(currentState == 1){
        myModels.sort((a, b) => int.parse(b.rating!).compareTo(int.parse(a.rating!)),);
      }
      else if(currentState == 2){
        myModels.sort((a, b) => double.parse(a.fiyatN11!.substring(0,a.fiyatN11!.indexOf(","))).compareTo(double.parse(b.fiyatN11!.substring(0,b.fiyatN11!.indexOf(",")))));

        /*myModels.sort((a, b)
        {
          if(a.fiyatN11 !="" && b.fiyatN11 != ""){return double.parse(a.fiyatN11!.substring(0,a.fiyatN11!.indexOf(","))).compareTo(double.parse(b.fiyatN11!.substring(0,b.fiyatN11!.indexOf(","))));}
          else if(a.fiyatHepsiburada !="" && b.fiyatHepsiburada != ""){return double.parse(a.fiyatHepsiburada!.substring(0,a.fiyatHepsiburada!.indexOf(","))).compareTo(double.parse(b.fiyatHepsiburada!.substring(0,b.fiyatHepsiburada!.indexOf(","))));}
          else if(a.fiyatTeknosa !="" && b.fiyatTeknosa != ""){return double.parse(a.fiyatTeknosa!.substring(0,a.fiyatTeknosa!.indexOf(","))).compareTo(double.parse(b.fiyatTeknosa!.substring(0,b.fiyatTeknosa!.indexOf(","))));}
          else return double.parse(a.fiyatN11!.substring(0,a.fiyatN11!.indexOf(","))).compareTo(double.parse(b.fiyatN11!.substring(0,b.fiyatN11!.indexOf(","))));
        });*/
      }
      else if(currentState == 3){
        myModels.sort((a, b) => double.parse(b.fiyatN11!.substring(0,b.fiyatN11!.indexOf(","))).compareTo(double.parse(a.fiyatN11!.substring(0,a.fiyatN11!.indexOf(",")))));
      }
     return ListView.builder(
       shrinkWrap: true,
       itemCount: myModels.length,
       itemBuilder: (context,index){
         print(markalarFiltre);
         if(markalarFiltre.contains(myModels[index].marka) == true)
         {return Container(
           decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black87),borderRadius: BorderRadius.circular(5)),
           margin: EdgeInsets.all(10),
           height: 150,
           width: 1200,
           padding: EdgeInsets.all(2),
           child: Row(children: [
             Expanded(flex: 1,child:Image.network(myModels[index].image!),),
             Expanded(
               flex: 3,
               child: Column(children: [
                 Expanded(flex: 2,child: Center(child: Text(myModels[index].name!,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),)),
                 Expanded(flex: 2,child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Expanded(flex: 1,child: Text(myModels[index].kargoDurumu!,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.brown))),
                     Expanded(flex: 1,child: Card(child: Row(children: [Icon(Icons.star,color: Colors.yellow), Text("${myModels[index].rating!} kez satın alındı.",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14) )],))),
                   ],
                 )),
                 Expanded(
                   flex: 4,
                   child: Row(children: [
                     ...getSortedSites(index),

                     /* deneme
                     Expanded(flex: 1,child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: GetOutlinedButon("Trendyol.com",myModels[index].fiyatTrendyol.toString(),myModels[index].linkTrendyol!),
                     )
                     ),
                     VerticalDivider(color: Colors.black26,width: 1,thickness: 1),
                     Expanded(flex: 1,child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: GetOutlinedButon("Hepsiburada.com", myModels[index].fiyatHepsiburada.toString(),myModels[index].linkHepsiburada!)
                     ),),
                     VerticalDivider(color: Colors.black26,width: 1,thickness: 1),
                     Expanded(flex: 1,child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: GetOutlinedButon("N11.com", myModels[index].fiyatN11.toString(),myModels[index].linkN11!)
                     ),),
                     VerticalDivider(color: Colors.black26,width: 1,thickness: 1),
                     Expanded(flex: 1,child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: GetOutlinedButon("Teknosa.com", myModels[index].fiyatTeknosa.toString(),myModels[index].linkTeknosa!)
                     ),)
                   */
                   ],),
                 ),
               ],),
             ),

           ]
           ),);}
         else
           {return SizedBox(height: 1,width: 1,);}
       },
     );
    }

    return MaterialApp(
      initialRoute: '/',
      routes: {
        adminPage.route:(context) => adminPage(),
      },
      home:Builder(
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
                    children: [ Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1,child: Column(
                          children: [
                            SizedBox(height: 100,),
                            ...GetCheckBoxs(),
                            TextButton(onPressed: (){
                              setState(() {
                                currentState = 0;
                                sifirlaControl = 1;
                                for(int i = 0; i < markalar.length; i++)
                                {
                                  markalar[i].checked = false;
                                }
                              });
                            }, child:Text("Sıfırla",style: TextStyle(fontSize: 13)),),
                            TextButton(onPressed: (){
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
                        )),
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
                                  Expanded(flex: 1,child: TextButton(onPressed: () async {
                                    const url = 'https://www.hepsiburada.com/lenovo-ideapad-gaming-3-amd-ryzen-7-5800h-16gb-512gb-ssd-rtx3050ti-freedos-15-6-fhd-tasinabilir-bilgisayar-82k200jwtx-p-HBCV00000BDM22';
                                    if(await canLaunchUrl(Uri.parse(url))){
                                      launchUrl(Uri.parse(url),mode: LaunchMode.platformDefault);
                                    }
                                    else {throw 'Could not launch $url';}

                                  }, child: Text("ARA",style: TextStyle(fontSize: 15),))),
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
                                      print("bulunamadi");
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
                                      });}, child: Text("En Yüksek Puanlilar",style: TextStyle(color: Colors.black),)),
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
                              getProductsListView(),


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



          )),

    );


  }




  Widget GetOutlinedButon(String CompanyName,String Price,String Url){
    return OutlinedButton(onPressed: () async {
      const url = 'https://www.hepsiburada.com/lenovo-ideapad-gaming-3-amd-ryzen-7-5800h-16gb-512gb-ssd-rtx3050ti-freedos-15-6-fhd-tasinabilir-bilgisayar-82k200jwtx-p-HBCV00000BDM22';
      if(await canLaunchUrl(Uri.parse(Url))){
      launchUrl(Uri.parse(Url),mode: LaunchMode.platformDefault);
      }
      else {throw 'Could not launch $Url';}
    },style: OutlinedButton.styleFrom(
      alignment: Alignment.centerLeft,
      backgroundColor: Colors.white,
      foregroundColor: Colors.blueAccent,
    ), child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(Price,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
        Text(CompanyName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
      ],
    ), );
  }


  List<Widget> GetCheckBoxs(){
    List<CheckboxListTile> checkBoxs= [];
    for(int i=0 ; i < markalar.length; i++)
    {
      checkBoxs.add(CheckboxListTile(enableFeedback: true,title: Text(markalar[i].name,style: TextStyle(fontSize: 10)),controlAffinity: ListTileControlAffinity.leading,value: markalar[i].checked, onChanged: (newValue){setState(() {
        markalar[i].checked = newValue!;
        if(newValue = true){
        }
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
List<Brand> markalar=[
];



