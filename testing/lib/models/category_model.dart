import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconsPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconsPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(
      CategoryModel(
        name: 'Salad',
        iconsPath: 'assets/icons/salad-svgrepo-com.svg',
        boxColor: const Color(0xff92A3FD),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Cake',
        iconsPath:
            'assets/icons/cgbug-steven-garcia-thanksgiving-2010-homemade-gormet-pumpkin-pie-slice-dessert-with-whipped-cream-and-cinnamon.svg',
        boxColor: Colors.grey,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Pie',
        iconsPath: 'assets/icons/pie-cake-pastry-sweet-svgrepo-com.svg',
        boxColor: Colors.deepPurple,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Smoothie',
        iconsPath: 'assets/icons/orange-juice-svgrepo-com.svg',
        boxColor: Colors.cyan,
      ),
    );

    return categories;
  }
}
