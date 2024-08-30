import 'amount.dart';
import 'item_list.dart';
import 'payment_options.dart';

class PaypalTransactionsModel {
  AmountModel? amount;
  String? description;
  PaymentOptions? paymentOptions;
  OrderItemList? itemList;

  PaypalTransactionsModel({
    this.amount,
    this.description,
    this.paymentOptions,
    this.itemList,
  });

  factory PaypalTransactionsModel.fromJson(Map<String, dynamic> json) {
    return PaypalTransactionsModel(
      amount: json['amount'] == null
          ? null
          : AmountModel.fromJson(json['amount'] as Map<String, dynamic>),
      description: json['description'] as String?,
      paymentOptions: json['payment_options'] == null
          ? null
          : PaymentOptions.fromJson(
              json['payment_options'] as Map<String, dynamic>),
      itemList: json['item_list'] == null
          ? null
          : OrderItemList.fromJson(json['item_list'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'payment_options': paymentOptions?.toJson(),
        'item_list': itemList?.toJson(),
      };
}
