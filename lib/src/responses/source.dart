part of '../responses.dart';

class Source {
  String object;
  String id;
  bool livemode;
  String location;
  String createdAt;
  String type;
  String flow;
  int amount;
  String currency;
  Null mobileNumber;
  Null phoneNumber;
  Null references;
  Null name;
  Null email;
  String barcode;
  String storeId;
  String storeName;
  String terminalId;
  Null installmentTerm;
  Null zeroInterestInstallments;
  Null scannableCode;

  Source(
      {this.object,
      this.id,
      this.livemode,
      this.location,
      this.createdAt,
      this.type,
      this.flow,
      this.amount,
      this.currency,
      this.mobileNumber,
      this.phoneNumber,
      this.references,
      this.name,
      this.email,
      this.barcode,
      this.storeId,
      this.storeName,
      this.terminalId,
      this.installmentTerm,
      this.zeroInterestInstallments,
      this.scannableCode});

  Source.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
    livemode = json['livemode'];
    location = json['location'];
    createdAt = json['created_at'];
    type = json['type'];
    flow = json['flow'];
    amount = json['amount'];
    currency = json['currency'];
    mobileNumber = json['mobile_number'];
    phoneNumber = json['phone_number'];
    references = json['references'];
    name = json['name'];
    email = json['email'];
    barcode = json['barcode'];
    storeId = json['store_id'];
    storeName = json['store_name'];
    terminalId = json['terminal_id'];
    installmentTerm = json['installment_term'];
    zeroInterestInstallments = json['zero_interest_installments'];
    scannableCode = json['scannable_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['object'] = this.object;
    data['id'] = this.id;
    data['livemode'] = this.livemode;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['type'] = this.type;
    data['flow'] = this.flow;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['mobile_number'] = this.mobileNumber;
    data['phone_number'] = this.phoneNumber;
    data['references'] = this.references;
    data['name'] = this.name;
    data['email'] = this.email;
    data['barcode'] = this.barcode;
    data['store_id'] = this.storeId;
    data['store_name'] = this.storeName;
    data['terminal_id'] = this.terminalId;
    data['installment_term'] = this.installmentTerm;
    data['zero_interest_installments'] = this.zeroInterestInstallments;
    data['scannable_code'] = this.scannableCode;
    return data;
  }
}