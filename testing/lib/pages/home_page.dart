import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:testing/models/recommendation_diet.dart';
import 'package:testing/pages/search.dart';
import 'package:testing/pages/user.dart';
import '../models/category_model.dart';
import '../models/popular_model.dart';
import '../routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DietModel> diets = [];
  List<CategoryModel> categories = [];
  List<PopularDietsModel> popularDiets = [];

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getPopularDiets() {
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  void initState() {
    _getCategories();
    _getDiets();
    _getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getDiets();
    _getCategories();
    _getPopularDiets();
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(
            height: 40,
          ),
          _categoriesPart(),
          const SizedBox(
            height: 40,
          ),
          _dietSection(),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                  const SizedBox(
                    height: 25,
                  ),
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  itemCount: popularDiets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 115,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff1D1).withOpacity(0.7),
                            offset: Offset(0, 10),
                            blurRadius: 40,
                            spreadRadius: 0,
                          ),
                        ],),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                popularDiets[index].iconsPath,
                                height: 65,
                                width: 65,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularDiets[index].name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(
                                popularDiets[index].level +
                                    ' | ' +
                                    popularDiets[index].duration +
                                    ' | ' +
                                    popularDiets[index].calories,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation \nFor Diet ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 270,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[index].iconsPath),
                    Text(
                      diets[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${diets[index].level} | ${diets[index]
                          .calories} | ${diets[index].duration}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 45,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          diets[index].viewIsSelected
                              ? Color(0xff9DCEFF)
                              : Colors.transparent,
                          diets[index].viewIsSelected
                              ? Color(0xff92A3FD)
                              : Colors.transparent,
                        ]),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                                color: diets[index].viewIsSelected
                                    ? Colors.white
                                    : Color(0xffC58BF2),
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          )),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) =>
            const SizedBox(
              width: 25,
            ),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
          ),
        )
      ],
    );
  }

  Column _categoriesPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'Category',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 25),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categories[index].iconsPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 50, right: 50),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: TextField(
        onTap:  () {
          showSearch(context: context, delegate: SearchFood());
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search MoMo',
            hintStyle: const TextStyle(color: Colors.black, fontSize: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child:
              SvgPicture.asset('assets/icons/arrow-left-5-svgrepo-com.svg'),
            ),
            suffixIcon: Container(
              color: Colors.white,
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black54,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                          'assets/icons/arrow-left-5-svgrepo-com.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: Consumer<User>(
        builder: (BuildContext context, User value, Widget? child) { return Text(
          'Welcome ${value.username}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        );},

      ),
      backgroundColor: Colors.white,
      leading:GestureDetector(
        onTap: () {
        },
        child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
           ),
      ),

    actions: [
    GestureDetector(
    onTap: () {},
    child: Container(
    margin: const EdgeInsets.all(10),
    alignment: Alignment.center,
    width: 37,
    decoration: BoxDecoration(
    color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: SvgPicture.asset(
    'assets/icons/dots-3-horizontal-svgrepo-com.svg'),
    ),
    ),
    ]
    ,
    );
  }
}
