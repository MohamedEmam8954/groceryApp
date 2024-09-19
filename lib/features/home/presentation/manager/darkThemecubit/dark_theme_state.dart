part of 'dark_theme_cubit.dart';

@immutable
sealed class DarkThemeState {}

final class DarkThemeInitial extends DarkThemeState {}

final class SetDarkTheme extends DarkThemeState {}

final class GetDarkTheme extends DarkThemeState {}

final class ColorTheme extends DarkThemeState {}
