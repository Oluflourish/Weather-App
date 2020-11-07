import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class MyTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final String value;
  final int maxLines;
  final Function validator;
  final Function onSaved;
  final TextInputType textInputType;
  final bool isPassword;
  final bool isReadOnly;
  MyTextFormField({
    this.title = '',
    this.hintText,
    this.value,
    this.maxLines,
    this.validator,
    this.onSaved,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                ),
                
          TextFormField(
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            readOnly: isReadOnly,
            initialValue: value,
            maxLines: maxLines,
            textCapitalization: textInputType == TextInputType.emailAddress
                ? TextCapitalization.none
                : TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.all(15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: AppColors.violetShade1,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            obscureText: isPassword ? true : false,
            validator: validator,
            onSaved: onSaved,
            keyboardType: textInputType,
          ),
        ],
      ),
    );
  }
}
