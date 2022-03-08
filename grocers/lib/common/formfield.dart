import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/style.dart';
import 'button.dart';

class EditTextField extends StatelessWidget {
  final String? headTxt;
  final String? labelText;
  final TextEditingController? controller;
  final dynamic onTap;
  // final String? Function(String?)? validator;
  final Function? validator;
  final BoxDecoration? decoration;

  final Function(String)? onChanged;
  final int? maxLines;
  final int? maxLength;
  final String? initialValue;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final String? errorText;
  final Widget? suffixIcon;
  final String? hintText;
  final TextAlign? textAlign;
  const EditTextField(
      {Key? key,
      this.headTxt,
      this.textAlign,
      this.decoration,
      this.controller,
      this.labelText,
      this.errorText,
      this.focusNode,
      this.initialValue,
      this.inputFormatters,
      this.keyboardType,
      this.maxLength,
      this.maxLines,
      this.onChanged,
      this.onSaved,
      this.onTap,
      this.suffixIcon,
      this.hintText,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: headTxt != null
                ? Text(
                    headTxt!,
                    style: labelTextStyle,
                  )
                : null),
        TextFormField(
            onTap: onTap,
            style: TextStyle(color: offWhiteColor),
            textAlign: textAlign ?? TextAlign.center,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            initialValue: initialValue,
            // maxLines: maxLines,
            // minLines: minLines,
            maxLength: maxLength,

            // focusNode: FocusNode(),
            focusNode: focusNode,
            controller: controller,
            onSaved: onSaved,
            keyboardType: keyboardType,
            validator: (value) => validator!(value),
            // validator: validator,
            // autofocus: false,
            // readOnly: readOnly ?? false,
            scrollPadding: EdgeInsets.zero,
            decoration: InputDecoration(
                errorStyle: TextStyle(color: blackColor),
                errorText: errorText,
                counter: Offstage(),
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                labelText: labelText,
                contentPadding: EdgeInsets.symmetric(
                    // vertical: vertical != null ? vertical! : 5.0,
                    // horizontal: horizontal ?? 0.
                    vertical: 10,
                    horizontal: 10),
                isDense: true,
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: offWhiteColor,
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: offWhiteColor, width: 1.5)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: offWhiteColor, width: 1.5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: offWhiteColor, width: 1.5),
                ),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: offWhiteColor, width: 1.5)),
                focusColor: offWhiteColor,
                hoverColor: offWhiteColor,
                prefixIconConstraints:
                    BoxConstraints(minWidth: 0, minHeight: 0),
                hintText: hintText,
                // prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                suffixIconConstraints:
                    BoxConstraints.tightFor(width: 35.0, height: 14.0))),
      ],
    );
  }
}

// ! Apply Box
class ApplyBox extends StatelessWidget {
  const ApplyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 1),
        padding: EdgeInsets.all(5),
        height: 50,
        // color: Colors.white,
        child: Center(
          child: TextFormField(
            decoration: new InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Btn(
                  width: 50,
                  height: 25,
                  btnName: 'APPLY',
                  txtColor: offWhiteColor,
                  color: Colors.green,
                ),
              ),
              hintText: 'Coupon Code',
              contentPadding: EdgeInsets.all(8),
              isDense: true,
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey)),
            ),
          ),
        ));
  }
}
