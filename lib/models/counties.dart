class CountyModel {
  final String id;
  final String county;

  CountyModel(
      {required this.id, required this.county});

  factory CountyModel.fromJson(Map<String, dynamic> json) {
    return CountyModel(
      id: json["ID"],
      county: json["County"],
    );
  }

  static List<CountyModel> fromJsonList(List list) {
    return list.map((item) => CountyModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.county}';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(CountyModel? model) {
    return this.id == model?.id;
  }

  @override
  String toString() => county;
}
