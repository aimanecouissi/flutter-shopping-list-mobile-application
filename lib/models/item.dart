import 'package:shopping_list/models/category.dart';

class Item {
  const Item({required this.id, required this.name, required this.category, required this.quantity});
  final String id;
  final String name;
  final Category category;
  final int quantity;
}
