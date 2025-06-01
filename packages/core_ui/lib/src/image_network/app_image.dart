import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager {
  static const key = 'customCacheKey';
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(hours: 12),
      maxNrOfCacheObjects: 256,
      repo: JsonCacheInfoRepository(databaseName: key),
      fileSystem: IOFileSystem(key),
      fileService: HttpFileService(),
    ),
  );
}

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.isBorder = false,
    this.memCacheHeight,
  });
  final bool isBorder;
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final int? memCacheHeight;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      memCacheHeight: memCacheHeight ?? 360,
      cacheManager: CustomCacheManager.instance,
      fadeInDuration: const Duration(milliseconds: 0),
      fadeOutDuration: const Duration(milliseconds: 0),
      placeholderFadeInDuration: const Duration(milliseconds: 0),
      filterQuality: FilterQuality.high,
      fadeInCurve: Curves.easeInOut,
      useOldImageOnUrlChange: true,
      imageBuilder: isBorder
          ? (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              )
          : null,
      placeholder: (context, url) => Center(
        child: SizedBox(
          width: 12,
          height: 12,
          child: Center(
              child: CircularProgressIndicator.adaptive(
            backgroundColor: Theme.of(context).colorScheme.primary,
            strokeWidth: 1,
          )),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
