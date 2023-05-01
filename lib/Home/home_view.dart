import 'package:crypto_app/Home/Screens/Exchange/exchangepage_view.dart';
import 'package:crypto_app/Home/Screens/HomePage/view/homepage_view.dart';
import 'package:crypto_app/Home/Screens/Profile/profilepage_view.dart';
import 'package:crypto_app/Home/Screens/ToBuy/tobuypage_view.dart';
import 'package:crypto_app/Home/Screens/Wallet/view/walletpage_view.dart';
import 'package:crypto_app/Utils/custom_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Homelanding extends StatefulWidget {
  final BuildContext menuScreenContext;

  const Homelanding({Key? key, required this.menuScreenContext})
      : super(key: key);

  @override
  State<Homelanding> createState() => _HomelandingState();
}

class _HomelandingState extends State<Homelanding> {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      WalletPage(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      ExchangePage(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      ToBuyPage(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      ProfilePage(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_filled),
        title: "Home",
        activeColorPrimary: ColorCustom.brilliantAzura,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.wallet_travel_rounded),
        title: ("Wallet"),
        activeColorPrimary: ColorCustom.brilliantAzura,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.currency_exchange),
        title: ("Exchange"),
        activeColorPrimary: ColorCustom.brilliantAzura,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_bag_rounded),
        title: ("To Buy"),
        activeColorPrimary: ColorCustom.brilliantAzura,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.person_rounded,
        ),
        title: ("Profile"),
        activeColorPrimary: ColorCustom.brilliantAzura,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          hideNavigationBarWhenKeyboardShows: true,
          margin: const EdgeInsets.all(0.0),
          popActionScreens: PopActionScreensType.all,
          bottomScreenMargin: 0.0,
          decoration: NavBarDecoration(
              colorBehindNavBar: Colors.yellow,
              borderRadius: BorderRadius.circular(20.0)),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style15,
        ),
      ),
    );
  }
}
