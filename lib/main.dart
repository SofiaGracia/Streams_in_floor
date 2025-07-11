import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/providers/database.dart';
import 'package:streams_in_floor/presentation/screens/teacher_list.dart';

import 'data/datasources/db/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = await $FloorAppDatabase
      .databaseBuilder('database.db')
      .build();

  runApp(
    ProviderScope(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: TeacherListScreen(),
    );
  }
}
