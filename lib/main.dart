import 'package:core_theme/core_theme.dart';
import 'package:course_app/core/di/service_locator.dart';
import 'package:course_app/core/navigation/app_page.dart';
import 'package:course_app/core/navigation/routes.dart';
import 'package:course_app/core/presentation/orientation_config.dart';
import 'package:course_app/core/presentation/system_ui_overlay_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'module/theme/controller/theme_controller.dart';

void main() {
  setOrientations();
  setupLocator();
  runApp(buildSystemUiOverlay(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.linear(1),
        ),
        child: GetMaterialApp(
          enableLog: true,
          getPages: AppPage.pages,
          useInheritedMediaQuery: true,
          defaultTransition: Transition.cupertino,
          debugShowCheckedModeBanner: false,
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          title: 'COURSE APP',
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeController.theme,
          initialRoute: Routes.login,
        ),
      ),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APpbar"),
      ),
    );
  }
}
