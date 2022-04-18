// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/controllerData.dart';

class PersonsViewer extends StatefulWidget {
  const PersonsViewer({Key? key}) : super(key: key);

  @override
  State<PersonsViewer> createState() => _PersonsViewerState();
}

class _PersonsViewerState extends State<PersonsViewer> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerData>(
      id: "novaTela",
      builder: (_) => Expanded(
        child: RefreshIndicator(
          edgeOffset: 0,
          onRefresh: _.refreshPersons,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _.dataCopi.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => _.showInforPerson(context, index)),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: const Color.fromARGB(255, 128, 126, 126),
                    width: 2,
                  )),
                  child: Row(
                    children: [
                      ClipOval(
                        child: FadeInImage.assetNetwork(
                          placeholder: './imagens/logo.png',
                          image: _.dataCopi[index].picturethumbnail,
                          fadeInDuration: const Duration(seconds: 2),
                          fit: BoxFit.contain,
                          height: 80,
                          width: 80,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("${_.dataCopi[index].title} "),
                              Text("${_.dataCopi[index].first} "),
                              Text(_.dataCopi[index].last),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                  "${_.dataCopi[index].gender[0].toUpperCase()}${_.dataCopi[index].gender.substring(1)}"),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                DateFormat("dd-MM-yyyy").format(
                                  DateTime.parse(
                                    _.dataCopi[index].datenas.substring(0, 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
