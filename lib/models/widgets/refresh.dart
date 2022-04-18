import 'package:flutter/material.dart';

class RefreshData extends StatelessWidget {
  const RefreshData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              './imagens/reload1.gif',
              width: 80,
              height: 80,
            ),
            const SizedBox(
              width: 12,
            ),
            const Text(
              "Loading more...",
              style: TextStyle(color: Colors.black54, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
