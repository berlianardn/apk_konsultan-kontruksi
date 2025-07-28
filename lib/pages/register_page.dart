import 'package:flutter/material.dart';
import 'home_page.dart'; 

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<RegisterPage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  void _register() {
    String fullname = _fullnameController.text;
    String username = _usernameController.text;
    String pass = _passwordController.text;
    String cpw = _confirmPassController.text;

    if (fullname.isEmpty || username.isEmpty || pass.isEmpty || cpw.isEmpty) {
      _showErrorDialog("Semua kolom harus diisi!");
      return;
    }

    if (pass == cpw) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(username: username)),
      );
    } else {
      _showErrorDialog("Password dan Confirm Password tidak cocok!");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://th.bing.com/th/id/OIP.esRkpbn307Lvjenu3rfxQwAAAA?rs=1&pid=ImgDetMain', // URL logo
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _fullnameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Full Name',
                hintText: 'Masukkan Nama Lengkap Anda',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText: 'Username',
                hintText: 'Masukkan Username Anda',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
                hintText: 'Masukkan Password Anda',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _confirmPassController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: 'Confirm Password',
                hintText: 'Masukkan Ulang Password Anda',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _register,
              child: const Text('Register'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50), 
                backgroundColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
