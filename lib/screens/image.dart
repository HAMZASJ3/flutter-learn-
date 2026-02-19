import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Image.asset("assets/images/bmwww.png", height: 200, width: 200),
              SizedBox(height: 20),
              Image.asset("assets/images/bmwww.png", height: 200, width: 200),
            ],
          ),
        ],
      ),
      /*Image.network(
        "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
      ),*/
    );
  }
}
