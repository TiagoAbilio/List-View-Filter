import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listfilter/models/controller/controllerData.dart';
import 'package:listfilter/models/widgets/personsViwer.dart';
import 'package:listfilter/models/widgets/refresh.dart';
import 'package:listfilter/models/widgets/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ControllerData>(
        id: "novaTela",
        init: ControllerData(),
        builder: (_) => Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Pharma Inc',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40, right: 8, left: 8, bottom: 30),
                    child: Row(
                      children: [
                        const Expanded(child: SearchText()),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: _.filterF(context)),
                      ],
                    ),
                  ),
                  GetBuilder<ControllerData>(
                    id: "filter",
                    builder: (_) => _.filtrando
                        ? const Center(
                            child: RefreshData(),
                          )
                        : const PersonsViewer(),
                  ),
                ],
              ),
              Align(
                alignment: const Alignment(0, 1),
                child: GetBuilder<ControllerData>(
                    id: "refresh",
                    builder: (_) =>
                        _.refreshTela ? const RefreshData() : Container()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
