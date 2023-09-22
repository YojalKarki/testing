import 'package:flutter/material.dart';

class PopularDietsModel {
  String name;
  String iconsPath;
  String level;
  String duration;
  String calories;
  bool boxIsSelected;
  Color boxColor;

  PopularDietsModel({
    required this.name,
    required this.iconsPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxColor,
    required this.boxIsSelected,
  });

  static List<PopularDietsModel> getPopularDiets() {
    List<PopularDietsModel> popularDiet = [];
    popularDiet.add(
      PopularDietsModel(
        name: 'Blue Berry Pancake',
        iconsPath: 'assets/icons/salad-svgrepo-com.svg',
        boxColor: const Color(0xff92A3FD),
        level: 'Medium',
        duration: '10 min',
        calories: '300kcl',
        boxIsSelected: true,
      ),
    );

    popularDiet.add(
      PopularDietsModel(
          name: 'Salmon Irini',
          iconsPath: 'assets/icons/salad-svgrepo-com.svg',
          boxColor:  Colors.red,
          level: 'Medium',
          duration: '10 min',
          calories: '300kcl',
          boxIsSelected: true),
    );
    return popularDiet;
  }
}
