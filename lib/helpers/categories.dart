import 'package:flutter/material.dart';

import 'package:shopping_list/models/category.dart';

const categories = {
  CategoryEnum.groceries: Category(
    name: 'Groceries',
    color: Color.fromARGB(255, 235, 59, 90),
  ),
  CategoryEnum.electronics: Category(
    name: 'Electronics',
    color: Color.fromARGB(255, 250, 130, 49),
  ),
  CategoryEnum.clothing: Category(
    name: 'Clothing',
    color: Color.fromARGB(255, 247, 183, 49),
  ),
  CategoryEnum.homeGoods: Category(
    name: 'Home Goods',
    color: Color.fromARGB(255, 32, 191, 107),
  ),
  CategoryEnum.beautyProducts: Category(
    name: 'Beauty Products',
    color: Color.fromARGB(255, 15, 185, 177),
  ),
  CategoryEnum.sportsEquipment: Category(
    name: 'Sports Equipment',
    color: Color.fromARGB(255, 45, 152, 218),
  ),
  CategoryEnum.books: Category(
    name: 'Books',
    color: Color.fromARGB(255, 56, 103, 214),
  ),
  CategoryEnum.toys: Category(
    name: 'Toys',
    color: Color.fromARGB(255, 136, 84, 208),
  ),
  CategoryEnum.furniture: Category(
    name: 'Furniture',
    color: Color.fromARGB(255, 165, 177, 194),
  ),
  CategoryEnum.officeSupplies: Category(
    name: 'Office Supplies',
    color: Color.fromARGB(255, 75, 101, 132),
  ),
};
