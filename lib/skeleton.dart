import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonScreen extends StatelessWidget {
  const SkeletonScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        Center(
            child: SkeletonAnimation(
          shimmerColor: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          shimmerDuration: 1000,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: const Color(0xff202B3B),
                borderRadius: BorderRadius.circular(30)),
            child: const Center(child: Text("")),
          ),
        ))
      ]),
    );
  }
}
