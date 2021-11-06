import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/provider/rick_and_morty_provider.dart';
import 'package:rick_and_morty/router/router.dart';
import 'package:rick_and_morty/services/navigation_service.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RickAndMortyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty',
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: NavigationService.navigatorKey,
      ),
    );
  }
}
