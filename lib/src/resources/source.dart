import '../client.dart';
import '../responses.dart';
import './resource.dart';

class SourceResource extends Resource {
  final String host = "api.omise.co";
  SourceResource(Client client, String publicKey, String apiVersion)
      : super(client, publicKey, apiVersion);

  /// Create a source
  ///
  /// See Omise API documentation for details
  /// https://www.omise.co/sources-api#create
  ///
  /// ```dart
  /// final source = await omise.source.create(10000, "thb", "internet_banking_bay");
  /// ```
  Future<Source> create(int amount, String currency, String type,
      {String? barcode,
      String? email,
      int? installmentTerm,
      String? name,
      String? storeId,
      String? storeName,
      String? terminalId,
      String? phoneNumber,
      bool? zeroInterestInstallments}) async {
    final data = {
      'amount': amount,
      'currency': currency,
      'type': type,
      'barcode': barcode,
      'email': email,
      'installment_term': installmentTerm,
      'name': name,
      'phone_number': phoneNumber,
      'store_id': storeId,
      'store_name': storeName,
      'terminal_id': terminalId,
      'zero_interest_installments': zeroInterestInstallments
    };

    final response = await client.post(host, ['sources'], data: data);
    return Source.fromJson(response);
  }
}
