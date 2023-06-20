
class Product{
  String? Name;
  String? WebSitesi;
  double? Fiyat;
  String? KargoDurumu;
  String? Marka;
  String? Rating;
  int? id;


  static Product? seciliUrun;
  static void putProduct(Product gonderilenUrun){
    seciliUrun = gonderilenUrun;
  }

  Product(String name,String webSitesi,double fiyat,String kargoDurumu,String marka, String rating,int id){
    this.Name = name;
    this.WebSitesi = webSitesi;
    this.Fiyat=fiyat;
    this.KargoDurumu = kargoDurumu;
    this.Marka = marka;
    this.Rating = rating;
    this.id= id;
  }
  static String getImageLink(String marka){
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
  Map<String , dynamic> toJson() => {
  "name" : this.Name,
  "webSitesi": this.WebSitesi,
  "fiyat": this.Fiyat,
  "kargoDurumu" : this.KargoDurumu,
  "marka" : this.Marka,
  "rating" : this.Rating,
   "id" : this.id,
  };

}

