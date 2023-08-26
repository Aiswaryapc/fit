import 'package:fit/Widgets/appFormField.dart';
import 'package:fit/Widgets/button.dart';
import 'package:fit/home.dart';
import 'package:fit/pages/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fit/constants/colors.dart';
import '../constants/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

void _showToast(String message) {
  Fluttertoast.showToast(
      msg: message, toastLength: Toast.LENGTH_LONG, fontSize: 16);
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [AppColors.bglight, AppColors.white])),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 50, bottom: 10, right: 50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                "Login",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: AppColors.purple),
              ),
              SizedBox(
                height: 30,
              ),
              AppFormField(
                  controller: _emailController,
                  type: AppStrings.emailTextField,
                  hintText: AppStrings.email),
              AppFormField(
                  controller: _passwordController,
                  type: AppStrings.passwordTextField,
                  hintText: AppStrings.password),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ButtonWidget(
                        text: 'SignIn',
                        backgroundColor: AppColors.gold,
                        onClicked: () {
                          logInToFb();
                          clearText();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.purple),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            color: AppColors.purple),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        )),
      ),
    );
  }

  void clearText() {
    _passwordController.clear();
    _emailController.clear();
  }

  void logInToFb() {
    firebaseAuth
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(uid: result.user!.uid)),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Invalid Credentials",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.purple),
              ),
              content: Text(
                err.message,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gold),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ButtonWidget(
                    text: 'OK',
                    backgroundColor: AppColors.gold,
                    onClicked: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            );
          });
    });
  }
}
