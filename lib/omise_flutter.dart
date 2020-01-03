library omise_flutter;

import './src/resources/token.dart';
import './src/resources/source.dart';
import './src/resources/capability.dart';
import './src/client.dart';

import 'package:yaml/yaml.dart';
import 'dart:io';
import 'package:path/path.dart';

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
    // read package version
    String pathToYaml =
        join(dirname(Platform.script.toFilePath()), 'pubspec.yaml');

    File f = new File(pathToYaml);
    String yamlText = f.readAsStringSync();
    Map yaml = loadYaml(yamlText);
    String version = yaml['version'];

    //
    _client = new Client(publicKey, apiVersion);
    _client.version = version;
    _initResources();
  }

  _initResources() {
    token = new TokenResource(_client, publicKey, apiVersion);
    source = new SourceResource(_client, publicKey, apiVersion);
    capability = new CapabilityResource(_client, publicKey, apiVersion);
  }
}
