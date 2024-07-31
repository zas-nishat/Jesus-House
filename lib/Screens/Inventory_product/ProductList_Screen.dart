import 'dart:io';

import 'package:flutter/material.dart';
import 'ProductModel_Screen.dart';

class ProductListPage extends StatefulWidget {
  final List<ProductModel> products;

  ProductListPage({required this.products});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = widget.products.where((product) {
      final lowerCaseQuery = _searchQuery.toLowerCase();
      return product.name.toLowerCase().contains(lowerCaseQuery) ||
          product.supplier.toLowerCase().contains(lowerCaseQuery) ||
          product.description.toLowerCase().contains(lowerCaseQuery);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Search...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(child: Text("No product found"))
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Stack(
                                children: product.images
                                    .map((images) => Image.file(File(images),
                                        width: 50, height: 50))
                                    .toList(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.name),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Price: ${product.price.toStringAsFixed(2)}'),
                                      Text('Quantity: ${product.quantity}'),
                                      Text('Supplier: ${product.supplier}'),
                                      Text('Date: ${product.date}'),
                                      Text(
                                          'Description: ${product.description}'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
