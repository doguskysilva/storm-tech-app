class Product {
  int id;
  String name;
  double price;
  String picture;
  String description;
  int promptDelivery;

  Product(
      {this.id,
      this.name,
      this.price,
      this.picture,
      this.description,
      this.promptDelivery});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    picture = json['picture'];
    description = json['description'];
    promptDelivery = json['prompt_delivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['picture'] = this.picture;
    data['description'] = this.description;
    data['prompt_delivery'] = this.promptDelivery;
    return data;
  }
}
