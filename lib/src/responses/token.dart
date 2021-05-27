part of '../responses.dart';

/// Token API: please check https://www.omise.co/tokens-api
class Token {
  String? object;
  String? id;
  bool? livemode;
  String? location;
  String? chargeStatus;
  String? createdAt;
  bool? used;
  Card? card;

  Token(
      {this.object,
      this.id,
      this.livemode,
      this.location,
      this.createdAt,
      this.used,
      this.card});

  Token.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
    livemode = json['livemode'];
    location = json['location'];
    chargeStatus = json['charge_status'];
    createdAt = json['created_at'];
    used = json['used'];
    card = json['card'] != null ? new Card.fromJson(json['card']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['object'] = this.object;
    data['id'] = this.id;
    data['livemode'] = this.livemode;
    data['location'] = this.location;
    data['charge_status'] = this.chargeStatus;
    data['created_at'] = this.createdAt;
    data['used'] = this.used;
    if (this.card != null) {
      data['card'] = this.card!.toJson();
    }
    return data;
  }
}
