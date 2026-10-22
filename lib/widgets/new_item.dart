import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/helpers/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/models/item.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

// TODO: Replace with your Firebase Realtime Database URL
const String firebaseDatabaseUrl = '<YOUR_FIREBASE_DATABASE_URL>';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _name = '';
  var _quantity = 1;
  var _category = categories[CategoryEnum.groceries]!;
  var _isPosting = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isPosting = true;
      });
      final user = _firebase.currentUser;
      if (user != null) {
        final url = Uri.https(firebaseDatabaseUrl,
            'shopping-list/${user.uid}.json');
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'name': _name,
            'category': _category.name,
            'quantity': _quantity,
          }),
        );
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (context.mounted) {
          Navigator.of(context).pop(
            Item(
              id: data['name'],
              name: _name,
              category: _category,
              quantity: _quantity,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New item'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return 'The name field is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! < 1) {
                          return 'The quantity field is required';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _quantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                        value: _category,
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color: category.value.color,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(category.value.name),
                                ],
                              ),
                            )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _category = value!;
                          });
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: _isPosting
                          ? null
                          : () {
                              _formKey.currentState!.reset();
                              setState(() {
                                _category = categories[CategoryEnum.groceries]!;
                              });
                            },
                      child: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextButton(
                      onPressed: _isPosting ? null : _saveItem,
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
