import 'package:flutter/material.dart';

import 'model.dart';

class Models {
  List<Model> _models = [
    Model(
      title: "Backwaters",
      description:
          "The Kerala backwaters are a network of brackish lagoons and lakes lying parallel to the Arabian Sea coast (known as the Malabar Coast) of Kerala state in southern India, as well as interconnected canals, rivers, and inlets, a labyrinthine system formed by more than 900 kilometres of waterways.",
      ratings: [4, 3, 5, 2, 4, 5, 4, 4, 1, 5, 5],
      imgPath: 'images/houseboat.png',
      align: Alignment.topLeft,
      color: Colors.lightBlue.shade700,
    ),
    Model(
      title: "Ayurveda",
      description:
          "Kerala Ayurveda is famous for its 5 prolonged treatment, named as Panchakarma. As part of this treatment medicated oil, herbs, milk, and special diet are used to cure all types of aliments.",
      ratings: [5, 4, 5, 5, 5, 3, 5, 4],
      imgPath: 'images/ayurveda.png',
      align: Alignment.topRight,
      color: Colors.green,
    ),
    Model(
      title: "Theyyam",
      description:
          "Theyyam (Teyyam, Theyam, Theyyattam) is a popular ritual form of worship in Kerala, India, predominantly in the Kolathunadu area (consisting of present-day Kasargod, Kannur Districts, Mananthavady Taluk of Wayanad and Vadakara and Koyilandy Taluks of Kozhikode of Kerala).",
      ratings: [5, 5, 5, 5, 5, 5, 5, 5, 5],
      imgPath: 'images/theyyam.jpg',
      align: Alignment.topLeft,
      color: Colors.deepOrangeAccent,
    ),
  ];

  getModels(String text) {
    List<Model> models = [];
    for (var o in _models) {
      if (o.title.toLowerCase().contains(text)) {
        models.add(o);
      }
    }
    return models;
  }
}
