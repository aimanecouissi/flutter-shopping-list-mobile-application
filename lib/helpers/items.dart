import 'package:shopping_list/helpers/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/item.dart';

final items = [
  Item(
    id: '1',
    name: 'Milk',
    category: categories[CategoryEnum.groceries]!,
    quantity: 2,
  ),
  Item(
    id: '2',
    name: 'Smartphone',
    category: categories[CategoryEnum.electronics]!,
    quantity: 1,
  ),
  Item(
    id: '3',
    name: 'T-shirt',
    category: categories[CategoryEnum.clothing]!,
    quantity: 3,
  ),
];
