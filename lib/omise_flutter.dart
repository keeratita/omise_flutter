library omise_flutter;

import './src/resources/token.dart';
import './src/resources/source.dart';
import './src/resources/capability.dart';
import './src/client.dart';

const String _VERSION = "0.1.2";

/// OmiseFlutter
class OmiseFlutter {
  // Omise API version
  final String apiVersion;
  // Omise Public Key
  final String publicKey;

  // HTTP Client
  Client _client;
  Client get client {
    return _client;
  }

  // Resources
  TokenResource token;
  SourceResource source;
  CapabilityResource capability;

  // Constructor
  OmiseFlutter(this.publicKey, [this.apiVersion = '2019-05-29']) {
    //
    _client = new Client(publicKey, apiVersion);
    _client.version = _VERSION;
    _initResources();
  }

  _initResources() {
    token = new TokenResource(_client, publicKey, apiVersion);
    source = new SourceResource(_client, publicKey, apiVersion);
    capability = new CapabilityResource(_client, publicKey, apiVersion);
  }
}
