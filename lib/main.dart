import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:in_service/core/service/theme_controller.dart';
import 'package:in_service/index.dart';

import 'core/consts/app_theme.dart';
import 'core/util/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  final themeCtrl = Get.put(()=>ThemeController(storage: AppPreferences.to));
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: ScreenUtilInit(
        designSize: MediaQuery.sizeOf(context),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        ensureScreenSize: true,
        builder: (context, child) => GetMaterialApp(
          title: 'In Service',
          debugShowCheckedModeBanner: false,
          translationsKeys: {Keys.ar: ar, Keys.en: en},
          locale: Locale(Get.find<AppPreferences>().getLang),
          fallbackLocale: const Locale(Keys.en),
          supportedLocales: const [Locale(Keys.en), Locale(Keys.ar)],
          localizationsDelegates: const [
            // CountryLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // theme: getThemeData,
          // themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: getThemeMode(AppPreferences.to.getTheme),
          initialRoute: Routes.init,
          getPages: AppPages.routes,
          // home: const Scaffold(),
        ),
      ),
    );
  }
}
