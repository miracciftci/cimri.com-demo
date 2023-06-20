import 'dart:convert';

List<ProductModel> ProductModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));


class ProductModel {
  String? linkTeknosa;
  String? linkTrendyol;
  String? linkN11;
  String? linkHepsiburada;
  String? fiyatHepsiburada;
  String? fiyatTeknosa;
  String? fiyatTrendyol;
  String? fiyatN11;
  String? diskKapasitesi;
  String? distTuru;
  String? ekranBoyutu;
  String? ram;
  int? id;
  String? name;
  String? marka;
  String? modelNo;
  String? image;
  String? kargoDurumu;
  String? rating;



  ProductModel({
    this.linkTeknosa,
    this.linkTrendyol,
    this.linkN11,
    this.linkHepsiburada,
    this.fiyatHepsiburada,
    this.fiyatTeknosa,
    this.fiyatTrendyol,
    this.fiyatN11,
    this.diskKapasitesi,
    this.distTuru,
    this.ekranBoyutu,
    this.ram,
    this.id,
    this.name,
    this.marka,
    this.modelNo,
    this.image,
    this.kargoDurumu,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        linkTeknosa: json['LinkTeknosa'],
        linkTrendyol: json['linkTrendyol'],
        linkN11: json['Linkn11'],
        linkHepsiburada: json['linkHepsiburada'],
        fiyatHepsiburada: json['fiyatHepsiburada'],
        fiyatTeknosa: json['fiyatTeknosa'],
        fiyatTrendyol: json['fiyatTrendyol'],
        fiyatN11: json['fiyatn11'],
      diskKapasitesi: json['diskKapasitesi'],
      distTuru: json['diskTuru'],
      ekranBoyutu: json['ekranBoyutu'],
      ram: json['ram'],
      id: json['id'],
      name: json['name'],
      marka: json['marka'],
      modelNo: json['modelNo'],
      image: json['image'],
      kargoDurumu: json['kargoDurumu'],
      rating: json['rating'],

    );
  }

}