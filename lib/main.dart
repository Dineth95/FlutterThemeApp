import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_driver/presentation/homepage.dart';
import 'package:my_driver/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Driver',
      theme: theme,
      home: const HomePage(),
    );
  }
}

