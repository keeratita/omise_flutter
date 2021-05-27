class PaymentMethods {
  String? object;
  String? name;
  List<String>? currencies;
  List<String>? cardBrands;
  List<int>? installmentTerms;

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
