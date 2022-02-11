import 'package:flutter/material.dart';

class TextFieldForm extends StatefulWidget {
  final String type;
  final String label;
  final String counterLabel;
  final String valueStart;
  final int maxLength;
  final TextInputAction textAction;
  final bool isObscure;
  final Function(String?)? returnSave;
  final Function(String)? onChange;
  final Function(String?) validField;
  final bool enabled;
  final TextAlign textAlign;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final TextInputType textInputType;
  final String format;
  final TextCapitalization textCapitaliza;
  final TextEditingController? controllerText;

  // ignore: use_key_in_widget_constructors
  const TextFieldForm({
    this.type = 'TEXT',
    this.enabled = true,
    this.textAlign = TextAlign.left,
    this.fontFamily = 'Todes RC Light',
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.textInputType = TextInputType.text,
    this.format = '',
    this.textCapitaliza = TextCapitalization.none,
    this.controllerText,
    required this.valueStart,
    required this.maxLength,
    required this.label,
    required this.counterLabel,
    required this.isObscure,
    required this.textAction,
    required this.returnSave,
    required this.onChange,
    required this.validField,
    required this.currentFocus,
    required this.nextFocus,
  });

  @override
  _TextFieldFormState createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  bool _isObscure = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      _isObscure = widget.isObscure;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.enabled
          ? null
          : BoxDecoration(
              border: Border.all(
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
      child: TextFormField(
        initialValue: widget.controllerText == null ? widget.valueStart : null,
        controller: widget.controllerText,
        maxLength: widget.maxLength,
        obscureText: _isObscure,
        textInputAction: widget.textAction,
        enabled: widget.enabled,
        textAlign: widget.textAlign,
        focusNode: widget.currentFocus,
        style: TextStyle(
          fontFamily: widget.fontFamily,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          counterText: widget.counterLabel,
          suffixIcon: widget.type == 'TEXT'
              ? null
              : widget.type == 'PASS'
                  ? IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      })
                  : IconButton(
                      icon: const Icon(
                        Icons.qr_code_scanner,
                      ),
                      onPressed: () {
                        setState(() {});
                      }),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            // ignore: prefer_const_constructors
            borderSide: BorderSide(
              width: 2,
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            // ignore: prefer_const_constructors
            borderSide: BorderSide(
              width: 2,
              color: Colors.blue,
            ),
          ),
        ),
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(widget.nextFocus);
        },
        onChanged: widget.onChange,
        onSaved: widget.returnSave,
        validator: widget.validField as String? Function(String?)?,
        keyboardType: widget.textInputType,
        textCapitalization: widget.textCapitaliza,
      ),
    );
  }
}
