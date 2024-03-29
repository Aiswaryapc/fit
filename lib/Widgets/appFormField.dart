import 'dart:convert';


import 'package:fit/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/strings.dart';




class AppFormField extends StatefulWidget {
  final String hintText;
  final List<String>? list;
  final String type;
  final TextEditingController controller;
  final Function? onStateChange;
  final bool isReadOnly ;
  const AppFormField({
    required this.hintText,
    this.type = 'Normal',
    Key? key,
    required this.controller,
    this.list,
    this.isReadOnly=false,
    this.onStateChange,
  }) : super(key: key);

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case AppStrings.normalTextField:
        return normalTextField();
      case AppStrings.emailTextField:
        return normalTextField(isEmail: true);
      case AppStrings.passwordTextField:
        return normalTextField(isPassword: true);
      case AppStrings.phoneTextField:
        return normalTextField(isphone: true);
         case AppStrings.numberTextField:
        return normalTextField(isNumbers:true);
      default:
        return normalTextField();
    }
  }
bool _passwordInVisible = true;
  Container normalTextField(
      {isEmail = false, isPassword = false, isphone = false,isNumbers=false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: 1000,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        border: Border.all(color: AppColors.purple,width: 1),
      ),
      padding: const EdgeInsets.only(
        left: 20,
      ),
      alignment: Alignment.centerLeft,
      child: TextFormField(
         style: TextStyle(color: AppColors.purple),
        controller: widget.controller,
        readOnly: widget.isReadOnly,
        keyboardType: isphone
            ? TextInputType.phone
            : isEmail
                ? TextInputType.emailAddress
                : isNumbers
                  ? TextInputType.number
                  : TextInputType.text ,
        obscureText: isPassword?_passwordInVisible:isPassword,
        
        textCapitalization: !isEmail && !isPassword && !isphone && !isNumbers
            ? TextCapitalization.words
            : TextCapitalization.none,
        inputFormatters: isphone
            ? [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10)
              ]
            : isPassword
                ? []
                : isNumbers
                  ?[FilteringTextInputFormatter.digitsOnly]
                  :[FilteringTextInputFormatter.singleLineFormatter],
        decoration:isPassword? InputDecoration(
          suffixIcon: IconButton(
      icon: Icon(
        _passwordInVisible ? Icons.visibility_off : Icons.visibility,
        color:AppColors.purple, 
      ), onPressed: () {
        setState(() {
          _passwordInVisible = !_passwordInVisible; 
        });
      },),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
            hintText: widget.hintText)
            :InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
            hintText: widget.hintText),
      ),
    );
  }
}
