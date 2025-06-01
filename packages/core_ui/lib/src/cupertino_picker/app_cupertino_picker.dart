import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A customizable Cupertino-style picker widget
class AppCupertinoPicker extends StatelessWidget {
  /// Creates an [AppCupertinoPicker]
  const AppCupertinoPicker({
    super.key,
    required this.items,
    required this.onSelectedItemChanged,
    this.initialItem = 0,
    this.magnification = 1.22,
    this.squeeze = 1.22,
    this.useMagnifier = true,
    this.itemExtent = 32.0,
    this.backgroundColor,
    this.textStyle,
  });

  /// List of items to display in the picker
  final List<String> items;

  /// Callback when selected item changes
  final ValueChanged<int> onSelectedItemChanged;

  /// Initial selected item index
  final int initialItem;

  /// Magnification factor for the selected item
  final double magnification;

  /// Squeeze factor for the picker
  final double squeeze;

  /// Whether to use magnifier effect
  final bool useMagnifier;

  /// Height of each item
  final double itemExtent;

  /// Background color of the picker
  final Color? backgroundColor;

  /// Text style for the items
  final TextStyle? textStyle;

  /// Shows the picker in a modal bottom sheet
  static Future<void> show({
    required BuildContext context,
    required List<String> items,
    required ValueChanged<int> onSelectedItemChanged,
    int initialItem = 0,
    double magnification = 1.22,
    double squeeze = 1.22,
    bool useMagnifier = true,
    double itemExtent = 32.0,
    Color? backgroundColor,
    TextStyle? textStyle,
  }) {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 250,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: backgroundColor ?? CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Material(
            color: Colors.white,
            child: AppCupertinoPicker(
              items: items,
              onSelectedItemChanged: onSelectedItemChanged,
              initialItem: initialItem,
              magnification: magnification,
              squeeze: squeeze,
              useMagnifier: useMagnifier,
              itemExtent: itemExtent,
              textStyle: textStyle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      magnification: magnification,
      squeeze: squeeze,
      useMagnifier: useMagnifier,
      itemExtent: itemExtent,
      scrollController: FixedExtentScrollController(
        initialItem: initialItem,
      ),
      onSelectedItemChanged: onSelectedItemChanged,
      children: items.map((String item) {
        return Center(
          child: Text(
            item,
            style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
          ),
        );
      }).toList(),
    );
  }
}

/// item here
// CupertinoPicker(
//                     magnification: 1.22,
//                     squeeze: 1.22,
//                     useMagnifier: true,
//                     itemExtent: kItemExtent,
//                     // This sets the initial item.
//                     scrollController: FixedExtentScrollController(
//                       initialItem:
//                           productController.selectedIndexLocation.value,
//                     ),
//                     // This is called when selected item is changed.
//                     onSelectedItemChanged: (int selectedItem) async {
//                       productController.selectedIndexLocation.value =
//                           selectedItem;
//                     },
//                     children: List<Widget>.generate(
//                         productController.provinceFilterList.length,
//                         (int index) {
//                       return Center(
//                           child: Text(
//                         productController.provinceFilterList[index].name ?? "",
//                         style: AppTextStyle.bodyMedium(),
//                       ));
//                     }),
//                   )
