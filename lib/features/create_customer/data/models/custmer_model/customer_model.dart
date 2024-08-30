import 'invoice_settings.dart';

class CustomerModel {
  String? id;
  String? object;
  dynamic address;
  int? balance;
  int? created;
  dynamic currency;
  dynamic defaultSource;
  bool? delinquent;
  dynamic description;
  dynamic discount;
  dynamic email;
  String? invoicePrefix;
  InvoiceSettings? invoiceSettings;
  bool? livemode;

  dynamic name;
  int? nextInvoiceSequence;
  dynamic phone;
  List<dynamic>? preferredLocales;
  dynamic shipping;
  String? taxExempt;
  dynamic testClock;

  CustomerModel({
    this.id,
    this.object,
    this.address,
    this.balance,
    this.created,
    this.currency,
    this.defaultSource,
    this.delinquent,
    this.description,
    this.discount,
    this.email,
    this.invoicePrefix,
    this.invoiceSettings,
    this.livemode,
    this.name,
    this.nextInvoiceSequence,
    this.phone,
    this.preferredLocales,
    this.shipping,
    this.taxExempt,
    this.testClock,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json['id'] as String?,
        object: json['object'] as String?,
        address: json['address'] as dynamic,
        balance: json['balance'] as int?,
        created: json['created'] as int?,
        currency: json['currency'] as dynamic,
        defaultSource: json['default_source'] as dynamic,
        delinquent: json['delinquent'] as bool?,
        description: json['description'] as dynamic,
        discount: json['discount'] as dynamic,
        email: json['email'] as dynamic,
        invoicePrefix: json['invoice_prefix'] as String?,
        invoiceSettings: json['invoice_settings'] == null
            ? null
            : InvoiceSettings.fromJson(
                json['invoice_settings'] as Map<String, dynamic>),
        livemode: json['livemode'] as bool?,
        name: json['name'] as dynamic,
        nextInvoiceSequence: json['next_invoice_sequence'] as int?,
        phone: json['phone'] as dynamic,
        preferredLocales: json['preferred_locales'] as List<dynamic>?,
        shipping: json['shipping'] as dynamic,
        taxExempt: json['tax_exempt'] as String?,
        testClock: json['test_clock'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'address': address,
        'balance': balance,
        'created': created,
        'currency': currency,
        'default_source': defaultSource,
        'delinquent': delinquent,
        'description': description,
        'discount': discount,
        'email': email,
        'invoice_prefix': invoicePrefix,
        'invoice_settings': invoiceSettings?.toJson(),
        'livemode': livemode,
        'name': name,
        'next_invoice_sequence': nextInvoiceSequence,
        'phone': phone,
        'preferred_locales': preferredLocales,
        'shipping': shipping,
        'tax_exempt': taxExempt,
        'test_clock': testClock,
      };
}