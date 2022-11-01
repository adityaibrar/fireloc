import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ujikom/services/auth_service.dart';

class DrawwerScreen extends StatefulWidget {
  const DrawwerScreen({Key? key}) : super(key: key);

  @override
  State<DrawwerScreen> createState() => _DrawwerScreenState();
}

class _DrawwerScreenState extends State<DrawwerScreen> {
  Firebase_Auth Auth = Firebase_Auth();
  void logout() async {
    await Auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () => logout(),
          )
        ],
      ),
    );
  }
}
