import 'dart:async';
import 'package:draw/draw.dart';
import 'config.dart';

Future<void> main() async {
  // Create the `Reddit` instance and authenticated
  Reddit reddit = await Reddit.createScriptInstance(
    clientId: CLIENT_ID,
    clientSecret: SECRET,
    userAgent: AGENTNAME,
  );
}
