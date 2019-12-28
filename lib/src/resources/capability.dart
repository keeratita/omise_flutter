import '../responses.dart';
import './resource.dart';
import '../client.dart';

class CapabilityResource extends Resource {
  final String host = "api.omise.co";
  CapabilityResource(Client client, String publicKey, String apiVersion)
      : super(client, publicKey, apiVersion);

  Future<Capability> retrieve() async {
    final response = await client.get(host, ['capability']);
    return Capability.fromJson(response);
  }
}
