import 'package:flutter/material.dart';

enum CategoryEnum {
  groceries,
  electronics,
  clothing,
  homeGoods,
  beautyProducts,
  sportsEquipment,
  books,
  toys,
  furniture,
  officeSupplies,
}

class Category {
  const Category({required this.name, required this.color});
  final String name;
  final Color color;
}