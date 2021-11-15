class HealthWorkers{
  int ID;
  String names;
  String Phone;
  String Facility;
  String County;
  String SubCounty;
  int MFLCode;
  String Venue;
  String Gathering;
  int MenReached;
  int WomenReached;
  int DisabledReached;
  String InputDate;

  HealthWorkers(
    this.ID,
    this.names,
    this.Phone,
    this.Facility,
    this.County,
    this.SubCounty,
    this.MFLCode,
    this.Venue,
    this.Gathering,
    this.MenReached,
    this.WomenReached,
    this.DisabledReached,
    this.InputDate,
  );

  MaptoHealthWorkersMap() {
    return {
    "ID":ID,
    "names":names,
    "Phone":Phone,
    "Facility":Facility,
    "County":County,
    "SubCounty":SubCounty,
    "MFLCode":MFLCode,
    "Venue":Venue,
    "Gathering":Gathering,
    "MenReached":MenReached,
    "WomenReached":WomenReached,
    "DisabledReached":DisabledReached,
    "InputDate":InputDate,
    };
  }

  static fromMap(Map c) {
    return HealthWorkers(c['ID'], c['names'], c['Phone'], c['Facility'], c['County'], c['SubCounty'], c['MFLCode'],
        c['Venue'], c['Gathering'],c['MenReached'], c['WomenReached'], c['DisabledReached'], c['InputDate']);
    }
}