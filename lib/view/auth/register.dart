import 'package:flutter/material.dart';
import 'package:network/controller/auth_controller.dart';
import 'package:network/model/users.dart';
import 'package:provider/provider.dart';

import '../../controller/api-provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();

  String _confirmPassword = '';
  bool _termsAccepted = false;

  void _register() {
    if (_formKey.currentState!.validate()) {

         Provider.of<ApiProvider>(context,listen: false).registerWebUsers({
           "name": nameController.text,
           "email": emailController.text,
           "password": passController.text,
         });
         print('Registered successfully!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                "assets/images/logo.jpeg",
                fit: BoxFit.contain,
              ),
            ),

            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              // onSaved: (value) => nameController.text = value!,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) => emailController.text = value!,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: passController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }
                return null;
              },
              onSaved: (value) => passController.text = value!,
            ),
            const SizedBox(height: 16.0),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: 'Confirm Password',
            //     border: OutlineInputBorder(),
            //   ),
            //   obscureText: true,
            //   validator: (value) {
            //     if (value != passController.text) {
            //       return 'Passwords do not match';
            //     }
            //     return null;
            //   },
            //   onSaved: (value) => passController.text = value!,
            // ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: _termsAccepted,
                  onChanged: (value) {
                    setState(() {
                      _termsAccepted = value!;
                    });
                  },
                ),
                const Text('I accept the terms and conditions'),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _register,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                ),
              ),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}