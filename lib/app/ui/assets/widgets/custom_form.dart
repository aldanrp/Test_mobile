import 'package:flutter/services.dart';
import 'package:test_mobile/app/core.dart';

class CustomForm extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;
  final String? hintText;
  final bool isEnable;
  final bool filled;

  const CustomForm({
    super.key,
    required this.padding,
    required this.controller,
    this.hintText,
    required this.isEnable,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabled: isEnable,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
        // maxLength: 50,
        inputFormatters: [
          LengthLimitingTextInputFormatter(50),
        ],
      ),
    );
  }
}
