part of '../responses.dart';

/// Card API: please check https://www.omise.co/cards-api
class Card {
  String? object;
  String? id;
  bool? livemode;
  String? location;
  String? createdAt;
  bool? deleted;
  String? street1;
  String? street2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? phoneNumber;
  String? financing;
  String? bank;
  String? firstDigits;
  String? lastDigits;
  String? brand;
  int? expirationMonth;
  int? expirationYear;
  String? fingerprint;
  String? name;
  @Deprecated(
      "This attribute is deprecated. Please check https://www.omise.co/cards-api")
  bool? securityCodeCheck;

  Card(
      {this.object,
      this.id,
      this.livemode,
      this.location,
      this.createdAt,
      this.deleted,
      this.street1,
      this.street2,
      this.city,
      this.state,
      this.postalCode,
      this.country,
      this.phoneNumber,
      this.financing,
      this.bank,
      this.firstDigits,
      this.lastDigits,
      this.brand,
      this.expirationMonth,
      this.expirationYear,
      this.fingerprint,
      this.name,
      this.securityCodeCheck});

  Card.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
    livemode = json['livemode'];
    location = json['location'];
    createdAt = json['created_at'];
    deleted = json['deleted'];
    street1 = json['street1'];
    street2 = json['street2'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    country = json['country'];
    phoneNumber = json['phone_number'];
    financing = json['financing'];
    bank = json['bank'];
    firstDigits = json['first_digits'];
    lastDigits = json['last_digits'];
    brand = json['brand'];
    expirationMonth = json['expiration_month'];
    expirationYear = json['expiration_year'];
    fingerprint = json['fingerprint'];
    name = json['name'];
    // ignore: deprecated_member_use_from_same_package
    securityCodeCheck = json['security_code_check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['object'] = this.object;
    data['id'] = this.id;
    data['livemode'] = this.livemode;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['deleted'] = this.deleted;
    data['street1'] = this.street1;
    data['street2'] = this.street2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postal_code'] = this.postalCode;
    data['country'] = this.country;
    data['phone_number'] = this.phoneNumber;
    data['financing'] = this.financing;
    data['bank'] = this.bank;
    data['first_digits'] = this.firstDigits;
    data['last_digits'] = this.lastDigits;
    data['brand'] = this.brand;
    data['expiration_month'] = this.expirationMonth;
    data['expiration_year'] = this.expirationYear;
    data['fingerprint'] = this.fingerprint;
    data['name'] = this.name;
    // ignore: deprecated_member_use_from_same_package
    data['security_code_check'] = this.securityCodeCheck;
    return data;
  }
}
