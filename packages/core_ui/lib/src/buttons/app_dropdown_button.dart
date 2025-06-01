import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AppDropDownButton<T> extends StatefulWidget {
  const AppDropDownButton({
    super.key,
    required this.items,
    required this.hintText,
    this.onChanged,
    this.selectedValue,
    this.itemBuilder,
    this.validator,
    this.buttonHeight = 40,
    this.maxHeight = 200,
    this.dropdownWidth,
    this.buttonPadding = const EdgeInsets.symmetric(horizontal: 9),
    this.menuItemPadding = const EdgeInsets.symmetric(horizontal: 16),
  });

  final List<T> items;
  final String hintText;
  final T? selectedValue;
  final Function(T?)? onChanged;
  final Widget Function(T)? itemBuilder;
  final String? Function(T?)? validator;
  final double buttonHeight;
  final double maxHeight;
  final double? dropdownWidth;
  final EdgeInsetsGeometry buttonPadding;
  final EdgeInsetsGeometry menuItemPadding;

  @override
  State<AppDropDownButton<T>> createState() => _AppDropDownButtonState<T>();
}

class _AppDropDownButtonState<T> extends State<AppDropDownButton<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  void didUpdateWidget(AppDropDownButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedValue != oldWidget.selectedValue) {
      _selectedValue = widget.selectedValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        items: widget.items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: widget.itemBuilder?.call(item) ?? Text(item.toString()),
          );
        }).toList(),
        value: _selectedValue,
        onChanged: widget.onChanged,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xff222222),
        ),
        hint: Text(
          widget.hintText,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff666666),
            fontWeight: FontWeight.w400,
          ),
        ),
        buttonStyleData: ButtonStyleData(
          height: widget.buttonHeight,
          padding: widget.buttonPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFDDDDDD)),
            color: Colors.white,
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down, color: Color(0xff666666)),
          iconSize: 20,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: widget.maxHeight,
          width: widget.dropdownWidth ?? MediaQuery.of(context).size.width - 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          offset: const Offset(0, 0),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: widget.buttonHeight,
          padding: widget.menuItemPadding,
        ),
      ),
    );
  }
}
