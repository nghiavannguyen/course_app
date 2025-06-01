import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AppDateTimePicker {
  static Widget dateRangePickerWidget({
    required BuildContext context,
    Function(DateRangePickerSelectionChangedArgs agr)? onSelectionChanged,
    Function()? onCancel,
    Function()? onSubmit,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Tiêu đề
          Text(
            "Select Date Range",
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          // SfDateRangePicker
          Expanded(
            child: SfDateRangePicker(
                headerStyle: DateRangePickerHeaderStyle(
                    textStyle: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                    backgroundColor: colorScheme.primary.withOpacity(0.1)),
                initialSelectedRange:
                    PickerDateRange(DateTime.now(), DateTime.now().add(const Duration(days: 1))),
                minDate: DateTime.now(),
                maxDate: DateTime(2050, 12, 31),
                backgroundColor: colorScheme.surface,
                selectionMode: DateRangePickerSelectionMode.range,
                startRangeSelectionColor: colorScheme.primary,
                endRangeSelectionColor: colorScheme.primary,
                selectionColor: colorScheme.error,
                rangeSelectionColor: colorScheme.primary.withOpacity(0.2),
                todayHighlightColor: Colors.transparent,
                selectionShape: DateRangePickerSelectionShape.rectangle,
                onSelectionChanged: onSelectionChanged),
          ),
          // Custom Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onCancel,
                child: Text(
                  "Cancel",
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ),
              TextButton(
                onPressed: onSubmit,
                child: Text(
                  "OK",
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // chon vung ngay
  static void showDateRangePicker(BuildContext context,
      {Function(DateRangePickerSelectionChangedArgs agr)? onSelectionChanged}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: dateRangePickerWidget(
          context: context,
          onSelectionChanged: onSelectionChanged,
          onCancel: () {
            Navigator.pop(context);
          },
          onSubmit: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
