import 'package:course_app/config/app_page.dart';
import 'package:course_app/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/app_theme.dart';
import 'module/theme/controller/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
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
