import 'package:fit/Widgets/appFormField.dart';
import 'package:fit/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fit/constants/colors.dart';
import '../constants/strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final _firstNameController = TextEditingController();
final _lastNameController = TextEditingController();
final _emailController = TextEditingController();
final _mobileNumberController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();

void _showToast(String message) {
  Fluttertoast.showToast(
      msg: message, toastLength: Toast.LENGTH_LONG, fontSize: 16);
}

class _SignUpScreenState extends State<SignUpScreen> {
 

  List<String> statesList = [];
  List<String> districtList = [];

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
            padding:
                EdgeInsets.only(top: 10, left: 50, bottom: 10, right: 50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
                const Text(
                  "SignUp!!!",
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
                      child:  ButtonWidget(
                    text: 'SignUp',
                    backgroundColor: AppColors.gold,
                    onClicked: () {
                
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
                    "Already have an account?",
                      
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                 
                      },
                      child: Text(
                        "Login",
                       
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
}
