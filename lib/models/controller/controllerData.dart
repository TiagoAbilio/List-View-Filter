// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:listfilter/models/model/person.dart';

class ControllerData extends GetxController {
  List<DataPerson> dataPerson = [];
  List<DataPerson> dataCopi = [];
  bool _refreshTela = false;
  bool get refreshTela => _refreshTela;
  final Dio _dio = Dio();
  int _quantsearch = 50;
  final String _url = "https://randomuser.me/api/?results=";
  String _filter = "";
  String get filter => _filter;
  bool _filtrando = false;
  bool get filtrando => _filtrando;

  Future getPerson() async {
    final response = await _dio.get("$_url$_quantsearch");
    if (response.statusCode == 200) {
      await response.data['results'].map((value) async {
        final data = DataPerson.fromMap(value);
        dataPerson.add(data);
        dataCopi.add(data);
        return data;
      }).toList();
      _refreshTela = false;
      update(["novaTela", "refresh"]);
    } else {
      throw "error";
    }
  }

  searchPerson(String query) {
    final person = dataPerson.where((element) {
      final name = element.last.toLowerCase();
      final nascinalidade = element.nat.toLowerCase();
      return name.contains(query) || nascinalidade.contains(query);
    }).toList();
    dataCopi = person;
    update(["novaTela"]);
  }

  Future<void> refreshPersons() async {
    _refreshTela = true;
    _filter = "";
    update(["refresh"]);
    Future.delayed(const Duration(seconds: 5), () {
      _quantsearch += 50;
      getPerson();
    });
  }

  Widget showInforPerson(BuildContext context, int index) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Stack(
          children: [
            Align(
              alignment: const Alignment(0, -1.3),
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: './imagens/logo.png',
                  image: dataCopi[index].picturethumbnail,
                  fadeInDuration: const Duration(seconds: 2),
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(1, -1),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.black45,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.73),
              child: Text(
                "${dataCopi[index].title} ${dataCopi[index].first} ${dataCopi[index].last}",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.3),
              child: Container(
                margin: const EdgeInsets.only(left: 70),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text("Email: "),
                          Text(
                            dataCopi[index].email,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("Gênero: "),
                          Text(
                              "${dataCopi[index].gender[0].toUpperCase()}${dataCopi[index].gender.substring(1)}"),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("Data Nasc: "),
                          Text(
                            DateFormat("dd-MM-yyyy").format(
                              DateTime.parse(
                                dataCopi[index].datenas.substring(0, 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("Telefone: "),
                          Text(dataCopi[index].phone),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("Nacionalidade: "),
                          Text(dataCopi[index].nat),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("Cidade: "),
                          Text(dataCopi[index].city),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("Estado: "),
                          Text(dataCopi[index].state),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("Pais: "),
                          Text(dataCopi[index].country),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("Cod Postal: "),
                          Text(dataCopi[index].postcode),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("Rua: "),
                          Text(dataCopi[index].street),
                          Text("  Nº: ${dataCopi[index].number}")
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      (dataCopi[index].idname == null ||
                                  dataCopi[index].idname == "") ||
                              (dataCopi[index].idvalue == null ||
                                  dataCopi[index].idvalue == "")
                          ? const Text("")
                          : Row(
                              children: [
                                const Text("Id: "),
                                Text(
                                    "${dataCopi[index].idname} - ${dataCopi[index].idvalue}"),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget filterF(BuildContext context) {
    return DropdownButton<String>(
      icon: const Icon(
        Icons.filter_alt_sharp,
        size: 35,
      ),
      alignment: Alignment.center,
      underline: Container(
        color: Colors.transparent,
      ),
      onChanged: (newValue) {
        _filter = newValue.toString();
        if (filter == "Male") {
          ordeyGenderMale();
        } else {
          ordeyGenderFemale();
        }
      },
      items: <String>['Female', 'Male']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          alignment: Alignment.center,
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  ordeyGenderMale() {
    _filtrando = true;
    update(["filter"]);
    dataCopi.sort((a, b) => a.gender.length.compareTo(b.gender.length));
    Future.delayed(const Duration(seconds: 2), () {
      _filtrando = false;
      update(["filter"]);
    });
  }

  ordeyGenderFemale() {
    _filtrando = true;
    update(["filter"]);
    dataCopi.sort(
      (a, b) => a.gender.compareTo(b.gender),
    );
    Future.delayed(const Duration(seconds: 2), () {
      _filtrando = false;
      update(["filter"]);
    });
  }
}
