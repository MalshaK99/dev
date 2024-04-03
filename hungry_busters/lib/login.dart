import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [Image.asset('assets/logo.png')],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'Enter the Email',
                hintText: ' Email here',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: const TextField(
              decoration: InputDecoration(hintText: 'Enter the password'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 253, 109, 84)),
            child: const Center(
              child: Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 23),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Do you have no account? ',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                Text(
                  'SingUp',
                  style: TextStyle(fontSize: 11, color: Colors.blue),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
