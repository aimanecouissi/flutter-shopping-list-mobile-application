import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/helpers/categories.dart';
import 'package:shopping_list/models/item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

// TODO: Replace with your Firebase Realtime Database URL (without https://)
const String firebaseDatabaseUrl = '<YOUR_FIREBASE_DATABASE_URL>';

final _firebase = FirebaseAuth.instance;

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  List<Item> _itemList = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    final user = _firebase.currentUser;
    if (user != null) {
      final url = Uri.https(firebaseDatabaseUrl,
          'shopping-list/${user.uid}.json');
      try {
        final response = await http.get(url);
        if (response.statusCode > 400) {
          setState(() {
            _error = 'There has been an error!';
          });
        }
        if (response.body == 'null') {
          setState(() {
            _isLoading = false;
          });
          return;
        }
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<Item> list = [];
        for (var item in data.entries) {
          list.add(
            Item(
                id: item.key,
                name: item.value['name'],
                category: categories.entries
                    .firstWhere((element) =>
                        element.value.name == item.value['category'])
                    .value,
                quantity: item.value['quantity']),
          );
        }
        setState(() {
          _itemList = list;
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _error = 'There has been an error!';
        });
      }
    }
  }

  void _showNewItemScreen() async {
    final item = await Navigator.of(context).push<Item>(MaterialPageRoute(
      builder: (context) => const NewItem(),
    ));
    if (item == null) {
      return;
    }
    setState(() {
      _itemList.add(item);
    });
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Center(
        child: Text(
      'Your shopping list is empty!'.toUpperCase(),
      style: const TextStyle(fontSize: 16),
    ));
    if (_isLoading) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_error != null) {
      body = Center(
        child: Text(
          _error!.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      );
    }
    if (_itemList.isNotEmpty) {
      body = ListView.builder(
        itemCount: _itemList.length,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) {
            final user = _firebase.currentUser;
            if (user != null) {
              final url = Uri.https(
                  firebaseDatabaseUrl,
                  'shopping-list/${user.uid}/${_itemList[index].id}.json');
              http.delete(url);
              setState(() {
                _itemList.remove(_itemList[index]);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item deleted successfully!'),
                ),
              );
            }
          },
          key: ValueKey(_itemList[index].id),
          child: ListTile(
            title: Text(_itemList[index].name),
            leading: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _itemList[index].category.color,
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
            trailing: Text(_itemList[index].quantity.toString()),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Shopping List'),
          ],
        ),
        actions: [
          IconButton(
              onPressed: _showNewItemScreen,
              icon: const Icon(Icons.add_circle)),
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout_outlined)),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: body),
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
                '© ${DateTime.now().year} Aimane Couissi - All Rights Reserved.'),
          ),
        ],
      ),
    );
  }
}
