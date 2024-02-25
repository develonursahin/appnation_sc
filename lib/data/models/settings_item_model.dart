import 'package:flutter/material.dart';

class SettingsItem {
  final String title;
  final String iconPath;
  final Widget? trailing;

  SettingsItem({required this.title, required this.iconPath, this.trailing});
}
