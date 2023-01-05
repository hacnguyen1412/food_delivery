import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:core_ui/src/localization/locale_type.dart';
import 'package:core_ui/src/theme/app_theme.dart';
import 'package:core_ui/src/theme/dark_theme.dart';
import 'package:core_ui/src/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class UIBehavior {
  void changeLocale(LocaleType localeType);
  void setLight();
  void setDark();
  void toggleThemeMode();
  @protected
  AdaptiveThemeManager<ThemeData>? _adaptiveManager;
}

class UIManager extends StatefulWidget {
  final Brightness brightness;
  final Locale initialLocale;
  final Widget Function(ThemeData, ThemeData, Locale) builder;
  const UIManager({
    super.key,
    required this.brightness,
    required this.builder,
    required this.initialLocale,
  });

  @override
  State<UIManager> createState() => _UIManagerState();

  static UIBehavior of(BuildContext context) {
    final state = context.findAncestorStateOfType<State<UIManager>>();
    final behavior = state as UIBehavior;
    if (behavior._adaptiveManager == null) {
      final adaptiveManager =
          context.findAncestorStateOfType<State<AdaptiveTheme>>()!
              as AdaptiveThemeManager<ThemeData>;
      behavior._adaptiveManager = adaptiveManager;
    }
    return behavior;
  }

  static AppTheme themeOf(BuildContext context) {
    final adaptiveManager =
        context.findAncestorStateOfType<State<AdaptiveTheme>>()!
            as AdaptiveThemeManager<ThemeData>;
    final appTheme = adaptiveManager.brightness!.appTheme;
    return appTheme;
  }

  static Future<Brightness> getBrightness() async {
    final adaptiveMode = await AdaptiveTheme.getThemeMode();
    Brightness? brightness = adaptiveMode?.brightness;
    brightness ??= SchedulerBinding.instance.window.platformBrightness;
    return brightness;
  }
}

class _UIManagerState extends State<UIManager> implements UIBehavior {
  late Locale currentLocale;
  late Widget Function(ThemeData, ThemeData) adaptiveBuilder;

  @override
  void initState() {
    currentLocale = widget.initialLocale;
    adaptiveBuilder = (p0, p1) {
      return widget.builder(p0, p1, currentLocale);
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initial: widget.brightness.adaptiveThemeMode,
      builder: adaptiveBuilder,
    );
  }

  @override
  void changeLocale(LocaleType localeType) {
    setState(() {
      currentLocale = localeType.locale;
    });
  }

  @override
  void setDark() {
    _adaptiveManager?.setDark();
  }

  @override
  void setLight() {
    _adaptiveManager?.setLight();
  }

  @override
  void toggleThemeMode() {
    if (_adaptiveManager?.brightness == Brightness.light) {
      setDark();
    } else {
      setLight();
    }
  }

  @override
  AdaptiveThemeManager<ThemeData>? _adaptiveManager;
}

extension BrightnessExtension on Brightness {
  AppTheme get appTheme {
    switch (this) {
      case Brightness.light:
        return LightTheme.instance;
      case Brightness.dark:
        return DarkTheme.instance;
      default:
        throw UnimplementedError();
    }
  }

  AdaptiveThemeMode get adaptiveThemeMode {
    switch (this) {
      case Brightness.light:
        return AdaptiveThemeMode.light;
      case Brightness.dark:
        return AdaptiveThemeMode.dark;
      default:
        throw UnimplementedError();
    }
  }
}

extension AppThemeContext on BuildContext {
  AppTheme get appTheme {
    return UIManager.themeOf(this);
  }
}

extension on AdaptiveThemeMode {
  Brightness? get brightness {
    switch (this) {
      case AdaptiveThemeMode.light:
        return Brightness.light;
      case AdaptiveThemeMode.dark:
        return Brightness.dark;
      default:
        return null;
    }
  }
}
