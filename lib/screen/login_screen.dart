import 'package:academics/model/user/user_local.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserLocal userLocal = UserLocal();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const Image(
            image: AssetImage('./assets/images/home.png'),
          ),
          Text(
            'Condomínio',
            style: TextStyle(
              color: Colors.amber.shade300,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            color: Colors.grey.shade200,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    initialValue: "",
                    onSaved: (text) => text,
                    decoration: const InputDecoration(
                      hintText: 'Email...',
                    ),
                    validator: (value) {
                      //
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
