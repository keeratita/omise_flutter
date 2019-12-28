import 'package:omise_flutter/omise_flutter.dart';

/// Get your public key on Omise Dashboard
const publicKey = "YOUR_PUBLIC_KEY";
OmiseFlutter omise = OmiseFlutter(publicKey);

/// OmiseFlutter provides direct access to Omise REST API
exampleCreateToken() async {
  // See Omise API documentation for details
  // https://www.omise.co/tokens-api
  final token = await omise.token
      .create("John Doe", "4242424242424242", "12", "2020", "123");

  if (token.card.securityCodeCheck == true) {
    // Send a token back to your server
  } else {
    // Show error: Invalid CVV or the card can't be used
  }
}

exampleCreateSource() async {
  // See Omise API documentation for details
  // https://www.omise.co/sources-api
  final source =
      await omise.source.create(10000, "thb", "internet_banking_bay");

  print(source.id);
}

exampleRetrieveCapability() async {
  // See Omise API documentation for details
  // https://www.omise.co/capability-api
  final capability = await omise.capability.retrieve();

  print(capability.paymentMethods);
}
