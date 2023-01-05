import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'app_theme.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class ThemeManager extends AdaptiveTheme {
  ThemeManager({
    super.key,
    required Brightness brightness,
    required super.builder,
  }) : super(
          light: ThemeData.light(),
          dark: ThemeData.dark(),
          initial: brightness.adaptiveThemeMode,
        );

  static AdaptiveThemeManager<ThemeData> of(BuildContext context) {
    final manager = context.findAncestorStateOfType<State<AdaptiveTheme>>()!
        as AdaptiveThemeManager<ThemeData>;
    return manager;
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

extension AppThemeContext on BuildContext {
  AppTheme get appTheme {
    return ThemeManager.themeOf(this);
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
