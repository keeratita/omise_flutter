import '../client.dart';

class Resource {
  final String publicKey;
  final String apiVersion;
  final Client client;

  Resource(this.client, this.publicKey, this.apiVersion);
}
