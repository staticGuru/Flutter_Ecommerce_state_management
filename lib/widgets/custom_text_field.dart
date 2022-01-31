import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hint,
    this.icon,
    this.value,
    this.onChangeTextTrigger,
    this.onCarryString,
  });
  final String hint;
  final Widget icon;
  final String value;
  TextEditingController myController = new TextEditingController();
  String newValue = '';
  final VoidCallback onChangeTextTrigger;
  // ignore: non_constant_identifier_names
  final Function(String) onCarryString;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String val) => onCarryString(val),
      controller: myController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8),
          ),
          borderSide: BorderSide(
            color: kGreyShade3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8),
          ),
          borderSide: BorderSide(
            color: kGreyShade3,
          ),
        ),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.headline4.copyWith(
              color: kGreyShade3,
            ),
        suffixIcon: icon,
      ),
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
