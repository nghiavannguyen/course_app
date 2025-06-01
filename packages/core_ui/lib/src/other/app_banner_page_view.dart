import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../image_network/app_image.dart';

class AppBannerPageView extends StatelessWidget {
  const AppBannerPageView({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    debugPrint("images: ${images.length}");
    final PageController controller = PageController();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: controller,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return AppImage(
              imageUrl: images[index],
              fit: BoxFit.cover,
            );
          },
        ),
        Align(
          alignment: Alignment.topCenter,
          child: IgnorePointer(
            ignoring: true,
            child: Container(
              height: kToolbarHeight * 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: controller,
            count: images.length,
            effect: ExpandingDotsEffect(
              expansionFactor: 5,
              activeDotColor: Theme.of(context).colorScheme.primary,
              dotHeight: 5,
              dotWidth: 5,
              spacing: 5,
            ),
          ),
        )
      ],
    );
  }
}
