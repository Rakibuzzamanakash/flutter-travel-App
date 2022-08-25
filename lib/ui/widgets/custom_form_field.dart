import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../style/style.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  CustomFormField(this.controller,this.inputType,this.hint);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: AppStyles().textFieldDecoration(hint),
    );
  }
}
