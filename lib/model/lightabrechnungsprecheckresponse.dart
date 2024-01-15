class LightAbrechnungsPrecheckResult {
  bool? success;

  LightAbrechnungsPrecheckResult(){
    success = false;}

  LightAbrechnungsPrecheckResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
    };
  }

  static List<LightAbrechnungsPrecheckResult> listFromJson(List<dynamic> json) {
    return json
        .map((value) => LightAbrechnungsPrecheckResult.fromJson(value))
        .toList();
  }

  static Map<String, LightAbrechnungsPrecheckResult> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, LightAbrechnungsPrecheckResult>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = LightAbrechnungsPrecheckResult.fromJson(value));
    }
    return map;
  }
}
