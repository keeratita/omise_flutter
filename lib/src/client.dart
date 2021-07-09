import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './exception.dart';

class Client {
  late final String _publicKey;
  late final String _apiVersion;
  late String version;

  Client(this._publicKey, this._apiVersion);

  http.Client httpClient = new http.Client();

  /// Makes a post request to [host] by following [path] with [data]
  Future<Map<String, dynamic>> post(String host, final List<String> path,
      {final dynamic data}) async {
    final uri = createUri(host, path);
    final headers = createHeader();
    final response = await httpClient
        .post(uri, body: json.encode(data), headers: headers)
        .timeout(const Duration(seconds: 60), onTimeout: () {
      throw TimeoutException('The connection has timed out, Please try again!');
    });
    return processResponse(response);
  }

  /// Makes a get request from [host] by following [path]
  Future<Map<String, dynamic>> get(String host, final List<String> path) async {
    final uri = createUri(host, path);
    final headers = createHeader();
    final response = await httpClient
        .get(uri, headers: headers)
        .timeout(const Duration(seconds: 60), onTimeout: () {
      throw TimeoutException('The connection has timed out, Please try again!');
    });
    return processResponse(response);
  }

  /// Create a Uri from [host] and [path]
  Uri createUri(String host, List<String> path) {
    final uri = Uri(scheme: 'https', host: host, pathSegments: path);
    return uri;
  }

  /// Build a basic authentication header
  String basicAuth() {
    return 'Basic ' + base64Encode(utf8.encode('$_publicKey:'));
  }

  /// Create a header
  Map<String, String> createHeader() {
    final headers = <String, String>{
      'Authorization': this.basicAuth(),
      'Omise-Version': _apiVersion,
      'Cache-Control': 'no-cache',
      'Content-Type': 'application/json',
      'user-agent': 'co.keerati.omise_flutter/$version'
    };
    return headers;
  }

  /// Deserialize JSON from [response]
  Map<String, dynamic> processResponse(http.Response response) {
    final responseStatusCode = response.statusCode;

    Map<String, dynamic>? map;
    try {
      map = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      // Throwing later.
    }
    if (responseStatusCode != 200) {
      if (map == null || map['object'] == null) {
        throw UnknownTypeException(
            'The status code returned was $responseStatusCode but no error was provided.');
      }

      if (map['code'] != null && map['message'] != null) {
        throw InvalidRequestException(
            map['code'].toString(), map['message'].toString());
      } else {
        throw UnknownTypeException(
            'The status code returned was $responseStatusCode but the error type is unknown.');
      }
    }
    if (map == null) {
      throw UnknownTypeException(
          'The JSON returned was unparsable (${response.body}).');
    }
    return map;
  }
}
