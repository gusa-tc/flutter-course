import 'package:course_one/model/productItem.dart';
import 'package:flutter/material.dart';
import '../services/product_item_service.dart';
import 'product_item_widget.dart';

class ProductItemListWidget extends StatefulWidget {
  final ProductItemService _productItemService;
  ProductItemListWidgetState _productItemListWidgetState;

  ProductItemListWidget(this._productItemService);

  @override
  State createState() {
    this._productItemListWidgetState =
        ProductItemListWidgetState(_productItemService);
    return _productItemListWidgetState;
  }

  void addItem(String title, String img) {
    if (_productItemListWidgetState != null) {
      _productItemListWidgetState.addItem(title, img);
    }
  }
}

class ProductItemListWidgetState extends State<ProductItemListWidget> {
  final ProductItemService _productItemService;

  ProductItemListWidgetState(this._productItemService);

  @override
  Widget build(BuildContext context) {
    final cachedProductsList = _productItemService.getProductList();

    return cachedProductsList.length == 0
        ? Center(
            child: Text("Start by adding\nnew products"),
          )
        : ListView.builder(
            itemBuilder: (context, index) =>
                ProductItemWidget(cachedProductsList[index], this),
            itemCount: cachedProductsList.length);
  }

  void removeItem(ProductItem productItem) {
    setState(() {
      _productItemService.removeProductItem(productItem.id);
    });
  }

  void addItem(String title, String img) {
    setState(() {
      _productItemService.addProductItem(title, img);
    });
  }
}
