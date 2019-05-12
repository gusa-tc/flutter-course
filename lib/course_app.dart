import 'package:flutter/material.dart';
import 'services/product_item_service.dart';
import 'pages/product_list_page.dart';

class CourseApp extends StatelessWidget {
  final ProductItemService _productItemService = ProductItemService();

  @override
  Widget build(BuildContext context) {
    final ProductListPage productListPage =
        ProductListPage(_productItemService);

    return MaterialApp(
        home: productListPage);
  }
}
