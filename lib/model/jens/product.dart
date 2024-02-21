class Product {
  String? id = null;
  String? manufacturer = null;
  String? pzn = null;
  String? articleName = null;
  String? productDescription = null;
  String? productDistributer = null;
  String? linkToProductPicture = null;
  String? articleNumberOfProducer = null;
  String? hilfsmittelnummer = null;
  List<String>? furtherProductInfos = [];
  String? mengenangabe = null;
  String? mengeneinheit = null;
  String? darreichungsform = null;
  int? gebinde = null;
  String? sangroAvailability = null;

  Product();

  @override
  String toString() {
    return 'Product[id=$id, articleName=$articleName';
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    manufacturer = json['manufacturer'];
    pzn = json['pzn'];
    articleName = json['articleName'];
    productDescription = json['productDescription'];
    productDistributer = json['productDistributer'];
    linkToProductPicture = json['linkToProductPicture'];
    articleNumberOfProducer = json['articleNumberOfProducer'];
    hilfsmittelnummer = json['hilfsmittelnummer'];

    List<dynamic> pro = json['furtherProductInfos'];
    for (dynamic d in pro) {
      furtherProductInfos!.add(d);
    }

    //furtherProductInfos = json['furtherProductInfos'];
    darreichungsform = json['darreichungsform'];
    mengenangabe = json['mengenangabe'];
    mengeneinheit = json['mengeneinheit'];
    gebinde = json['gebinde'];
    sangroAvailability = json['sangroAvailability'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'manufacturer': manufacturer,
      'pzn': pzn,
      'articleName': articleName,
      'productDescription': productDescription,
      'productDistributer': productDistributer,
      'linkToProductPicture': linkToProductPicture,
      'articleNumberOfProducer': articleNumberOfProducer,
      'hilfsmittelnummer': hilfsmittelnummer,
      'furtherProductInfos': furtherProductInfos,
      'darreichungsform': darreichungsform,
      'sangroAvailability': sangroAvailability,
      'mengenangabe': mengenangabe,
      'mengeneinheit': mengeneinheit,
      'gebinde': gebinde
    };
  }

  static List<Product> listFromJson(List<dynamic> json) {
    return json == null
        ? <Product>[]
        : json.map((value) => Product.fromJson(value)).toList();
  }

  static Map<String, Product> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, Product>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = Product.fromJson(value));
    }
    return map;
  }
}
