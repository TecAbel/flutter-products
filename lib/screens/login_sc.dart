import 'package:flutter/material.dart';
import 'package:products_login/config/index.dart';
import 'package:products_login/forms/index.dart';
import 'package:products_login/widgets/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LoginBackGround(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 200, child: null),
                  CardContainer(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'Ingreso',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 30),
                        const LoginForm(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Crear una nueva cuenta',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomTheme.primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
