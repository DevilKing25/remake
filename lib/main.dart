import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';

final appwriteClientProvider = Provider<Client>((ref) {
  Client client = Client();

  final host =
      Platform.isAndroid ? 'http://10.0.2.2/v1' : 'https://localhost:80/v1';

  // TODO: set the Project ID
  client
      .setEndpoint('https://localhost:80/v1')
      .setProject('63826f923746f457f17c')
      .setSelfSigned();
  return client;
});

final appwriteAccountProvider = Provider<Account>((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Account(client);
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
