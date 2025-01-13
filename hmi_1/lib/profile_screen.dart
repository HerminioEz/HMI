import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      userData = data.firstWhere((user) => user['email'] == currentUserEmail,
          orElse: () => {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil del Usuario'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.brown],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: userData.isEmpty
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nombre: ${userData['name'] ?? 'Desconocido'}',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email: ${userData['email'] ?? 'Desconocido'}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
