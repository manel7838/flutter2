import 'package:flutter/material.dart';

class MyCustomTextFormField extends StatelessWidget {
  const MyCustomTextFormField({
    super.key,
    required this.title,
    this.initialValue,
    this.onChanged,
  });

  final String title;
  final String? initialValue;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              title,
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: initialValue,
              onChanged: onChanged,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
