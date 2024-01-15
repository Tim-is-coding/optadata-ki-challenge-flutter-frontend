class LightAbrechnungsResult {
  List<LightAbrechnungsResultIItem>? items;

  LightAbrechnungsResult.fromJson(Map<String, dynamic> json) {
    items = LightAbrechnungsResultIItem.listFromJson(json['items']);
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items,
    };
  }

  static List<LightAbrechnungsResult> listFromJson(List<dynamic> json) {
    return json.map((value) => LightAbrechnungsResult.fromJson(value)).toList();
  }

  static Map<String, LightAbrechnungsResult> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, LightAbrechnungsResult>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = LightAbrechnungsResult.fromJson(value));
    }
    return map;
  }
}

class LightAbrechnungsResultIItem {
  bool? success;
  bool? pauschaleAlreadyCoveredy;
  String? urlToImage;
  String? hilfmittelnummer;
  String? pzn;
  String? lex;

  double? nettoPreis;
  double? mwst;
  double? bruttoPreis;
  double? zuzahlung;
  int? faktor;

  get displayName => hilfmittelnummer ?? pzn;

  LightAbrechnungsResultIItem.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    pauschaleAlreadyCoveredy = json['pauschaleAlreadyCoveredy'];
    urlToImage = json['urlToImage'];
    hilfmittelnummer = json['hilfmittelnummer'];
    pzn = json['pzn'];
    lex = json['lex'];
    nettoPreis = json['nettoPreis'];
    mwst = json['mwst'];
    bruttoPreis = json['bruttoPreis'];
    zuzahlung = json['zuzahlung'];
    faktor = json['faktor'];
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'urlToImage': urlToImage,
      'pauschaleAlreadyCoveredy': pauschaleAlreadyCoveredy,
      'hilfmittelnummer': hilfmittelnummer,
      'pzn': pzn,
      'lex': lex,
      'nettoPreis': nettoPreis,
      'mwst': mwst,
      'bruttoPreis': bruttoPreis,
      'zuzahlung': zuzahlung,
      'faktor': faktor,
    };
  }

  static List<LightAbrechnungsResultIItem> listFromJson(List<dynamic> json) {
    return json
        .map((value) => LightAbrechnungsResultIItem.fromJson(value))
        .toList();
  }

  static Map<String, LightAbrechnungsResultIItem> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, LightAbrechnungsResultIItem>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = LightAbrechnungsResultIItem.fromJson(value));
    }
    return map;
  }
}
