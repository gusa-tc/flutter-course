import 'package:flutter/material.dart';
import '../pages/product_item_details_page.dart';
import '../widgets/product_item_list_widget.dart';
import '../model/productItem.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductItem productItem;
  final ProductItemListWidgetState _productItemListState;

  ProductItemWidget(this.productItem, this._productItemListState);

  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: true,
        child: FlatButton(
            onPressed: () => loadDetails(context),
            child: Column(children: <Widget>[
              Image.asset("assets/" + productItem.img),
              Text(productItem.title)
            ])));
  }

  void remove() {
    _productItemListState.removeItem(productItem);
  }

  void loadDetails(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductItemDetailsPage(this)));
  }
}
