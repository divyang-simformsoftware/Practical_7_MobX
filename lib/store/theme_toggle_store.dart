// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'package:mobx/mobx.dart';

part 'theme_toggle_store.g.dart';

class ThemeToggle = _theme_toggle_storeBase with _$ThemeToggle;

abstract class _theme_toggle_storeBase with Store {
  @observable
  bool themeToggle = false;

  void setDarkLightTheme() {
    themeToggle = !themeToggle;
  }
}
