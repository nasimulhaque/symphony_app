import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/app/routes/app_pages.dart';

import 'app/shared/theme/my_theme.dart';
import 'app/shared/utils/my_shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MySharedPref.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 815),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (_ , child) {
        return MaterialApp(
          title: 'Symphony',
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            // bool themeIsLight = MySharedPref.getThemeIsLight();
            bool themeIsLight = MediaQuery.of(context).platformBrightness == Brightness.light;
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: themeIsLight ? Colors.white : Color(0xFF181818),
              systemNavigationBarIconBrightness: themeIsLight ? Brightness.dark : Brightness.light,
            ));
            return Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1),
                ),
                child: widget!,
              ),
            );
          },
          initialRoute: AppPages.INITIAL,
          routes: AppPages.routes,
          locale: MySharedPref.getCurrentLocal(),
        );
      },
    );
  }
}