class ProductItem {
  int id;
  String title;
  String img;

  ProductItem(this.id, this.title, this.img);

  ProductItem clone() {
    return ProductItem(id, title, img);
  }
}
