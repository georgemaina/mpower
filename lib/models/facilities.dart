class FacilityModel {
  final int mflcode;
  final String facilityname;

  FacilityModel({required this.mflcode, required this.facilityname});

  factory FacilityModel.fromJson(Map<String, dynamic> json) {
    // if (json == null) return null;
    return FacilityModel(
      mflcode: json["mflcode"],
      facilityname: json["facilityname"]
    );
  }

  static List<FacilityModel> fromJsonList(List list) {
    return list.map((item) => FacilityModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.mflcode} ${this.facilityname}';
  }

  ///custom comparing function to check if two users are equal
  // bool isEqual(FacilityModel model) {
  //   return this?.mflcode == model?.mflcode;
  // }

  @override
  String toString() => facilityname;
}