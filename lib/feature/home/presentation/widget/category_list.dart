import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List category = ['All', 'Combos', 'Sliders', 'Classic'];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(category.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentindex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
                decoration: BoxDecoration(
                  color: currentindex == index
                      ? AppColors.primaryColor
                      : Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  category[index],
                  style: TextStyle(
                    color: currentindex == index ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
