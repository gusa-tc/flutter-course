import 'package:flutter/material.dart';
import '../widgets/product_item_widget.dart';

class ProductItemDetailsPage extends StatelessWidget {
  final ProductItemWidget _productItemWidget;

  ProductItemDetailsPage(this._productItemWidget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Details of " + _productItemWidget.productItem.title)),
        body: _productItemWidget,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _productItemWidget.remove();
            Navigator.pop(context);
          },
          child: Icon(Icons.remove),
          backgroundColor: Colors.red,
        ));
  }
}
