import 'package:flutter/material.dart';
import 'package:products_login/config/index.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecorations.authInputDecoration(
                  label: 'Nombre', hintText: 'Nombre del producto'),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  label: 'Precio', hintText: '\$ MXN'),
            ),
            SizedBox(height: 20),
            SwitchListTile.adaptive(
              onChanged: (bool value) {},
              value: true,
              title: Text('Disponible'),
            )
          ],
        ),
      ),
    );
  }
}
