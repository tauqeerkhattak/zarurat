import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zarurat/data.dart';

class SearchBar extends StatelessWidget {
  final String hintTxt,suffixText;
  final TextEditingController controller;

  SearchBar({required this.hintTxt, required this.controller,required this.suffixText});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 35,
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.only(right: 10.0,left: 10.0,top: 0,bottom: 0),
        decoration: BoxDecoration(
          color: Data.secondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
            hintText: 'Search for homes',
            filled: true,
            contentPadding: EdgeInsets.all(0.0),
            fillColor: Data.secondaryColor,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Data.primaryColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Data.primaryColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Data.primaryColor,
            ),
            suffixIcon: Container(
              // margin: EdgeInsets.only(top: 10,left: 10),
              child: Center(
                widthFactor: 1.5,
                child: Text(
                  suffixText,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}