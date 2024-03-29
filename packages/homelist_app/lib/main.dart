import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homelist/app.dart';
import 'package:homelist/application/core/preferences.dart';
import 'package:homelist/getit_config.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await PreferencesController.initialise();

  setupGetIt();
  runApp(const HomeList());
}

// Passy
// admin@homelist.com
// admin
