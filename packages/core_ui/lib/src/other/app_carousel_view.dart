import 'package:flutter/material.dart';

/// A custom carousel view widget.
class AppCarouselView extends StatelessWidget {
  ///List of items to display in the carousel.
  ///Each item is a dynamic type so use carefully.
  final List<dynamic> items;

  ///A function that returns a widget based on the index and item.
  ///The index is the index of the item in the list [items].
  final Widget Function(int index, dynamic item) itemBuilder;

  ///[itemExtent] is the extent of each item in the carousel, default by [295].
  ///[height] of the carousel, default by [150].
  ///[itemBorderRadius] is the border radius of each item, default by [12].
  final double itemExtent, height, itemBorderRadius;

  ///[padding] is the padding for the whole carousel, default by [EdgeInsets.only(right: 8)].
  final EdgeInsets padding;

  ///A function that is called when an item is tapped.
  final Function(int index)? onTap;
  const AppCarouselView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.itemExtent = 295,
    this.height = 150,
    this.onTap,
    this.padding = const EdgeInsets.only(right: 8),
    this.itemBorderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CarouselView(
        elevation: 0,
        padding: padding,
        itemExtent: itemExtent,
        shrinkExtent: itemExtent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(itemBorderRadius),
        ),
        onTap: onTap,
        children: [
          ...List.generate(
            items.length,
            (index) => itemBuilder(index, items[index]),
          )
        ],
      ),
    );
  }
}
