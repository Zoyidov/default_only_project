class ContactModelFields {
  static const String name = "name";
  static const String surname = "surname";
  static const String phone = "phone";
  static const String image = "image";


  static const String contactsTable = "new _contacts";


}

class ContactModelSql {
  final String name;
  final String surname;
  final String phone;
  final String image;

  ContactModelSql({
    required this.name,
    required this.surname,
    required this.phone,
    required this.image,

  });

  ContactModelSql copyWith({
    String? name,
    String? surname,
    String? phone,
    String? image,
  }) {
    return ContactModelSql(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      image: phone ?? this.image,

    );
  }

  factory ContactModelSql.fromJson(Map<String, dynamic> json) {
    return ContactModelSql(
      name: json[ContactModelFields.name] ?? "",
      surname: json[ContactModelFields.surname] ?? "",
      phone: json[ContactModelFields.phone] ?? "",
      image: json[ContactModelFields.image] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ContactModelFields.name: name,
      ContactModelFields.surname: surname,
      ContactModelFields.phone: phone,
      ContactModelFields.image: image,
    };
  }

  @override
  String toString() {
    return '''
      name: $name,
      surname: $surname 
      phone: $phone
      image: $image
    ''';
  }
}