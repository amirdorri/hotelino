import 'package:flutter/material.dart';

class BookingFormField extends StatelessWidget {

  final String title, hint, initialValue;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  const BookingFormField({
    super.key,
    required this.hint,
    required this.title,
    required this.initialValue,
    required this.keyboardType,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            keyboardType: keyboardType,
            initialValue: initialValue,
            decoration: InputDecoration(hintText: hint),
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
