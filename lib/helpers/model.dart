import 'package:flutter/material.dart';

class Model {
  String title;
  String description;
  List<int> ratings;
  String imgPath;
  Alignment align;
  Color color;

  Model({
    this.title,
    this.description,
    this.ratings,
    this.imgPath,
    this.align,
    this.color,
  });
}
