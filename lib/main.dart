import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/counter_app.dart';
import 'package:protocol_architecture_test/repositories/counter_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        Provider<CounterRepository>(
          create: (_) => CounterRepository(sharedPreferences),
        ),
      ],
      child: CounterApp(),
    ),
  );
}
