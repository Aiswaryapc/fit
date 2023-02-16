import 'package:flutter/material.dart';
import 'package:fit/constants/colors.dart';
class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  var country = [
    'Qatar',
    'India',
    'China',
    'Pakistan',
    'Japan',
    'Germany',
    'Australia'
  ];String dropdownvalue2 ='Qatar';
  String? selectedValue = null;
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Text('Country',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: AppColors.gold),),
          SizedBox(width: 130,),
          Expanded(
            child: Container(//transform: Matrix4.translationValues(-6, -12, 0),
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30), //border corner radius
                boxShadow:[
                  BoxShadow(
                    color: AppColors.purple.withOpacity(0.35), //color of shadow
                    spreadRadius: 1, //spread radius
                    blurRadius: 2, // blur radius
                    offset: Offset(1, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                  //you can set more BoxShadow() here
                ],
              ),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white, width: 5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:AppColors.white, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                  ),style: const TextStyle(color: AppColors.purple,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  fontStyle: FontStyle.normal),
                  dropdownColor: AppColors.white ,
                  value: selectedValue,
                iconSize: 24,hint:   Text('Qatar', style:TextStyle(color: AppColors.purple,fontWeight: FontWeight.w400,
                fontSize: 14,),),
                icon: const Expanded(
                  child: Align (alignment: Alignment.topRight,
                      child: Icon(Icons.keyboard_arrow_down_sharp,color: AppColors.purple)),
                ),

                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: country.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),),
            ),
          ),
          SizedBox(width: 30,),
        ],
      ),
    );
  }
}

