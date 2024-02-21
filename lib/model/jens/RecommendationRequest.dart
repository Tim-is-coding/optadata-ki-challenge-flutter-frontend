class RecommendationRequest {
  String? krankenkassenIk;
  String? diagnoseText;
  String? icd10Code;

  RecommendationRequest();

  RecommendationRequest.fromJson(Map<String, dynamic> json) {
    krankenkassenIk = json['krankenkassenIk'];
    diagnoseText = json['diagnoseText'];
    icd10Code = json['icd10Code'];
  }

  Map<String, dynamic> toJson() {
    return {
      'krankenkassenIk': krankenkassenIk,
      'diagnoseText': diagnoseText,
      'icd10Code': icd10Code,
    };
  }

  static List<RecommendationRequest> listFromJson(List<dynamic> json) {
    return json.map((value) => RecommendationRequest.fromJson(value)).toList();
  }

  static Map<String, RecommendationRequest> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, RecommendationRequest>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = RecommendationRequest.fromJson(value));
    }
    return map;
  }
}
