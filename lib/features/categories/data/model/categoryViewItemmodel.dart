import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';

class CategoryViewItemModel {
  final Color color;
  final String title, image;

  const CategoryViewItemModel(
      {required this.color, required this.title, required this.image});
}

const List<CategoryViewItemModel> categoriesdata = [
  CategoryViewItemModel(
      color: Color(0xff53B175),
      title: AppStrings.fruits,
      image: Assets.assetsImagesCatFruits),
  CategoryViewItemModel(
      color: Color(0xffF8A44C),
      title: AppStrings.vegetables,
      image: Assets.assetsImagesCatVeg),
  CategoryViewItemModel(
      color: Color(0xffF7A593),
      title: AppStrings.herbs,
      image: Assets.assetsImagesCatSpinach),
  CategoryViewItemModel(
      color: Color(0xffD3B0E0),
      title: AppStrings.spices,
      image: Assets.assetsImagesCatSpices),
  CategoryViewItemModel(
      color: Color(0xffFDE598),
      title: AppStrings.grains,
      image: Assets.assetsImagesCatGrains),
  CategoryViewItemModel(
      color: Color(0xffB7DFF5),
      title: AppStrings.nuts,
      image: Assets.assetsImagesCatNuts),
];
