import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Info',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    String userInput = '';
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0B131E),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.68,
                    child: TextField(
                      onChanged: (value) {
                        userInput = value;
                      },
                      onSubmitted: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Enter city name',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true, // Set to true to enable background color
                        fillColor: const Color(
                            0xffcfd4dd), // Change background color here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(16.0),
                      ),
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(
                        content: Text('You Typed $userInput'),
                        duration: const Duration(seconds: 3),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffcfd4dd),
                      ),
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: 50,
                      child: Image.asset(
                        "assets/icons/search.png",
                        width: 45,
                        height: 45,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: const Color(0xff202B3B),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/clouds.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      const Text(
                        "25°C",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const Text(
                        "New York",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/icons/temp.png",
                                height: 50,
                                width: 50,
                              ),
                              RichText(
                                text: const TextSpan(
                                    style: TextStyle(fontSize: 13),
                                    children: [
                                      TextSpan(text: "25.79°C\n"),
                                      TextSpan(text: "Feels like"),
                                    ]),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/icons/wind.png",
                                height: 50,
                                width: 50,
                              ),
                              RichText(
                                text: const TextSpan(
                                    style: TextStyle(fontSize: 13),
                                    children: [
                                      TextSpan(text: "   3.6 km\\h\n"),
                                      TextSpan(text: "   Wind"),
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff202B3B),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/icons/humidity.png",
                          height: 50,
                          width: 50,
                        ),
                        RichText(
                          text: const TextSpan(
                              style: TextStyle(fontSize: 13),
                              children: [
                                TextSpan(text: "25.79°C\n"),
                                TextSpan(text: "Feels like"),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xff202B3B),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/icons/pressure.png",
                          height: 50,
                          width: 50,
                        ),
                        RichText(
                          text: const TextSpan(
                              style: TextStyle(fontSize: 13),
                              children: [
                                TextSpan(text: "3.6 km\\h\n"),
                                TextSpan(text: "Wind"),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff202B3B),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/icons/sunset.png",
                          height: 50,
                          width: 50,
                        ),
                        RichText(
                          text: const TextSpan(
                              style: TextStyle(fontSize: 13),
                              children: [
                                TextSpan(text: "5:19\n"),
                                TextSpan(text: "Sunset"),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xff202B3B),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/icons/sunrise.png",
                          height: 50,
                          width: 50,
                        ),
                        RichText(
                          text: const TextSpan(
                              style: TextStyle(fontSize: 13),
                              children: [
                                TextSpan(text: "16:28\n"),
                                TextSpan(text: "Sunset"),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff202B3B),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/icons/max.png",
                          height: 50,
                          width: 50,
                        ),
                        RichText(
                          text: const TextSpan(
                              style: TextStyle(fontSize: 13),
                              children: [
                                TextSpan(text: "25.79°C\n"),
                                TextSpan(text: "Feels like"),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xff202B3B),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/icons/min.png",
                          height: 50,
                          width: 50,
                        ),
                        RichText(
                          text: const TextSpan(
                              style: TextStyle(fontSize: 13),
                              children: [
                                TextSpan(text: "3.6 km\\h\n"),
                                TextSpan(text: "Wind"),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
