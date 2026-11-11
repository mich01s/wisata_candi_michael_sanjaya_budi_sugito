import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<SignUpScreen> {
  // TODO: 1. Deklarasi  variabel
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordContorller = TextEditingController();

  String _errorText = '';

  bool _isSignIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Pasang Appbar
      appBar: AppBar(title: Text("Sign Up"),),
      //TODO: 3. Pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                // TODO: 4. Atur mainAxiAlignment dan crossAxisAlignment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20,),
                  // TODO: 5. Pasang TextFormField Nama Pengguna
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Nama Pengguna",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // TODO: 6. Pasang TextFormField Kata Sandi
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _passwordContorller,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        }, 
                        icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility)
                      )
                    ),
                    obscureText: _obscurePassword,
                  ),
                  // TODO: 7. Pasang ElevatedButton Sign In
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: Text("Sign Up")
                  ),
                  // TODO: 8. Pasang Textbutton Sign Up
                  SizedBox(height: 10,),
                  // TextButton(
                  //   onPressed: (){}, 
                  //   child: Text("Belum punya akun? Daftar di sini. ")
                  // ),
                  RichText(text: TextSpan(
                    text: "Belum punya akun",
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Daftar di sini",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16
                        ),
                        recognizer: TapGestureRecognizer()
                        ..onTap = (){},
                      )
                    ]
                  ))
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}