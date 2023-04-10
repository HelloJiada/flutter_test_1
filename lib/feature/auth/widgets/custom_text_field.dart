import 'package:flutter/material.dart';
import '../../../common/utils/coloors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, this.hintText, this.readOnly, this.textAlign, required this.keyBoardType, this.prefixText, this.onTap, this.suffixIcon, this.onChanged, this.fontSize, this.autoFocus});

final TextEditingController? controller;
final String? hintText;
final bool? readOnly;
final TextAlign? textAlign;
final TextInputType? keyBoardType;
final String? prefixText;
final VoidCallback? onTap;
final Widget? suffixIcon;
final Function(String)? onChanged;
final double? fontSize;
final bool? autoFocus;

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      onTap: onTap,
      controller: controller,
      readOnly: readOnly ?? false,
      textAlign: textAlign ?? TextAlign.center,
      keyboardType: readOnly == null ? keyBoardType : null,
      onChanged: onChanged,
      style: TextStyle(fontSize: fontSize),
      autofocus: autoFocus ?? false,
      decoration: InputDecoration(
        isDense: true,
        prefixText: prefixText,
        suffix: suffixIcon,
        hintText: hintText ,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Coloors.greenLight),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Coloors.greenLight,width: 2),
        ),
      ),
    );
  }
}