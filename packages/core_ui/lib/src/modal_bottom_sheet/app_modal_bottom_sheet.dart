import 'package:flutter/material.dart';

/// A base modal bottom sheet widget that follows Material Design guidelines
class AppModalBottomSheet extends StatelessWidget {
  /// Creates a [AppModalBottomSheet]
  const AppModalBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.showDragHandle = true,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.clipBehavior = Clip.antiAlias,
    this.isScrollable = true,
    this.isDismissible = true,
    this.enableDrag = true,
    this.showCloseButton = false,
    this.onClose,
  });

  /// The main content of the bottom sheet
  final Widget child;

  /// Optional title displayed at the top of the sheet
  final String? title;

  /// Whether to show the drag handle at the top
  final bool showDragHandle;

  /// Background color of the sheet
  final Color? backgroundColor;

  /// Border radius of the sheet
  final BorderRadius? borderRadius;

  /// Padding around the content
  final EdgeInsetsGeometry? padding;

  /// How to clip the content
  final Clip clipBehavior;

  /// Whether the content is scrollable
  final bool isScrollable;

  /// Whether the sheet can be dismissed by tapping outside
  final bool isDismissible;

  /// Whether the sheet can be dragged
  final bool enableDrag;

  /// Whether to show a close button
  final bool showCloseButton;

  /// Callback when close button is pressed
  final VoidCallback? onClose;

  /// Shows the modal bottom sheet
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool showDragHandle = true,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
    Clip clipBehavior = Clip.antiAlias,
    bool isScrollable = true,
    bool isDismissible = true,
    bool enableDrag = true,
    bool showCloseButton = false,
    VoidCallback? onClose,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (context) => AppModalBottomSheet(
        title: title,
        showDragHandle: showDragHandle,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
        padding: padding,
        clipBehavior: clipBehavior,
        isScrollable: isScrollable,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        showCloseButton: showCloseButton,
        onClose: onClose,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surface,
        borderRadius: borderRadius ??
            const BorderRadius.vertical(
              top: Radius.circular(28),
            ),
      ),
      clipBehavior: clipBehavior,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showDragHandle) ...[
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.onSurfaceVariant.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
          if (title != null || showCloseButton) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Row(
                children: [
                  if (title != null)
                    Expanded(
                      child: Text(
                        title!,
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  if (showCloseButton)
                    IconButton(
                      onPressed: () {
                        if (onClose != null) {
                          onClose!();
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      icon: Icon(
                        Icons.close,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ),
          ],
          Flexible(
            child: isScrollable
                ? SingleChildScrollView(
                    padding: padding ?? const EdgeInsets.all(24),
                    child: child,
                  )
                : Padding(
                    padding: padding ?? const EdgeInsets.all(24),
                    child: child,
                  ),
          ),
        ],
      ),
    );
  }
}
