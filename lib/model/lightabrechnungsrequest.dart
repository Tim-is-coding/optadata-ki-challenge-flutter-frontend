import 'dart:convert';

class LightAbrechnungsrequest {
  String? id;
  String? krankenkassenIk;
  String? patientBirthday;
  List<LightAbrechnungsRequestProductDelivery>? productDeliveries;

  Map<String, dynamic> toJson() {
    return {
      'krankenkassenIk': krankenkassenIk,
      'productDeliveries': productDeliveries?.map((e) => e.toJson()).toList(),
      'patientBirthday': patientBirthday,

    };
  }
}

class LightAbrechnungsRequestProductDelivery {
  String? deliveryDate;
  List<LightAbrechnungsRequesProduct>? deliveredProducts;

  Map<String, dynamic?> toJson() {
    return {
      'deliveryDate': deliveryDate,
      'deliveredProducts': deliveredProducts?.map((e) => e.toJson()).toList(),
    };
  }
}

class LightAbrechnungsRequesProduct {
  int? amount;
  String? hilfmittelnummer;

  Map<String, String?> toJson() {
    return {
      'amount': amount.toString(),
      'hilfmittelnummer': hilfmittelnummer,
    };
  }
}
