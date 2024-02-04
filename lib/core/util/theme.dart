import '/index.dart';

ThemeData get getThemeData => ThemeData(
      scaffoldBackgroundColor: KColors.scaffoldBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: KColors.primary,
        secondary: KColors.primary.withOpacity(.5),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        elevation: 0.0,
        shape: CircularNotchedRectangle(),
        color: KColors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: KColors.transparent,
        shape: RoundedRectangleBorder(borderRadius: 30.radius),
      ),
      fontFamily: "NotoSans",
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: KColors.white,
        surfaceTintColor: KColors.transparent,
      ),
      useMaterial3: true,
      // dividerTheme:
      //     const DividerThemeData(color: KColors.greyLight, thickness: 1.5),
    );
