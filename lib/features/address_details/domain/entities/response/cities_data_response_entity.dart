class CitiesDataResponseEntity {
  CitiesDataResponseEntity({
    this.id,
    this.governorateNameAr,
    this.governorateNameEn,
  });

  CitiesDataResponseEntity.fromJson(dynamic json) {
    id = json['id'];
    governorateNameAr = json['governorate_name_ar'];
    governorateNameEn = json['governorate_name_en'];
  }

  String? id;
  String? governorateNameAr;
  String? governorateNameEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['governorate_name_ar'] = governorateNameAr;
    map['governorate_name_en'] = governorateNameEn;
    return map;
  }
}
