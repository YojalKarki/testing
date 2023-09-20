import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconsPath;
  String level;
  String duration;
  String calories;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconsPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxColor,
    required this.viewIsSelected,

  });



  static List<DietModel> getDiets() {
    List<DietModel> diets = [];
    diets.add(
      DietModel(
        name: 'Honey Pancake',
        iconsPath: 'assets/icons/fast-food-pancake-svgrepo-com.svg',
        level: 'Easy',
        duration: '30min',
        calories: '180kcal',
        viewIsSelected: false,
        boxColor: const Color(0xff92A3FD),
      ),
    );

    diets.add(
      DietModel(
        name: 'canai Bread',
        iconsPath: 'assets/icons/fresh-bread-svgrepo-com.svg',
        level: 'Easy',
        duration: '20min',
        calories: '230kcal',
        viewIsSelected: false,
        boxColor: Colors.grey,
      ),
    );
    return diets;
  }
}
