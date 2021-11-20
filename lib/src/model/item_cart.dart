class ItemCart {
  String? id;
  String? name;
  String? img;
  String? des;
  String? price;

  ItemCart({this.id, this.name, this.img, this.des, this.price});

  ItemCart.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    img = json['image'];
    des = json['description'];
    price = json['price'];
  }
}
