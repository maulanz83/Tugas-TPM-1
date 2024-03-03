import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'home.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = false;

  List accounts = [];

  // ignore: non_constant_identifier_names
  Future<void> _ReadAccountJson() async {
    final String accountJson = await rootBundle.loadString('accounts.json');
    final data = await json.decode(accountJson);
    setState(() {
      accounts = data;
    });
    // for (var acc in accounts) {
    //   print(acc);
    // }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          // leading: Icon(Icons.menu),
          title: const Text('Login Screen', style: TextStyle(color: Colors.white)),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _flutterLogo(),
          _formContainer(context),
          // ElevatedButton(onPressed: () {
          //   ();
          // }, child: const Text('Read Account JSON')),
          
        ],
      ),
    ));
  }


  Widget _flutterLogo() {
    return const FlutterLogo(size: 100);
  }

  Widget _usernametextField() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          username = value;
        });
      },
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Enter your username',
        prefixIcon: const Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
    );
  }

  Widget _passwordtextField() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        prefixIcon: const Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
    );
  }

  Widget _loginButton(context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextButton(
        onPressed: () async {
          await _ReadAccountJson();
          String messagenotif = '';

          for (var acc in accounts) {
            if (acc['User'] == username && acc['Password'] == password) {
              setState(() {
                isLoginSuccess = true;
                messagenotif = 'Login Success';
              });
              break;
            } else {
              setState(() {
                isLoginSuccess = false;
                messagenotif = 'Login Failed';
              });
            }
          }

          // if (username == 'admin' && password == 'admin') {
          //   setState(() {
          //     isLoginSuccess = true;
          //     messagenotif = 'Login Success';
          //   });
          // } else {
          //   setState(() {
          //     isLoginSuccess = false;
          //     messagenotif = 'Login Failed';
          //   });
          // }

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(messagenotif),
            duration: const Duration(seconds: 3),
          ));

          if (isLoginSuccess) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return home_page();
              }));
          }
        },
        child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 25),),
      ),
    );
  }

  Widget _registerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(onPressed: (){}, child: const Text('Register'))
      ],
    );
  }

  Widget _formContainer(context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          _usernametextField(),

          const SizedBox(height: 20,),

          _passwordtextField(),
          
          const SizedBox(height: 20,),

          _loginButton(context),

          const SizedBox(height: 20,),
          
          _registerButton(),
        ],
      ),
    );
  }
}