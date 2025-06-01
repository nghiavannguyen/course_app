import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Một widget ShimmerPlaceholder có thể tái sử dụng.
/// Có thể:
/// - Áp dụng shimmer lên bất kỳ widget con nào bằng cách truyền `child`.
/// - Hoặc sử dụng các phương thức tạo sẵn cho placeholder dạng hình chữ nhật, hình tròn.
///
/// Cách sử dụng:
///
/// 1. Dùng cho bất kỳ widget con:
/// ```dart
/// ShimmerPlaceholder(
///   child: Container(
///     width: 100,
///     height: 20,
///     color: Colors.grey[300],
///   ),
/// )
/// ```
///
/// 2. Sử dụng constructor tĩnh để tạo placeholder dạng text line:
/// ```dart
/// ShimmerPlaceholder.rectangular(width: 200, height: 16)
/// ```
///
/// 3. Sử dụng cho avatar placeholder:
/// ```dart
/// ShimmerPlaceholder.circular(size: 50)
/// ```
class ShimmerPlaceholder extends StatelessWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerPlaceholder({
    super.key,
    required this.child,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
  });

  /// Tạo placeholder dạng hình chữ nhật, dùng cho text line, khối content.
  factory ShimmerPlaceholder.rectangular({
    double? width,
    double? height,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4)),
    Color baseColor = const Color(0xFFE0E0E0),
    Color highlightColor = const Color(0xFFF5F5F5),
  }) {
    return ShimmerPlaceholder(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height ?? 10,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  /// Tạo placeholder dạng hình tròn, dùng cho avatar, icon placeholder.
  factory ShimmerPlaceholder.circular({
    double? size,
    Color baseColor = const Color(0xFFE0E0E0),
    Color highlightColor = const Color(0xFFF5F5F5),
  }) {
    return ShimmerPlaceholder(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: size ?? 40,
        height: size ?? 40,
        decoration: BoxDecoration(
          color: baseColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child,
    );
  }
}


/// Ví dụ sử dụng thực tế:
///
/// Trong widget build:
///
/// ```dart
/// Column(
///   crossAxisAlignment: CrossAxisAlignment.start,
///   children: [
///     Text("Đang tải dữ liệu..."),
///     SizedBox(height: 8),
///     ShimmerPlaceholder.rectangular(width: 200, height: 16),
///     SizedBox(height: 8),
///     Row(
///       children: [
///         ShimmerPlaceholder.circular(size: 50),
///         SizedBox(width: 16),
///         Column(
///           crossAxisAlignment: CrossAxisAlignment.start,
///           children: [
///             ShimmerPlaceholder.rectangular(width: 100, height: 16),
///             SizedBox(height: 8),
///             ShimmerPlaceholder.rectangular(width: 150, height: 16),
///           ],
///         )
///       ],
///     ),
///   ],
/// )
/// ```
///
/// Bằng cách này, bạn có thể dễ dàng sử dụng placeholder shimmer
/// cho bất kỳ thành phần nào trong giao diện của bạn khi chờ API load.
