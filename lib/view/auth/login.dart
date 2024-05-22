import 'package:flutter/material.dart';
import 'package:network/controller/api-provider.dart';
import 'package:network/view/dashbord.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController passController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  bool errorMessage=false;
  String errormessage='Invalid email or password';


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(
          height: 50,
        ),
        body()

      ],
    );
  }

  Widget body(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Background image
        Column(
          children: [
            const Text(
              "Welcome to DevOps Group 2",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 400,
              width: 600,
              child: Image.asset(
                "assets/images/background.PNG",
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),

        const SizedBox(
          width: 150,
        ),
        // Login card
        Form(
          key: _formKey,
          child: Center(
            child: Container(

              width: 320,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                // color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: passController,
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(Colors.black)
                    ),
                    onPressed: () async {

                      if (_formKey.currentState!.validate()) {
                         Map<String,dynamic>output=await Provider.of<ApiProvider>(context,listen: false).loginUser(
                         emailController.text, passController.text
                         );
                         if(output["auth"]==true){
                           Navigator.pushReplacementNamed(context, DashBord.routeName);
                         }else{
                           setState(() {
                             errorMessage=true;
                           });
                         }

                        }


                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 25,),
                  errorMessage?Text(errormessage):const SizedBox(),


                ],
              ),
            ),
          ),
        ),
      ],
    );

  }
}
