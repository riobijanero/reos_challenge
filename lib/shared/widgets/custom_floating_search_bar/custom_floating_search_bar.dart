import 'package:flutter/material.dart';

import 'package:reos_challenge/shared/widgets/custom_floating_search_bar/searchfield.dart';

class CustomFloatingSearchbar extends StatefulWidget {
  const CustomFloatingSearchbar({
    Key? key,
    required this.textEditController,
    required this.searchbarResult,
    required this.body,
    required this.hint,
    required this.hintStyle,
    required this.onSubmit,
    required this.suffixiconList,
  }) : super(key: key);

  final TextEditingController textEditController;
  final Widget Function() searchbarResult;
  final void Function() onSubmit;
  final String hint;
  final TextStyle? hintStyle;

  final Widget body;

  final List<Widget> suffixiconList;

  @override
  State<CustomFloatingSearchbar> createState() => _CustomFloatingSearchbarState();
}

class _CustomFloatingSearchbarState extends State<CustomFloatingSearchbar> {
  Widget? children;
  bool isSearchBarResultsShown = false;
  static const double searchbarHeight = 50;
  @override
  void initState() {
    super.initState();
    children = widget.searchbarResult();

    widget.textEditController.addListener(onValueChanged);
  }

  @override
  void dispose() {
    widget.textEditController.dispose();
    super.dispose();
  }

  void onValueChanged() {
    children = widget.searchbarResult();
    isSearchBarResultsShown = true;
    setState(() {});
  }

  void onBodyAreatapped() {
    isSearchBarResultsShown = false;
    setState(() {});
  }

  void onSubmitted() {
    widget.onSubmit();
    isSearchBarResultsShown = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: searchbarHeight),
            child: GestureDetector(
              onTap: onBodyAreatapped,
              child: widget.body,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SearchField(
                  suffixIconList: widget.suffixiconList,
                  onSubmit: widget.onSubmit,
                  textEditController: widget.textEditController,
                  searchbarHeight: searchbarHeight,
                  hint: widget.hint,
                  hintStyle: widget.hintStyle,
                ),
                if (isSearchBarResultsShown && children != null)
                  Container(
                    child: children,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
