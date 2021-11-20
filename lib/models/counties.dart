class Counties{
  int id;
  String countycode;
  String county;

  Counties(
      this.id,
      this.countycode,
      this.county
      );

  MaptoCountiesListMap() {
    return {
      "id":id,
      "countycode":countycode,
      "county":county,
    };
  }

  static fromMap(Map c) {
    return Counties(c['id'], c['countycode'], c['county']);
  }
}

class SubCounties{
  int id;
  String countycode;
  String county;
  String sub_county;

  SubCounties(
      this.id,
      this.countycode,
      this.county,
      this.sub_county
      );

  MaptoSubCountiesListMap() {
    return {
      "id":id,
      "countycode":countycode,
      "county":county,
      "sub_county":sub_county
    };
  }

  static fromMap(Map c) {
    return SubCounties(c['id'], c['countycode'], c['county'],c['sub_county']);
  }
}