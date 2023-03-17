import 'package:flutter/material.dart';
import 'package:products_login/config/index.dart';
import 'package:products_login/providers/login_form_provider.dart';
import 'package:products_login/screens/index.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos',
      initialRoute: 'home',
      theme: CustomTheme.light,
      darkTheme: CustomTheme.dark,
      routes: {
        'home': (_) => const HomeScreen(),
        'login': (_) => const LoginScreen(),
        'product_detail': (_) => const ProductScreen(),
      },
    );
  }
}
