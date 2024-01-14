import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const UserCardApp());
}

class UserCardApp extends StatelessWidget {
  const UserCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Card App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserCardScreen(),
    );
  }
}

class UserCardScreen extends StatefulWidget {
  const UserCardScreen({super.key});

  @override
  _UserCardScreenState createState() => _UserCardScreenState();
}


class _UserCardScreenState extends State<UserCardScreen> {
  final TextEditingController _usernameController = TextEditingController();
  dynamic _userData;
  String _error = '';

  Future<void> _getUserData() async {
    final username = _usernameController.text.trim();
    if (username.isEmpty) {
      setState(() {
        _error = 'Please enter a GitHub username.';
        _userData = null;
      });
    } else {
      try {
        final response = await http.get(Uri.parse('https://api.github.com/users/$username'));
        final data = json.decode(response.body);
        setState(() {
          _userData = data;
          _error = '';
        });
      } catch (error) {
        setState(() {
          _error = 'Error fetching user data. Please try again.';
          _userData = null;
        });
        print('Error fetching user data: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Card App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter GitHub Username:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: 'e.g., progaurab',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _getUserData,
              child: const Text('Get User Data'),
            ),
            const SizedBox(height: 16.0),
            if (_error.isNotEmpty)
              Text(
                _error,
                style: const TextStyle(color: Colors.red),
              ),
            if (_userData != null)
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(_userData['avatar_url']),
                        radius: 60.0,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        _userData['name'] ?? 'N/A',
                        style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: <Widget>[
                          const Text(
                            'Location: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_userData['location'] ?? 'N/A'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text(
                            'Company: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_userData['company'] ?? 'N/A'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text(
                            'Bio: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Flexible(
                            child: Text(_userData['bio'] ?? 'N/A'),
                          ),
                        ],
                      ),
                      if (_userData['blog'] != null)
                        Column(
                          children: <Widget>[
                            const SizedBox(height: 16.0),
                            Row(
                              children: <Widget>[
                                const Text(
                                  'Blog: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                  child: Text(_userData['blog']),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }
}
