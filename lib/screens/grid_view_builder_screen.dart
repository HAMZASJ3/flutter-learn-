import 'package:flutter/material.dart';

class GridViewBuilderScreen extends StatefulWidget {
  const GridViewBuilderScreen({super.key});

  @override
  State<GridViewBuilderScreen> createState() => _GridViewBuilderScreenState();
}

class _GridViewBuilderScreenState extends State<GridViewBuilderScreen> {
  List<String> names = [
    "Hamza",
    "Neno",
    "Laith",
    "pedro",
    "Ahmad",
    "Samer",
    "Saleem",
    "Sami",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grid View",
          style: TextStyle(backgroundColor: Colors.pink),

        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: GridView.builder(
        /* gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
        ),*/

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(30.10),
            child: Container(
              height: 50,
              color: Colors.pink[600],
              child: Center(child: Text(names[index])),
            ),
          );
        },
      ),
    );
  }
}
