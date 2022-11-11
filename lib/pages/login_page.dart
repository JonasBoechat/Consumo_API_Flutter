import 'package:consumo_api/componentes/login/custom_login_button_component.dart';
import 'package:consumo_api/controllers/login_controler.dart';
import 'package:consumo_api/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(28),
        color: const Color.fromARGB(255, 199, 213, 243),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: MediaQuery.of(context).size.height * 0.2,
            ),
            CustomTextFieldWidget(
              onChanged: _controller.setLogin,
              label: 'Login',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFieldWidget(
              onChanged: _controller.setPass,
              label: 'Senha',
              obscureText: true,
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomLoginButtonComponent(
              loginController: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
