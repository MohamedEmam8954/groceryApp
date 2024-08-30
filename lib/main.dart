import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/app/groceryapp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const GroceryApp());
  });
}
