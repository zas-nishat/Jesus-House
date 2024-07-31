import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'ProductList_Screen.dart';
import 'ProductModel_Screen.dart';

class ProductFormPage extends StatefulWidget {
  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _supplierController = TextEditingController();
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();

  final List<ProductModel> _products = [];
  final List<File> _images = [];

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (_images.length < 5) {
          _images.add(File(pickedFile.path));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You can only add up to 5 images.')),
          );
        }
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _addProduct() {
    if (_formKey.currentState!.validate() && _images.isNotEmpty) {
      final String name = _nameController.text;
      final double price = double.parse(_priceController.text);
      final int quantity = int.parse(_quantityController.text);
      final String supplier = _supplierController.text;
      final String date = _dateController.text;
      final String description = _descriptionController.text;

      setState(() {
        _products.add(ProductModel(
          name: name,
          price: price,
          images: _images.map((file) => file.path).toList(),
          quantity: quantity,
          supplier: supplier,
          date: date,
          description: description,
        ));
        _nameController.clear();
        _priceController.clear();
        _quantityController.clear();
        _supplierController.clear();
        _dateController.clear();
        _descriptionController.clear();
        _images.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductListPage(products: _products)));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: _images.asMap().entries.map((entry) {
                      int index = entry.key;
                      File image = entry.value;
                      return Positioned(
                        left: index * 20.0, // Offset each image by 20 pixels
                        child: Stack(
                          children: [
                            Image.file(image, height: 100, width: 100, fit: BoxFit.cover),
                            Positioned(
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _images.remove(image);
                                  });
                                },
                                child: const Icon(Icons.remove_circle, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.image),
                  label: const Text('Pick Images'),
                  onPressed: _pickImage,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Product Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product price';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the quantity';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _supplierController,
                  decoration: const InputDecoration(labelText: 'Supplier'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the supplier';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'Date'),
                  readOnly: true,
                  onTap: () => _pickDate(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLength: 250,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addProduct,
                  child: const Text('Add Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
