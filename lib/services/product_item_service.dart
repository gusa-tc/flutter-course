import 'dart:math';
import '../model/productItem.dart';

class ProductItemService {
  final List<ProductItem> _products = List<ProductItem>();

  List<ProductItem> getProductList() {
    return _products.map((p) => p.clone()).toList();
  }

  ProductItem addProductItem(String title, String img) {
    var maxId =
        _products.length > 0 ? _products.map((p) => p.id).reduce(max) : 0;
    var productItem = ProductItem(++maxId, title, img);
    _products.add(productItem);
    return productItem;
  }

  bool removeProductItem(int id) {
    var toRemove = _products.singleWhere((p) => p.id == id, orElse: () => null);
    if (toRemove != null) {
      _products.remove(toRemove);
      return true;
    }
    return false;
  }
}
