// settings.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account Settings'),
            subtitle: Text('Manage your account information'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification Settings'),
            subtitle: Text('Manage your notifications preferences'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy Settings'),
            subtitle: Text('Manage your privacy preferences'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Background Color'),
            subtitle: Text('Change background color'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ColorChangerScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  @override
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color _backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _loadBackgroundColor();
  }

  // Load background color from SharedPreferences
  Future<void> _loadBackgroundColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? colorValue = prefs.getInt('background_color');
    if (colorValue != null) {
      setState(() {
        _backgroundColor = Color(colorValue);
      });
    }
  }

  // Save background color to SharedPreferences
  Future<void> _saveBackgroundColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('background_color', color.value);
  }

  // Change background color
  void _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
    _saveBackgroundColor(color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text("Change Background Color"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a background color:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ColorButton(color: Colors.red, onPressed: () => _changeBackgroundColor(Colors.red)),
                ColorButton(color: Colors.green, onPressed: () => _changeBackgroundColor(Colors.green)),
                ColorButton(color: Colors.blue, onPressed: () => _changeBackgroundColor(Colors.blue)),
                ColorButton(color: Colors.yellow, onPressed: () => _changeBackgroundColor(Colors.yellow)),
                ColorButton(color: Colors.orange, onPressed: () => _changeBackgroundColor(Colors.orange)),
                ColorButton(color: Colors.purple, onPressed: () => _changeBackgroundColor(Colors.purple)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Color button widget
class ColorButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  ColorButton({required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
      child: Container(),
    );
  }
}
