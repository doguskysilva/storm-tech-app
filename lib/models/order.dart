import 'package:stnatura/models/client.dart';

class Order {
  int id;
  String code;
  int status;
  String statusDescription;
  double amount;
  Cliente cliente;
  String createdAt;
  String updatedAt;

  Order(
      {this.id,
      this.code,
      this.status,
      this.statusDescription,
      this.amount,
      this.cliente,
      this.createdAt,
      this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    status = json['status'];
    statusDescription = json['status_description'];
    amount = json['amount'].toDouble();
    cliente =
        json['cliente'] != null ? new Cliente.fromJson(json['cliente']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['status'] = this.status;
    data['status_description'] = this.statusDescription;
    data['amount'] = this.amount;
    if (this.cliente != null) {
      data['cliente'] = this.cliente.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
