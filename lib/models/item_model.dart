import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/views/enrollment.dart';

class ItemModel {
  bool expanded;
  String headerItem;
  String discription;
  Color colorsItem;

  ItemModel({
    this.expanded: false,
    required this.headerItem,
    required this.discription,
    required this.colorsItem,
  });
}
