import 'package:symphony_app/app/screens/homepage.dart';
import 'package:symphony_app/app/screens/social_screen.dart';
import 'package:symphony_app/app/screens/website_screen.dart';

import '../screens/navigation.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVIGATION;
  static final routes = {
    Routes.NAVIGATION: (context) => NavigationScreen(),
    Routes.WEBSITE: (context) => WebsiteScreen(),
    Routes.HOME: (context) => Homepage(),
    Routes.SOCIAL: (context) => SocialScreen(),
  };
  static final home_routes = {
    Routes.HOME: (context) => Homepage(),
    Routes.SPECIFICATION: (context) => Homepage(),
    Routes.SERVICE_CENTER: (context) => Homepage(),
    Routes.LSO: (context) => Homepage(),
    Routes.CHECK_SUPPORT: (context) => Homepage(),
  };
}
