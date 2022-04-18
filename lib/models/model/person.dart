import 'dart:convert';

class DataPerson {
  final String gender;
  final String last;
  final String title;
  final String first;
  final String email;
  final String phone;
  final String cell;
  final String picturelarge;
  final String picturemedium;
  final String picturethumbnail;

  final String city;
  final String state;
  final String country;
  final String street;
  final int number;
  final String username;
  final String uuid;
  final String password;
  final String salt;
  final String md5;
  final String sha1;
  final String sha256;
  final String registered;
  final int registeredage;
  final String idname;
  final String idvalue;
  final String nat;
  final int age;
  final String datenas;
  final String postcode;

  DataPerson({
    required this.picturemedium,
    required this.picturethumbnail,
    required this.postcode,
    required this.idname,
    required this.idvalue,
    required this.nat,
    required this.registered,
    required this.registeredage,
    required this.uuid,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
    required this.datenas,
    required this.age,
    required this.username,
    required this.country,
    required this.street,
    required this.number,
    required this.gender,
    required this.last,
    required this.title,
    required this.first,
    required this.email,
    required this.phone,
    required this.cell,
    required this.picturelarge,
    required this.city,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'last': last,
      'title': title,
      'first': first,
      'email': email,
      'phone': phone,
      'cell': cell,
      'picturelarge': picturelarge,
      'city': city,
      'state': state,
      'country': country,
      'number': number,
      'street': street,
      'username': username,
      'age': age,
      'date': datenas,
      'uuid': uuid,
      'password': password,
      'salt': salt,
      'md5': md5,
      'sha1': sha1,
      'sha256': sha256,
      'idname': idname,
      'idvalue': idvalue,
      'nat': nat,
      'registered': registered,
      'registeredage': registeredage,
      'postcode': postcode,
      'picturemedium': picturemedium,
      'picturethumbnail': picturethumbnail,
    };
  }

  factory DataPerson.fromMap(Map<String, dynamic> map) {
    late String valuePostcode = map['location']['postcode'].toString();

    return DataPerson(
      gender: map['gender'] ?? '',
      last: map['name']['last'] ?? '',
      title: map['name']['title'] ?? '',
      first: map['name']['first'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      cell: map['cell'] ?? '',
      picturelarge: map['picture']['large'] ?? '',
      picturemedium: map['picture']['medium'] ?? '',
      picturethumbnail: map['picture']['thumbnail'] ?? '',
      city: map['location']['city'] ?? '',
      state: map['location']['state'] ?? '',
      country: map['location']['country'] ?? '',
      number: map['location']['street']['number'] ?? '',
      street: map['location']['street']['name'] ?? '',
      username: map['login']['username'],
      age: map['dob']['age'] ?? 0,
      datenas: map['dob']['date'] ?? '',
      uuid: map['login']['uuid'] ?? '',
      password: map['login']['password'] ?? '',
      salt: map['login']['salt'] ?? '',
      md5: map['login']['md5'] ?? '',
      sha1: map['login']['sha1'] ?? '',
      sha256: map['login']['sha256'] ?? '',
      idname: map['id']['name'] ?? '',
      idvalue: map['id']['value'] ?? '',
      nat: map['nat'] ?? '',
      registered: map['registered']['date'] ?? '',
      registeredage: map['registered']['age'] ?? 0,
      postcode: valuePostcode,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataPerson.fromJson(String source) =>
      DataPerson.fromMap(json.decode(source));
}
