import 'package:in_service/core/service/theme_controller.dart';
import 'package:in_service/index.dart';

class ToggleButton extends StatefulWidget {
  final VoidCallback onLightModeSelected;
  final VoidCallback onDarkModeSelected;

  const ToggleButton({
    super.key,
    required this.onLightModeSelected,
    required this.onDarkModeSelected,
  });

  @override
  ToggleButtonState createState() => ToggleButtonState();
}

const double width = 300;
const double height = 50;
const double lightAlign = -1;
const double darkAlign = 1;
const Color selectedColor = Colors.black;
const Color normalColor = Colors.white;

class ToggleButtonState extends State<ToggleButton> {
  late double xAlign;
  late Color lightColor;
  late Color darkColor;

  @override
  void initState() {
    super.initState();
    bool isLight = AppPreferences.to.getTheme == ThemeOptions.light;
    xAlign = isLight ? lightAlign : darkAlign;
    lightColor = isLight ? selectedColor : normalColor;
    darkColor = !isLight ? selectedColor : normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      padding: gPaddingAll(5),
      decoration: BoxDecoration(
        color: KColors.white.withOpacity(0.1),
        borderRadius: 50.radius,
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: width * 0.45,
              height: height,
              decoration: BoxDecoration(
                color: KColors.white,
                borderRadius: 50.radius,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = lightAlign;
                lightColor = selectedColor;
                darkColor = normalColor;
              });
              widget.onLightModeSelected();
            },
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: width * 0.45,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Kimage.kLight,
                      colorFilter:
                          ColorFilter.mode(lightColor, BlendMode.srcIn),
                    ),
                    5.sW,
                    Text(
                      'Light',
                      style: gStyle14(fontSize: 15, color: lightColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = darkAlign;
                darkColor = selectedColor;
                lightColor = normalColor;
              });
              widget.onDarkModeSelected();
            },
            child: Align(
              alignment: const Alignment(1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Kimage.kDark,
                      colorFilter: ColorFilter.mode(darkColor, BlendMode.srcIn),
                    ),
                    5.sW,
                    Text(
                      'Dark',
                      style: gStyle14(fontSize: 15, color: darkColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
