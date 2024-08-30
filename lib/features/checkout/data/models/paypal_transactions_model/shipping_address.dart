class ShippingAddress {
  String? recipientName;
  String? line1;
  String? line2;
  String? city;
  String? countryCode;
  String? postalCode;
  String? phone;
  String? state;

  ShippingAddress({
    this.recipientName,
    this.line1,
    this.line2,
    this.city,
    this.countryCode,
    this.postalCode,
    this.phone,
    this.state,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      recipientName: json['recipient_name'] as String?,
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      city: json['city'] as String?,
      countryCode: json['country_code'] as String?,
      postalCode: json['postal_code'] as String?,
      phone: json['phone'] as String?,
      state: json['state'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'recipient_name': recipientName,
        'line1': line1,
        'line2': line2,
        'city': city,
        'country_code': countryCode,
        'postal_code': postalCode,
        'phone': phone,
        'state': state,
      };
}
