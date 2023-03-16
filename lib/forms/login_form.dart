import 'package:flutter/material.dart';
import 'package:products_login/config/index.dart';
import 'package:products_login/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: loginFormProvider.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              enabled: !loginFormProvider.isLoading,
              onChanged: (val) => loginFormProvider.email = val,
              autocorrect: false,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.n,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Este no es un email válido';
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                label: 'Email',
                hintText: 'correo@mail.com',
                iconData: Icons.alternate_email_sharp,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              enabled: !loginFormProvider.isLoading,
              onChanged: (val) => loginFormProvider.password = val,
              obscureText: true,
              decoration: InputDecorations.authInputDecoration(
                iconData: Icons.lock_sharp,
                hintText: '****',
                label: 'Contraseña',
              ),
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'La contraseña debe tener al menos 6 caracteres';
              },
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: loginFormProvider.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final res = loginFormProvider.validateForm();
                      if (!res) return;
                      loginFormProvider.isLoading = true;
                      await Future.delayed(const Duration(seconds: 2));
                      loginFormProvider.isLoading = false;
                      Navigator.pushReplacementNamed(context, 'home');
                    },
              color: CustomTheme.primaryColor,
              disabledColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  loginFormProvider.isLoading ? 'Espere...' : 'Ingresar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
