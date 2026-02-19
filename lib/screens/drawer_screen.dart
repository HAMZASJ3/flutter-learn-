import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar with hamburger button "),
        centerTitle: true,
        // leading: Builder(
        //   builder: (context) {
        //     return IconButton(
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       icon: Icon(Icons.menu),
        //     );
        //   },
        // ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              child: Center(
                child: Text(
                  "Drawer Header",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Games"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ExpansionTile(
              title: Text("Others"),
              children: [
                ListTile(title: Text("Food")),
                ListTile(title: Text("Clothes")),
              ],
            ),
            ListTile(
              title: Text("Cards"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ExpansionTile(
              title: Text("Setting"),
              children: [
                ListTile(title: Text("profile"), onTap: () {}),
                ListTile(title: Text("Change Pass"), onTap: () {}),
                ListTile(title: Text("Log Out"), onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
