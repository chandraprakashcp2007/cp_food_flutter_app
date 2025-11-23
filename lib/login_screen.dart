import 'package:flutter/material.dart';
import 'package:testing/colours.dart';
import 'constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // -------------------- TOP IMAGE + GRADIENT --------------------
              Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/food_bg.jpg',
                    height: height * 0.35,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: height * 0.35,
                    width: width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // -------------------- APP NAME --------------------
              Align(
                alignment: Alignment.center,
                child: Text(
                  appName,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              Center(
                child: Text(
                  slogan,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),

              // -------------------- LOGIN HEADING --------------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        primarycolor.withOpacity(0.3),
                        primarycolor.withOpacity(0.01),
                      ],
                    ),
                    border: Border(
                      left: BorderSide(color: primarycolor, width: 5),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      loginString,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),

              // -------------------- EMAIL FIELD --------------------
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
                child: TextFormField(
                  onSaved: (value) => _email = value!,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return "Please Enter Email";
                    }

                    String pattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                    RegExp regex = RegExp(pattern);

                    if (!regex.hasMatch(email)) {
                      return "Enter a valid Email";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primarycolor),
                    ),
                    prefixIcon: Icon(Icons.email, color: primarycolor),
                    labelText: "EMAIL ADDRESS",
                    labelStyle: TextStyle(color: primarycolor, fontSize: 20),
                  ),
                ),
              ),

              // -------------------- PASSWORD FIELD --------------------
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 40, right: 10),
                child: TextFormField(
                  obscureText: true,
                  onSaved: (value) => _password = value!,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return "Please Enter Password";
                    }

                    String pattern =
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
                    RegExp regex = RegExp(pattern);

                    if (!regex.hasMatch(password)) {
                      return "Password must be 8+ chars, include Upper, Lower, Number & Special char";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primarycolor),
                    ),
                    prefixIcon: Icon(Icons.lock_open, color: primarycolor),
                    labelText: "PASSWORD",
                    labelStyle: TextStyle(color: primarycolor, fontSize: 20),
                  ),
                ),
              ),

              // -------------------- FORGOT PASSWORD --------------------
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primarycolor,
                    ),
                  ),
                ),
              ),

              // -------------------- LOGIN BUTTON --------------------
              Center(
                child: SizedBox(
                  height: height * 0.08,
                  width: width - 30,
                  child: FloatingActionButton(
                    backgroundColor: primarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();

                        print(_email);
                        print(_password);
                      }
                    },
                    child: const Text(
                      "Login TO Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // -------------------- CREATE ACCOUNT --------------------
              const Align(
                alignment: Alignment.center,
                child: Text("Don't Have An Account ?"),
              ),

              Align(
                alignment: Alignment.center,
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: primarycolor,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // -------------------- DEVELOPED BY --------------------
              const Center(
                child: Text(
                  "Developed By Chandru",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
