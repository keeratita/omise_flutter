import '../client.dart';
import '../responses.dart';
import './resource.dart';

class TokenResource extends Resource {
  final String host = "vault.omise.co";
  TokenResource(Client client, String publicKey, String apiVersion)
      : super(client, publicKey, apiVersion);

  /// Create a token
  ///
  /// See Omise API documentation for details
  /// https://www.omise.co/tokens-api#create
  ///
  /// ```dart
  /// final token = await omise.token.create("John Doe", "4242424242424242", "12", "2020", "123");
  /// ```
  Future<Token> create(String name, String number, String expirationMonth,
      String expirationYear, String securityCode,
      {String? city,
      String? country,
      String? postalCode,
      String? state,
      String? street1,
      String? street2,
      String? phoneNumber}) async {
    final data = {
      'card': {
        'name': name,
        'number': number,
        'expiration_month': expirationMonth,
        'expiration_year': expirationYear,
        'security_code': securityCode,
        'city': city,
        'country': country,
        'postal_code': postalCode,
        'state': state,
        'street1': street1,
        'street2': street2,
        'phone_number': phoneNumber
      }
    };

    final response = await client.post(host, ['tokens'], data: data);
    return Token.fromJson(response);
  }
}
