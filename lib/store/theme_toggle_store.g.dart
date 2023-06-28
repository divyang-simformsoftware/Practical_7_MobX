// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_toggle_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeToggle on _theme_toggle_storeBase, Store {
  late final _$themeToggleAtom =
      Atom(name: '_theme_toggle_storeBase.themeToggle', context: context);

  @override
  bool get themeToggle {
    _$themeToggleAtom.reportRead();
    return super.themeToggle;
  }

  @override
  set themeToggle(bool value) {
    _$themeToggleAtom.reportWrite(value, super.themeToggle, () {
      super.themeToggle = value;
    });
  }

  @override
  String toString() {
    return '''
themeToggle: ${themeToggle}
    ''';
  }
}
