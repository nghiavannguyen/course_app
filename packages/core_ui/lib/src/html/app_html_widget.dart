import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart' as htmlwidget;
import 'package:url_launcher/url_launcher.dart';

/// A widget that renders HTML content with customizable styling and behavior
class AppHtmlWidget extends StatelessWidget {
  /// Creates an [AppHtmlWidget]
  const AppHtmlWidget({
    super.key,
    required this.data,
    this.textStyle,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.onLinkTap,
    this.onImageTap,
    this.onErrorBuilder,
    this.onLoadingBuilder,
    this.customStylesBuilder,
    this.customWidgetBuilder,
  });

  /// The HTML content to render
  final String data;

  /// The text style to apply to the HTML content
  final TextStyle? textStyle;

  /// The text color to apply to the HTML content
  final Color? textColor;

  /// The background color of the widget
  final Color? backgroundColor;

  /// The padding around the HTML content
  final EdgeInsetsGeometry? padding;

  /// Called when a link is tapped
  final Future<bool> Function(String)? onLinkTap;

  /// Called when an image is tapped
  final void Function(htmlwidget.ImageMetadata)? onImageTap;

  /// Builder for custom error widget
  final htmlwidget.OnErrorBuilder? onErrorBuilder;

  /// Builder for custom loading widget
  final htmlwidget.OnLoadingBuilder? onLoadingBuilder;

  /// Builder for custom styles
  final Map<String, String> Function(dynamic)? customStylesBuilder;

  /// Builder for custom widgets
  final Widget? Function(dynamic)? customWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultTextStyle = textStyle ?? theme.textTheme.bodyMedium;

    return Container(
      color: backgroundColor,
      padding: padding,
      child: htmlwidget.HtmlWidget(
        data,
        textStyle: defaultTextStyle?.copyWith(
          color: textColor,
        ),
        onTapUrl: onLinkTap ?? _defaultLinkTap,
        onTapImage: onImageTap,
        onErrorBuilder: onErrorBuilder,
        onLoadingBuilder: onLoadingBuilder ?? _defaultLoadingBuilder,
        customStylesBuilder: customStylesBuilder ?? _defaultStylesBuilder,
        customWidgetBuilder: customWidgetBuilder,
        enableCaching: true,
      ),
    );
  }

  Map<String, String> _defaultStylesBuilder(dynamic element) {
    return {
      'body': 'margin: 0; padding: 0;',
      'p': 'margin: 0 0 16px 0;',
      'h1': 'margin: 0 0 16px 0; font-size: 24px; font-weight: bold;',
      'h2': 'margin: 0 0 16px 0; font-size: 20px; font-weight: bold;',
      'h3': 'margin: 0 0 16px 0; font-size: 18px; font-weight: bold;',
      'h4': 'margin: 0 0 16px 0; font-size: 16px; font-weight: bold;',
      'h5': 'margin: 0 0 16px 0; font-size: 14px; font-weight: bold;',
      'h6': 'margin: 0 0 16px 0; font-size: 12px; font-weight: bold;',
      'ul': 'margin: 0 0 16px 0; padding-left: 24px;',
      'ol': 'margin: 0 0 16px 0; padding-left: 24px;',
      'li': 'margin: 0 0 8px 0;',
      'a': 'color: #2196F3; text-decoration: none;',
      'img': 'max-width: 100%; height: auto;',
      'blockquote':
          'margin: 0 0 16px 0; padding: 8px 16px; border-left: 4px solid #2196F3; background-color: #F5F5F5;',
      'code':
          'font-family: monospace; background-color: #F5F5F5; padding: 2px 4px; border-radius: 4px;',
      'pre':
          'font-family: monospace; background-color: #F5F5F5; padding: 16px; border-radius: 8px; overflow-x: auto;',
      'table': 'border-collapse: collapse; width: 100%; margin: 0 0 16px 0;',
      'th': 'border: 1px solid #E0E0E0; padding: 8px; text-align: left; background-color: #F5F5F5;',
      'td': 'border: 1px solid #E0E0E0; padding: 8px;',
    };
  }

  Future<bool> _defaultLinkTap(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
      return true;
    }
    return false;
  }

  Widget _defaultLoadingBuilder(BuildContext context, dynamic element, double? progress) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        value: progress,
      ),
    );
  }
}
