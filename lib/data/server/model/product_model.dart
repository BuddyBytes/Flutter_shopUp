class ProductsJson {
  bool? status;
  ProductsData? data;

  ProductsJson.fromProductJson(Map<String, dynamic> json, int index) {
    status = json["status"];
    data = ProductsData.fromProductJson(json["data"], index);
  }
}

class ProductsData {
  ProductsDataEach? eachOne;
  List<dynamic>? count;

  ProductsData.fromProductJson(Map<String, dynamic> json, int index) {
    count = json["data"];
    eachOne = ProductsDataEach.fromProductJson(json["data"], index);
  }
}

class ProductsDataEach {
  int? price;
  int? discount;
  String? image;
  String? name;
  bool? inFavorites;
  bool? inCart;

  ProductsDataEach.fromProductJson(List json, int index) {
    price = json[index]["price"];
    discount = json[index]["discount"];
    image = json[index]["image"];
    name = json[index]["name"];
    inFavorites = json[index]["inFavorites"];
    inCart = json[index]["incart"];
  }
}
