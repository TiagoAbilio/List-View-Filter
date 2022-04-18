import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listfilter/models/ui/home.dart';

import '../controller/controllerData.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ControllerData _controllerData = Get.put(ControllerData());
  @override
  void initState() {
    _controllerData.getPerson().then(
          (value) => Get.to(
            () => const HomePage(),
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('./imagens/logo.png'),
        ],
      ),
    );
  }
}
