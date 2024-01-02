import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void toggleTheme({required Brightness brightness}) {
    brightness == Brightness.dark
        ? emit(const ThemeState(themeMode: ThemeMode.light))
        : emit(const ThemeState(themeMode: ThemeMode.dark));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
