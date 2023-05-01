import 'package:fleetime_invitation/ui/home/home_ui.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  String? name =
      Uri.base.queryParameters["name"]; //get parameter with attribute "para1"

  runApp(MainApp(
    nama: name,
  ));
}

class MainApp extends StatefulWidget {
  final String? nama;

  const MainApp({super.key, required this.nama});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 450, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xfffedfe3),
          primaryContainer: Color(0xffd0e4ff),
          secondary: Color(0xffac3306),
          secondaryContainer: Color(0xffffdbcf),
          tertiary: Color(0xff006875),
          tertiaryContainer: Color(0xff95f0ff),
          appBarColor: Color(0xffffdbcf),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 22,
        appBarStyle: FlexAppBarStyle.primary,
        bottomAppBarElevation: 1.0,
        lightIsWhite: true,
        subThemesData: const FlexSubThemesData(
          useTextTheme: true,
          elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
          elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
          segmentedButtonSchemeColor: SchemeColor.primary,
          inputDecoratorSchemeColor: SchemeColor.primary,
          inputDecoratorBackgroundAlpha: 21,
          inputDecoratorRadius: 8.0,
          inputDecoratorUnfocusedHasBorder: false,
          inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
          fabSchemeColor: SchemeColor.tertiary,
          popupMenuRadius: 6.0,
          popupMenuElevation: 4.0,
          dialogRadius: 20.0,
          dialogElevation: 3.0,
          timePickerDialogRadius: 20.0,
          snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
          drawerIndicatorSchemeColor: SchemeColor.primary,
          bottomSheetRadius: 20.0,
          bottomSheetElevation: 2.0,
          bottomSheetModalElevation: 3.0,
          bottomNavigationBarMutedUnselectedLabel: false,
          bottomNavigationBarMutedUnselectedIcon: false,
          bottomNavigationBarBackgroundSchemeColor: SchemeColor.surfaceVariant,
          menuRadius: 6.0,
          menuElevation: 4.0,
          menuBarRadius: 0.0,
          menuBarElevation: 1.0,
          navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.background,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.primary,
          navigationBarIndicatorOpacity: 1.00,
          navigationBarBackgroundSchemeColor: SchemeColor.background,
          navigationBarElevation: 1.0,
          navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.background,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.primary,
          navigationRailIndicatorOpacity: 1.00,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          keepPrimary: true,
          keepSecondary: true,
          keepTertiary: true,
        ),
        tones: FlexTones.ultraContrast(Brightness.light)
            .onMainsUseBW()
            .onSurfacesUseBW(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: GoogleFonts.caladea().fontFamily,
      ),
      home: MaxWidthBox(
        maxWidth: 480,
        child: Home(
          nama: widget.nama == null ? "GUEST" : widget.nama!,
        ),
      ),
    );
  }
}
