import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_info/homepage.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B131E),
      body: Column(children: [
        const SizedBox(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              "Weather Info",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: const Color(0xff202B3B),
              borderRadius: BorderRadius.circular(30)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Please check your internet connection or you might typed city name incorrectly.",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        GestureDetector(
          onTap: () {
            ref.read(locationProvider.notifier).state = "Dhaka";
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffcfd4dd),
            ),
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50,
            child: const Center(
              child: Text(
                "Try Again",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
