import 'package:in_service/index.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: KColors.orange,
    brightness: Brightness.light,
    scaffoldBackgroundColor: KColors.scaffoldBackground,
    fontFamily: "NotoSans",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: KColors.white,
      elevation: 0,
    ),

/*     tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
          borderRadius: 8.radius, color: KColors.primary.withOpacity(0.1)),
      labelStyle: gStyle14(),
      unselectedLabelStyle: gStyle14(),
      labelColor: KColors.primary,
      unselectedLabelColor: Colors.black,
    ), */

    //!
    // bottomAppBarTheme: const BottomAppBarTheme(
    //   elevation: 0.0,
    //   shape: CircularNotchedRectangle(),
    //   color: KColors.white,
    // ),
    // floatingActionButtonTheme:
    //     const FloatingActionButtonThemeData(shape: CircleBorder()),

    /*  inputDecorationTheme: InputDecorationTheme(
      hintStyle: gStyle14(color: KColors.textSecondary),
      contentPadding: gPaddingSymmetric(horizontal: 20, vertical: 16),
      filled: true,
      fillColor: KColors.fillColor,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: 20.radius),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: 20.radius),
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: 20.radius),
      // errorBorder: OutlineInputBorder(
      // borderSide: BorderSide.none, borderRadius: 20.radius),
    ), */
/*     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: KColors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ), */
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: "NotoSans",
    visualDensity: VisualDensity.adaptivePlatformDensity,

    scaffoldBackgroundColor: KColors.kDarkBackground,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: KColors.kDarkSurfaceColor,
      elevation: 0,
    ),
    /* tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
          borderRadius: 8.radius, color: KColors.white.withOpacity(0.1)),
      labelStyle: gStyle14(),
      unselectedLabelStyle: gStyle14(),
      labelColor: KColors.white,
      unselectedLabelColor: Colors.white,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 0.0,
      shape: CircularNotchedRectangle(),
      color: KColors.white,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(shape: CircleBorder()),
     */

    // !
    inputDecorationTheme: InputDecorationTheme(
      fillColor: KColors.kContentColor,
      filled: true,
      contentPadding: gPaddingSymmetric(horizontal: 20, vertical: 16),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      // errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
    ),
    /*  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ), */
  );
}

// Default Overlay.
SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.black,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);

SystemUiOverlayStyle customOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
);
