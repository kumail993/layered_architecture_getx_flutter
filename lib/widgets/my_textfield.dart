import 'package:ads_client/export.dart';
import 'package:flutter/cupertino.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      validator: widget.validator,
      decoration: InputDecoration(
        fillColor: kcSurfaceColor,
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        errorStyle: getRegularStyle(fontSize: 12, color: kcErrorColor),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  color: kcWhitecolor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(color: kcSurfaceColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kcWhitecolor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kcErrorColor),
        ),
      ),
    );
  }
}
