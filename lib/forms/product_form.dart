import 'package:flutter/material.dart';
import 'package:products_login/config/index.dart';
import 'package:products_login/providers/product_form_provider.dart';
import 'package:provider/provider.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductFormProvider>(context);
    final product = productProvider.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: productProvider.key,
        child: Column(
          children: [
            TextFormField(
              initialValue: product.name,
              onChanged: (val) => product.name = val,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'El nombre es obligatorio';
                }
                return null;
              },
              decoration: InputDecorations.authInputDecoration(
                  label: 'Nombre', hintText: 'Nombre del producto'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: product.price.toString(),
              onChanged: (val) {
                double.tryParse(val) != null
                    ? product.price = double.parse(val)
                    : product.price = 0;
              },
              validator: (val) {
                if (val == null || val.isEmpty) return 'Precio es obligatorio';
                final numb =
                    double.tryParse(val) != null ? double.parse(val) : 0;
                if (numb == 0) product.price = 0;
                if (numb <= 0) return 'Debe ser mayor a 0';
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  label: 'Precio', hintText: '\$ MXN'),
            ),
            const SizedBox(height: 20),
            SwitchListTile.adaptive(
              onChanged: (bool value) {
                product.available = value;
              },
              value: product.available,
              title: const Text('Disponible'),
            )
          ],
        ),
      ),
    );
  }
}
