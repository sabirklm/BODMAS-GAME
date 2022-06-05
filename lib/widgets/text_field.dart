import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const EditTextField({
    Key? key,
    required this.label,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width > 840 ? width * 0.4 : width * 0.6,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: "Enter Latex",
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
