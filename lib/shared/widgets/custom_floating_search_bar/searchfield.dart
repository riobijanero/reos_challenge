import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.searchbarHeight,
    required this.textEditController,
    required this.hint,
    required this.hintStyle,
    required this.onSubmit,
    required this.suffixIconList,
  }) : super(key: key);

  final double searchbarHeight;
  final TextEditingController textEditController;
  final String hint;
  final TextStyle? hintStyle;
  final void Function() onSubmit;
  final List<Widget> suffixIconList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: searchbarHeight,
      child: TextField(
        controller: textEditController,
        onSubmitted: (value) => onSubmit(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[50],
          hintText: hint,
          hintStyle: hintStyle,
          suffixIcon:
              SizedBox(width: 100, child: Row(mainAxisAlignment: MainAxisAlignment.end, children: suffixIconList)),
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)),
        ),
      ),
    );
  }
}
