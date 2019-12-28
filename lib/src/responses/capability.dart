part of '../responses.dart';

class Capability {
  String object;
  String location;
  List<String> banks;
  List<PaymentMethods> paymentMethods;
  bool zeroInterestInstallments;

  Capability(
      {this.object,
      this.location,
      this.banks,
      this.paymentMethods,
      this.zeroInterestInstallments});

  Capability.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    location = json['location'];
    banks = json['banks'].cast<String>();
    if (json['payment_methods'] != null) {
      paymentMethods = new List<PaymentMethods>();
      json['payment_methods'].forEach((v) {
        paymentMethods.add(new PaymentMethods.fromJson(v));
      });
    }
    zeroInterestInstallments = json['zero_interest_installments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['object'] = this.object;
    data['location'] = this.location;
    data['banks'] = this.banks;
    if (this.paymentMethods != null) {
      data['payment_methods'] =
          this.paymentMethods.map((v) => v.toJson()).toList();
    }
    data['zero_interest_installments'] = this.zeroInterestInstallments;
    return data;
  }
}

class PaymentMethods {
  String object;
  String name;
  List<String> currencies;
  List<String> cardBrands;
  List<int> installmentTerms;

  PaymentMethods(
      {this.object,
      this.name,
      this.currencies,
      this.cardBrands,
      this.installmentTerms});

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    name = json['name'];
    currencies =
        json['currencies'] != null ? json['currencies'].cast<String>() : null;
    cardBrands =
        json['card_brands'] != null ? json['card_brands'].cast<String>() : null;
    installmentTerms = json['installment_terms'] != null
        ? json['installment_terms'].cast<int>()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['object'] = this.object;
    data['name'] = this.name;
    data['currencies'] = this.currencies;
    data['card_brands'] = this.cardBrands;
    data['installment_terms'] = this.installmentTerms;
    return data;
  }
}
