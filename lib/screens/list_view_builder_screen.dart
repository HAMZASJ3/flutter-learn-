import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({super.key});

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  List<String> names = [
    "Hamza",
    "Neno",
    "Laith",
    "pedro",
    "Ahmad",
    "Samer",
    "saleem",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View Builder"), centerTitle: true),
      body: ListView.separated(
        itemCount: names.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.pink[600],
            child: Center(child: Text(names[index])),
          );
        },
      ),
    );
  }
}
