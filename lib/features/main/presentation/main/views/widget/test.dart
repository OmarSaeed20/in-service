/* import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/rendering.dart';
import 'package:in_service/features/main/presentation/main/controllers/main_controller.dart';
import 'package:in_service/index.dart';

import 'bottom_nav_bar_fb5.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.ctrl}) : super(key: key);

  final MainControllerImp ctrl;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // final autoSizeGroup = AutoSizeGroup();
  // var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(milliseconds: 350),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(milliseconds: 350),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: NotificationListener<ScrollNotification>(
          onNotification: onScrollNotification,
          child: widget.ctrl.state.value.pages
              .elementAt(widget.ctrl.state.value.currentIndex),
        ),
        floatingActionButton: FloatingActionButton(
          child: ClipRRect(
            borderRadius: 200.radius,
            child: Image.asset(Kimage.logoPng),
          ),
          onPressed: () {
            // widget.ctrl.changePage(index: 2);
            _fabAnimationController.reset();
            _borderRadiusAnimationController.reset();
            _borderRadiusAnimationController.forward();
            _fabAnimationController.forward();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: widget.ctrl.state.value.icons1.length,
          tabBuilder: (int index, bool isActive) {
            return CustomMaterialButton(
              text: widget.ctrl.state.value.titl[index].tr,
              onTap: () => widget.ctrl.changePage(index: index),
              img: widget.ctrl.state.value.icons1[index],
              isActive: isActive,
            );
          },
          backgroundColor: KColors.white,
          activeIndex: widget.ctrl.state.value.currentIndex,
          splashColor: KColors.grey1,
          notchAndCornersAnimation: borderRadiusAnimation,
          splashSpeedInMilliseconds: 200,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => widget.ctrl.changePage(index: index),
          hideAnimationController: _hideBottomBarAnimationController,
          shadow: const BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 12,
            spreadRadius: 0.5,
            color: KColors.secondary,
          ),
        ),
      ),
    );
  }
}
/* 
class NavigationScreen extends StatefulWidget {
  final Widget view;

  const NavigationScreen({required this.view, super.key});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void didUpdateWidget(NavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.view != widget.view) {
      _startAnimation();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeInExpo);
    _controller.forward();
    super.initState();
  }

  _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeInExpo);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    return CircularRevealAnimation(
      animation: animation,
      centerOffset: const Offset(200, 900),
      maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
      child: widget.view,
    );
  }
}
 */ */