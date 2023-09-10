import 'package:flutter/material.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/developer.jpg",
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Created by"),
            const SizedBox(
              height: 3,
            ),
            const Text(
              "Hasib Hossain Abir",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Android, IOS Devleoper",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back To Home Screen",
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber),
                foregroundColor: MaterialStatePropertyAll(Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
