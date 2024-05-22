import 'package:flutter/material.dart';

import '../../config/enum/options_home_enum.dart';

class OptionHomeItemModel {
  final String title;
  final IconData icon;
  final OptionsHomeEnum value;
  final bool selected;

  OptionHomeItemModel({
    required this.title,
    required this.icon,
    required this.value,
    required this.selected,
  });
}
