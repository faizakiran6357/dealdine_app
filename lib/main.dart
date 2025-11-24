import 'package:flutter/material.dart';
import 'app/di/di.dart' as di;
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.initDependencies();

  runApp(const DealDineApp());
}
