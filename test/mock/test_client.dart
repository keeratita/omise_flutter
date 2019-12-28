import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';
import './mock_response.dart';

class TestClient {
  MockClient mockCreateTokenResponse() {
    return MockClient((http.Request request) async {
      return http.Response(json.encode(fakeCreateTokenResponse), 200);
    });
  }

  MockClient mockCreateSourceResponse() {
    return MockClient((http.Request request) async {
      return http.Response(json.encode(fakeCreateSourceResponse), 200);
    });
  }

  MockClient mockGetCapabilityResponse() {
    return MockClient((http.Request request) async {
      return http.Response(json.encode(fakeGetCapabilityResponse), 200);
    });
  }
}
