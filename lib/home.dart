import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'emailSignup.dart';
import 'diet.dart';
import 'progress.dart';

class Home extends StatefulWidget {
  final String? uid;

  Home({this.uid});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overview"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => EmailSignUp()),
                    (Route<dynamic> route) => false);
              });
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text('Progress'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProgressScreen()));
              },
              trailing: const Icon(Icons.accessibility),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Diet / Nutrition'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NutritionScreen()));
              },
              trailing: const Icon(Icons.coffee),
            ),
          ),
        ],
      ),
    );
  }
}
