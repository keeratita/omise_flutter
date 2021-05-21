import 'package:flutter_test/flutter_test.dart';
import 'package:omise_flutter/omise_flutter.dart';
import './mock//test_client.dart';

final String publicKey = "pkey_test_xxxxxxxxxxx";

void main() {
  TestClient? client;
  OmiseFlutter? omise;

  setUp(() {
    // setup mock
    client = new TestClient();
    omise = OmiseFlutter(publicKey);
  });

  tearDown(() {
    client = null;
    omise = null;
  });

  group("Initiate instance", () {
    test('Create an instance with publicKey', () {
      expect(omise!.publicKey, publicKey);
      expect(omise!.apiVersion, "2019-05-29");
    });
  });

  group("Token", () {
    test('Create a token', () async {
      omise!.client.httpClient = client!.mockCreateTokenResponse();
      final response = await omise!.token
          .create("John Doe", "4242424242424242", "12", "2020", "123");
      expect(response.object, "token");
    });
  });

  group("Source", () {
    test('Create a source', () async {
      omise!.client.httpClient = client!.mockCreateSourceResponse();
      final response =
          await omise!.source.create(10000, "thb", "internet_banking_bay");
      expect(response.object, "source");
    });
  });

  group("Capability", () {
    test('Retrieve a capability', () async {
      omise!.client.httpClient = client!.mockGetCapabilityResponse();
      final response = await omise!.capability.retrieve();
      expect(response.object, "capability");
    });
  });
}
