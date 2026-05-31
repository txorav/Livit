import 'package:flutter/material.dart';

import 'features/editor/editor_page.dart';

class LivitApp extends StatelessWidget {
  const LivitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const EditorPage(),
    );
  }
}
