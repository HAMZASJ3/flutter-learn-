import 'package:flutter/material.dart';

class CostumContainer extends StatelessWidget {
  const CostumContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.pink, width: 10),
        ),
        child: Center(
          child: Text("hamza", style: TextStyle(color: Colors.white)),
        ),
      )),
    );
  }
}
