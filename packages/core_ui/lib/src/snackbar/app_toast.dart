import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum ToastType {
  success,
  error,
  warning,
  info,
}

class AppToast {
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void show(String message,
      {ToastType type = ToastType.success,
      VoidCallback? onDismissed,
      required BuildContext context}) {
    // if (_isVisible) return;

    // _isVisible = true;

    final overlayState = Overlay.of(context, rootOverlay: true);

    _overlayEntry = OverlayEntry(
      builder: (context) => ToastWidget(
        message: message,
        onDismissed: () {
          _hide();
          onDismissed?.call();
        },
        type: type,
      ),
    );

    overlayState.insert(_overlayEntry!);
  }

  static void _hide() {
    if (_overlayEntry != null && _isVisible) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _isVisible = false;
    }
  }
}

class ToastWidget extends StatefulWidget {
  final String message;
  final Duration duration;
  final VoidCallback onDismissed;
  final Alignment? alignment;
  final ToastType type;

  const ToastWidget({
    super.key,
    required this.message,
    required this.onDismissed,
    this.duration = const Duration(seconds: 2),
    this.alignment,
    this.type = ToastType.success,
  });

  @override
  _ToastWidgetState createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);

    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) {
          widget.onDismissed();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          // FadeTransition để làm mờ dần khi xuất hiện và biến mất
          child: FadeTransition(
            opacity: _animation,
            // SlideTransition để trượt từ trên xuống
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, -0.2), // Bắt đầu từ trên
                end: Offset.zero, // Kết thúc tại vị trí cuối cùng
              ).animate(_animation),
              child: Material(
                color: Colors.transparent,
                child: _buildToast(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToast() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: _getBackgroundColor(widget.type),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  widget.message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                _getIcon(widget.type),
                color: Colors.white,
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(ToastType type) {
    // Implement the logic to determine the background color based on the toast type
    switch (type) {
      case ToastType.success:
        return Colors.green.withOpacity(0.7);
      case ToastType.error:
        return Colors.red.withOpacity(0.8);
      case ToastType.warning:
        return Colors.yellow.withOpacity(0.7);
      case ToastType.info:
        return Colors.blue.withOpacity(0.7);
    }
  }

  IconData _getIcon(ToastType type) {
    // Implement the logic to determine the icon based on the toast type
    switch (type) {
      case ToastType.success:
        return LucideIcons.check;
      case ToastType.error:
        return LucideIcons.xCircle;
      case ToastType.warning:
        return LucideIcons.alertCircle;
      case ToastType.info:
        return LucideIcons.info;
    }
  }
}
