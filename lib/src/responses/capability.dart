part of '../responses.dart';

/// Capability API: please check https://www.omise.co/capability-api
class Capability {
  String? object;
  String? location;
  List<String>? banks;
  List<PaymentMethods>? paymentMethods;
  bool? zeroInterestInstallments;

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
      paymentMethods = <PaymentMethods>[];
      json['payment_methods'].forEach((v) {
        paymentMethods!.add(new PaymentMethods.fromJson(v));
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
          this.paymentMethods!.map((v) => v.toJson()).toList();
    }
    data['zero_interest_installments'] = this.zeroInterestInstallments;
    return data;
  }
}
