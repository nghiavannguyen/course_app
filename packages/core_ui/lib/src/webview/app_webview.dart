import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// A WebView screen that displays web content
class AppWebView extends StatefulWidget {
  /// Creates an [AppWebView]
  const AppWebView({
    super.key,
    required this.url,
    this.title,
    this.showAppBar = true,
    this.initialCookies = const {},
    this.javascriptMode = JavaScriptMode.unrestricted,
    this.onPageStarted,
    this.onPageFinished,
    this.onWebResourceError,
  });

  /// URL to load
  final String url;

  /// Optional title for the app bar
  final String? title;

  /// Whether to show the app bar
  final bool showAppBar;

  /// Initial cookies to set
  final Map<String, String> initialCookies;

  /// JavaScript mode
  final JavaScriptMode javascriptMode;

  /// Called when page starts loading
  final void Function(String)? onPageStarted;

  /// Called when page finishes loading
  final void Function(String)? onPageFinished;

  /// Called when a web resource error occurs
  final void Function(WebResourceError)? onWebResourceError;

  /// Shows the WebView screen
  static Future<void> show({
    required BuildContext context,
    required String url,
    String? title,
    bool showAppBar = true,
    Map<String, String> initialCookies = const {},
    JavaScriptMode javascriptMode = JavaScriptMode.unrestricted,
    void Function(String)? onPageStarted,
    void Function(String)? onPageFinished,
    void Function(WebResourceError)? onWebResourceError,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AppWebView(
          url: url,
          title: title,
          showAppBar: showAppBar,
          initialCookies: initialCookies,
          javascriptMode: javascriptMode,
          onPageStarted: onPageStarted,
          onPageFinished: onPageFinished,
          onWebResourceError: onWebResourceError,
        ),
      ),
    );
  }

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    _controller = WebViewController()
      ..setJavaScriptMode(widget.javascriptMode)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() => _isLoading = true);
            widget.onPageStarted?.call(url);
          },
          onPageFinished: (String url) {
            setState(() => _isLoading = false);
            widget.onPageFinished?.call(url);
          },
          onWebResourceError: (WebResourceError error) {
            widget.onWebResourceError?.call(error);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    // Set initial cookies if provided
    if (widget.initialCookies.isNotEmpty) {
      _controller.runJavaScript('''
        document.cookie = '${widget.initialCookies.entries.map((e) => '${e.key}=${e.value}').join('; ')}';
      ''');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(widget.title ?? ''),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          : null,
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(
                color: colorScheme.primary,
              ),
            ),
        ],
      ),
    );
  }
}
