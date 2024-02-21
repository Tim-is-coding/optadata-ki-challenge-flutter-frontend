class AiRecommondation {
  AiRecommondationItem? hilfsmittelNummer;
  List<AiRecommondationItem>? prices;

  AiRecommondation.fromJson(Map<String, dynamic> json) {
    prices = AiRecommondationItem.listFromJson(json['prices']);
    hilfsmittelNummer =
        AiRecommondationItem.fromJson(json['hilfsmittelNummer']);
  }

  Map<String, dynamic> toJson() {
    return {
      'hilfsmittelNummer': hilfsmittelNummer,
      'prices': prices,
    };
  }

  static List<AiRecommondation> listFromJson(List<dynamic> json) {
    return json.map((value) => AiRecommondation.fromJson(value)).toList();
  }

  static Map<String, AiRecommondation> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, AiRecommondation>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = AiRecommondation.fromJson(value));
    }
    return map;
  }
}

class AiRecommondationItem {
  String? value;
  int? percentage;

  AiRecommondationItem.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'percentage': percentage,
    };
  }

  static List<AiRecommondationItem> listFromJson(List<dynamic> json) {
    return json.map((value) => AiRecommondationItem.fromJson(value)).toList();
  }

  static Map<String, AiRecommondationItem> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, AiRecommondationItem>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = AiRecommondationItem.fromJson(value));
    }
    return map;
  }
}
