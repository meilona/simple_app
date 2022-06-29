import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final Key? fieldKey;
  final int? maxLength;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final String fieldType;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final dynamic initialValue;
  final TextEditingController? controller;

  const TextFieldWidget(
      {Key? key,
      this.fieldKey,
      this.maxLength,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      required this.fieldType,
      this.prefixIcon,
      this.suffixIcon,
      this.initialValue,
      this.keyboardType = TextInputType.text,
      this.controller})
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: widget.controller,
          textInputAction: TextInputAction.search,
          key: widget.fieldKey,
          decoration: InputDecoration(
              labelText: widget.labelText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: const EdgeInsets.only(bottom: 12),
              isDense: true,
              border: InputBorder.none,
              // contentPadding: EdgeInsets.zero,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon),
          style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).textSelectionTheme.selectionColor),
          validator: widget.validator,
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onFieldSubmitted,
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.top,
          initialValue: widget.initialValue,
          keyboardType: widget.keyboardType,
        ));
  }
}
