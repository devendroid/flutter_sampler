import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyToggleButton extends StatefulWidget {
  Key? key;
  List<String> titles;
  int selectedIndex;
  double width;
  double height;
  double borderRadius;
  Color borderColor;
  Color selectedBorderColor;
  Color selectedFillColor;
  Color textColor;
  Color selectedTextColor;
  double textSize;
  Function(int)? onSelect;

  MyToggleButton({
    this.key,
    required this.titles,
    this.selectedIndex = 0,
    this.width = 80,
    this.height = 34,
    this.borderRadius = 8,
    this.borderColor = Colors.red,
    this.selectedBorderColor = Colors.red,
    this.selectedFillColor = Colors.red,
    this.textColor = Colors.white,
    this.selectedTextColor = Colors.white,
    this.textSize = 14,
    this.onSelect,
  }) : super(key: key);

  @override
  _MyToggleButtonState createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton> {
  List<Widget> _buttons = <Widget>[];
  List<bool> _selectedButton = <bool>[];

  @override
  void initState() {
    super.initState();
    _buttons = widget.titles.map((e) => Text(e)).toList();
    _selectedButton = widget.titles.map((e) => false).toList();
    _selectedButton[widget.selectedIndex] = true;
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedButton.length; i++) {
            _selectedButton[i] = i == index;
          }
          widget.onSelect?.call(index);
        });
      },
      borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      selectedBorderColor: widget.selectedBorderColor,
      borderColor: widget.borderColor,
      fillColor: widget.selectedFillColor,
      selectedColor: widget.selectedTextColor,
      textStyle: TextStyle(fontSize: widget.textSize),
      color: widget.textColor,
      constraints:  BoxConstraints(
        minHeight: widget.height,
        minWidth: widget.width,
      ),
      isSelected: _selectedButton,
      children: _buttons,
    );
  }
}
