import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:listfilter/models/controller/controllerData.dart';

class SearchText extends StatefulWidget {
  const SearchText({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchText> createState() => _SearchTextState();
}

class _SearchTextState extends State<SearchText> {
  TextEditingController controlle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerData>(
      builder: (_) => TextField(
        controller: controlle,
        onChanged: (value) {
          _.searchPerson(value);
          ScaffoldMessenger.of(context);
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Searching',
          labelStyle: TextStyle(color: Colors.black38, fontSize: 16),
          suffixIcon: Icon(
            Icons.person_search,
            size: 25,
          ),
        ),
      ),
    );
  }
}
