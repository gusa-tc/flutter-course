import 'dart:math';

import 'package:flutter/material.dart';
import '../services/product_item_service.dart';
import '../widgets/product_item_list_widget.dart';

class ProductListPage extends StatelessWidget {
  final ProductItemService _productItemsService;
  final RandomItemGenerator _randomItemGenerator = RandomItemGenerator();

  ProductListPage(this._productItemsService);

  @override
  Widget build(BuildContext context) {
    final ProductItemListWidget productItemListWidget =
        ProductItemListWidget(_productItemsService);
    return Scaffold(
        appBar: AppBar(title: Text("EasyList")),
        body:
            Column(children: <Widget>[Expanded(child: productItemListWidget)]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            productItemListWidget.addItem(
                _randomItemGenerator._getRandomTitle(),
                _randomItemGenerator._getRandomImage());
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ));
  }
}

class RandomItemGenerator {
  final List<String> images = ["curry.jpg", "plate.jpg", "roll.jpeg"];
  final List<String> itemDesc = ["Fresh", "Juicy", "Spicy", "Vegan"];
  final List<String> itemType = ["meal", "roll", "dish", "plate"];

  final _random = new Random();

  String _getRandomTitle() {
    return _getRandomFromList(itemDesc) + " " + _getRandomFromList(itemType);
  }

  String _getRandomImage() {
    return _getRandomFromList(images);
  }

  String _getRandomFromList(List<String> list) {
    return list[_random.nextInt(list.length)];
  }
}
