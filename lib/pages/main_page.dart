import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Selamat Datang'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Image.network(
                'https://th.bing.com/th/id/OIP.esRkpbn307Lvjenu3rfxQwAAAA?rs=1&pid=ImgDetMain', // URL logo
                height: 250, 
                fit: BoxFit.contain, 
              ),
            ),
            SizedBox(height: 10),

            Text(
              'Selamat Datang di Konsultan Konstruksi',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
            SizedBox(height: 10),

            // Subtext
            Text(
              'Kami siap membantu proyek konstruksi Anda',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14, 
                color: Colors.blueGrey[500],
              ),
            ),
            SizedBox(height: 30), 

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
