import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';
import 'package:zarurat/data.dart';

class CustomDropdown extends StatelessWidget {

  final List <DropdownMenuItem> dropdownItems;
  final String selectedItem;
  final String hint;
  final String searchMenuHint;
  final onDropdownValueChanged;

  CustomDropdown({
    required this.dropdownItems,
    required this.selectedItem,
    required this.hint,
    required this.searchMenuHint,
    this.onDropdownValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: SearchChoices.single(
        items: dropdownItems,
        value: selectedItem,
        underline: Container(),
        displayClearIcon: false,
        iconEnabledColor: Data.primaryColor,
        hint: hint,
        searchHint: searchMenuHint,
        onChanged: onDropdownValueChanged,
        dialogBox: true,
        isExpanded: true,
      ),
    );
  }
}