import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ProductModel.dart';





class ApiService{
  List<ProductModel> productModels = [];


  Future<List<ProductModel>> fetchProducts() async {

    String URL = "http://127.0.0.1:5000";
    final response = await http.get(Uri.parse(URL));
    if(response.statusCode == 200){
     // print(response.body);
      List responseJson = json.decode(response.body);
      responseJson.map((m) => productModels.add(new ProductModel.fromJson(m))).toList();
     return productModels;//ProductModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("failed to load products");
    }

  }




  }



