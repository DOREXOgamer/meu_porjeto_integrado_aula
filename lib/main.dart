import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/core/theme/app_theme.dart';
import 'package:meu_projeto_integrador/screens/home_screen.dart';
import 'package:meu_projeto_integrador/screens/detail_screen.dart';
import 'package:meu_projeto_integrador/screens/item_list_screen.dart';
import 'package:meu_projeto_integrador/screens/gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Integrador',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/items': (context) => const ItemListScreen(),
        '/gallery': (context) => const GalleryScreen(),
        '/details': (context) => const DetailScreen(
              itemId: 0,
              itemName: '',
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
