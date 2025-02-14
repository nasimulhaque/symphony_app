import 'package:symphony_app/app/screens/homepage.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static final routes = {
    '/home': (context) => Homepage(),
  };
}
