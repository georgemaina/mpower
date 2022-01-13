class Users {
   final int ID;
   final String names;
   final String facility;
   final String mflcode;

  Users({
    required this.ID,
    required this.names,
    required this.facility,
    required this.mflcode,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(ID:json['ID'],names:json['names'],facility:json['facility'],mflcode:json['mflcode'],
    );
  }
}