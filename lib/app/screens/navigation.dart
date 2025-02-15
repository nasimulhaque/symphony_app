import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:symphony_app/app/routes/app_pages.dart';
import 'package:symphony_app/app/screens/homepage.dart';
import 'package:symphony_app/app/screens/social_screen.dart';
import 'package:symphony_app/app/screens/website_screen.dart';

class NavigationScreen extends StatefulWidget {

  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  List<Widget> _buildScreens() {
    return [
      WebsiteScreen(),
      Homepage(),
      SocialScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Builder(
          builder: (context) {
            final isSelected = _selectedIndex == 0;
            return SvgPicture.asset(
              'assets/vectors/nav_icon_web.svg',
              colorFilter: ColorFilter.mode(isSelected ? Theme.of(context).colorScheme.secondary : CupertinoColors.systemGrey, BlendMode.srcIn),
            );
          },
        ),
        title: "Website",
        contentPadding: 0.0,
        activeColorPrimary: Theme.of(context).colorScheme.secondary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: Routes.WEBSITE,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Builder(
          builder: (context) {
            final isSelected = _selectedIndex == 1;
            return SvgPicture.asset(
              'assets/vectors/nav_icon_home.svg',
              colorFilter: ColorFilter.mode(isSelected ? Theme.of(context).colorScheme.secondary : CupertinoColors.systemGrey, BlendMode.srcIn),
            );
          },
        ),
        title: "Home",
        contentPadding: 0.0,
        activeColorPrimary: Theme.of(context).colorScheme.secondary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: Routes.HOME,
          routes: AppPages.home_routes,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Builder(
          builder: (context) {
            final isSelected = _selectedIndex == 2;
            return SvgPicture.asset(
              'assets/vectors/nav_icon_social.svg',
              colorFilter: ColorFilter.mode(isSelected ? Theme.of(context).colorScheme.secondary : CupertinoColors.systemGrey, BlendMode.srcIn),
            );
          },
        ),
        title: "Social",
        contentPadding: 0.0,
        activeColorPrimary: Theme.of(context).colorScheme.secondary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: Routes.SOCIAL,
        ),
      ),
    ];
  }

  late PersistentTabController _controller;
  int _selectedIndex = 1;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Theme.of(context).primaryColor,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      confineToSafeArea: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      bottomScreenMargin: 24.0,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style6,
      onItemSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}