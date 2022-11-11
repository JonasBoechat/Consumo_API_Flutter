import 'package:consumo_api/controllers/login_controler.dart';
import 'package:flutter/material.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;
  const CustomLoginButtonComponent({Key? key, required this.loginController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.inLoader,
      builder: (_, inLoader, __) => inLoader
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                loginController.auth().then((result) {
                  if (result) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Falha ao realizar o Login'),
                      duration: Duration(seconds: 1),
                    ));
                  }
                });
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
    );
  }
}
