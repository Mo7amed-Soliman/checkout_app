import 'item.dart';
import 'shipping_address.dart';

class OrderItemList {
  List<ItemModel>? orders;
  ShippingAddress? shippingAddress;

  OrderItemList({this.orders, this.shippingAddress});

  factory OrderItemList.fromJson(Map<String, dynamic> json) => OrderItemList(
        orders: (json['items'] as List<dynamic>?)
            ?.map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        shippingAddress: json['shipping_address'] == null
            ? null
            : ShippingAddress.fromJson(
                json['shipping_address'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'items': orders?.map((e) => e.toJson()).toList(),
        'shipping_address': shippingAddress?.toJson(),
      };
}
