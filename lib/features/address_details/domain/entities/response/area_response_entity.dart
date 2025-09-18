class AreaResponseEntity {
  AreaResponseEntity({this.data});

  List<AreaDataResponseEntity>? data;
}

class AreaDataResponseEntity {
  AreaDataResponseEntity({
    this.id,
    this.governorateId,
    this.cityNameAr,
    this.cityNameEn,
  });

  String? id;
  String? governorateId;
  String? cityNameAr;
  String? cityNameEn;
}
