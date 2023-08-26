import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fit/Widgets/appFormField.dart';
import 'package:fit/Widgets/button.dart';
import 'package:fit/pages/home.dart';
import 'package:fit/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fit/constants/colors.dart';
import '../constants/strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final _formKey = GlobalKey<FormState>();
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _mobileNumberController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _confirmPasswordController = TextEditingController();

void _showToast(String message) {
  Fluttertoast.showToast(
      msg: message, toastLength: Toast.LENGTH_LONG, fontSize: 16);
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 50, bottom: 10, right: 50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                "SignUp",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: AppColors.purple),
              ),
              SizedBox(
                height: 30,
              ),
              AppFormField(
                  controller: _firstNameController, hintText: AppStrings.fname),
              AppFormField(
                  controller: _lastNameController, hintText: AppStrings.lname),
              AppFormField(
                  controller: _emailController,
                  type: AppStrings.emailTextField,
                  hintText: AppStrings.email),
              AppFormField(
                  controller: _mobileNumberController,
                  type: AppStrings.phoneTextField,
                  hintText: AppStrings.phNumber),
              AppFormField(
                  controller: _passwordController,
                  type: AppStrings.passwordTextField,
                  hintText: AppStrings.password),
              AppFormField(
                  controller: _confirmPasswordController,
                  type: AppStrings.passwordTextField,
                  hintText: AppStrings.cPassword),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ButtonWidget(
                        text: 'SignUp',
                        backgroundColor: AppColors.gold,
                        onClicked: () {
                          if (validation()) {
                            // registerToFb();
                            clearText();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
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
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                            color: AppColors.purple),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((result) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Success",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.purple),
              ),
              content: Text(
                "User created successfully",
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomePage(uid: result.user!.uid)),
                      );
                    },
                  ),
                ),
              ],
            );
          });
    }).catchError((err) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: FittedBox(
                    child: ButtonWidget(
                      text: 'OK',
                      backgroundColor: AppColors.gold,
                      onClicked: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            );
          });
    });
  }

  bool validation() {
    bool flag = true;
    if (!_firstNameController.text.isNotEmpty) {
      flag = false;
      toast("First name cannot be null!!");
      return false;
    } else if (!_lastNameController.text.isNotEmpty) {
      flag = false;
      toast("Last name cannot be null!!");
      return false;
    } else if (!validateEmail(_emailController.text)) {
      flag = false;
      toast("Invalid email id !!!");
      return false;
    } else if (!validatePhone(_mobileNumberController.text)) {
      flag = false;
      toast("Invalid Mobile number!!");
      return false;
    } else if (!validatePassword(_passwordController.text)) {
      flag = false;
      toast(
          "Password should contain at least one upper case , one lower case ,one digit ,at least one Special character and must be at least 8 characters in length !!");
      return false;
    } else if (!(_confirmPasswordController.text == _passwordController.text)) {
      flag = false;
      toast("Passwords are not matching");
      return false;
    }
    return flag;
  }

  void toast(String a) {
    Fluttertoast.showToast(
        msg: a,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validatePhone(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void clearText() {
    _passwordController.clear();
    _emailController.clear();
    _firstNameController.clear();
    _confirmPasswordController.clear();
    _mobileNumberController.clear();
    _lastNameController.clear();
  }
}
