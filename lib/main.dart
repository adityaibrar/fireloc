import 'package:flutter/material.dart';
import 'package:ujikom/dashboard.dart';
import 'package:ujikom/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ujikom/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firebase_Auth().AuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(primaryColor: Colors.blue),
            home: snapshot.data != null ? Dashboard() : Login(),
          );
        }
        return Loading();
      },
    );
  }
}

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
