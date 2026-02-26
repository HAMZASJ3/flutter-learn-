import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:project/screens/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constant/svg_constant.dart';
import '../core/utils/shared_preference_helper.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? isRememberMe = false;
  bool? isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "eGiftly".tr(),
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
                SvgPicture.asset(SvgConstant.profile),
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
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text("Password".tr()),
                    /*labelStyle:TextStyle(color: Colors.pink),*/
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    icon: Icon(Icons.password),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: isRememberMe,
                      onChanged: (bool? value) {
                        setState(() => isRememberMe = value);
                        print("Remember Me value is : $isRememberMe");
                      },
                    ),
                    Text("Remember Me".tr()),
                  ],
                ),
                SizedBox(height: 20),
                if (isLoading!)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('isRememberMe', isRememberMe!);
                      final bool? Remember = prefs.getBool('isRememberMe');
                      print("Remember Me value is : $Remember");

                      login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
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
                    Text("Don't?".tr()),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text("Sign".tr()),
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

// API
  login({required String email, required String password}) async {
    isLoading = true;
    setState(() {});
    final response = await http.post(
      Uri.parse("https://reqres.in/api/login"),
      body: jsonEncode({"email": email, "password": password}),
      headers: {"Content-Type": "application/json"},
    );
    isLoading = false;
    setState(() {});
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      if (jsonBody["reslt"]) {
        String accessToken = jsonBody["access_token"];
        await SharedPreferencesHelper.saveString("accessToken", accessToken);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }
  }
}
