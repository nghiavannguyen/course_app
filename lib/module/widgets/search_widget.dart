import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextField(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
        decoration: InputDecoration(
          hintText: "Tìm kiếm",
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).textTheme.bodySmall?.color),
          prefixIcon: Icon(
            Icons.search,
            size: 18,
            color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 30,
          ),
          filled: true,
          fillColor: Theme.of(context).canvasColor.withOpacity(0.2),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            // borderSide: BorderSide(
            //   color: Theme.of(context).dividerColor,
            // ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 2,
          ),
        ),
      ),
    );
  }
}
