import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login".tr(),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == 'ar') {
                context.setLocale(Locale('en'));
              } else {
                context.setLocale(Locale('ar'));
              }
            },
            icon: Icon(Icons.language),
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Welcome".tr(),
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text("Email".tr()),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    icon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text("Name".tr()),
                    /*labelStyle:TextStyle(color: Colors.pink),*/
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    icon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text("Password".tr()),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    icon: Icon(Icons.password),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: confirmController,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text("Confirm Password".tr()),
                    /*labelStyle:TextStyle(color: Colors.pink),*/
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    icon: Icon(Icons.password),
                  ),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print("email is : ${emailController.text}");
                    print("password is : ${passwordController.text}");
                  },

                  child: Text(
                    "Login".tr(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already?".tr()),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text("Login".tr()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
