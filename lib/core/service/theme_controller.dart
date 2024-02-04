// ignore_for_file: omit_local_variable_types
import 'package:in_service/index.dart';

class ThemeController extends GetxController {
  final AppPreferences storage ;
  String theme = ThemeOptions.light;

  ThemeController({required this.storage});

  @override
  void onInit() {
    super.onInit();
    getThemeState();
  }

  Future<void> getThemeState() async {
    final String themeInStorage = storage.getTheme;
    return setTheme(themeInStorage);
  }

  Future<void> setTheme(String value) async {
    theme = value;
    await storage.setTheme(value);
    if (value == ThemeOptions.system) Get.changeThemeMode(ThemeMode.system);
    if (value == ThemeOptions.light) Get.changeThemeMode(ThemeMode.light);
    if (value == ThemeOptions.dark) Get.changeThemeMode(ThemeMode.dark);
    
    update();
  }
}

class ThemeOptions {
  static const String system = 'system';
  static const String light = 'light';
  static const String dark = 'dark';
}

ThemeMode getThemeMode(String type) {
  var themeMode = ThemeMode.system;
  switch (type) {
    case 'system':
      themeMode = ThemeMode.system;
      break;
    case 'dark':
      themeMode = ThemeMode.dark;
      break;
    default:
      themeMode = ThemeMode.light;
      break;
  }

  return themeMode;
}