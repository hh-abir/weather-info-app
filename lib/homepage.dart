import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_info/errorpage.dart';
import 'package:weather_info/provider/weather_provider.dart';
import 'package:intl/intl.dart';
import 'package:weather_info/skeleton.dart';

final locationProvider = StateProvider<String>((ref) => 'Dhaka');

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    String userInput = "";
    final location = ref.watch(locationProvider);
    final AsyncValue weather = ref.watch(weatherData(location));
    return weather.when(data: (value) {
      int unixSunrise = value.sys.sunrise;

      DateTime datetimeSurise =
          DateTime.fromMillisecondsSinceEpoch(unixSunrise * 1000);
      String sunrise = DateFormat('HH:mm').format(datetimeSurise);
      int unixSunset = value.sys.sunset;
      DateTime datetimeSunset =
          DateTime.fromMillisecondsSinceEpoch(unixSunset * 1000);
      String sunset = DateFormat('HH:mm').format(datetimeSunset);
      final src = value.weather[0].main.toLowerCase();
      return Scaffold(
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
                      onSubmitted: (value) {
                        if (value.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('City name cannot be empty'),
                          ));
                        } else {
                          ref.read(locationProvider.notifier).state = value;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter city name',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: const Color(0xffcfd4dd),
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
                      if (value.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('City name cannot be empty'),
                        ));
                      } else {
                        ref.read(locationProvider.notifier).state = userInput;
                      }
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: const Color(0xff202B3B),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/$src.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        "${value.main.temp}°C",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        value.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
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
                                text: TextSpan(
                                    style: const TextStyle(fontSize: 13),
                                    children: [
                                      TextSpan(
                                          text: "${value.main.humidity}°C\n"),
                                      const TextSpan(text: "Feels like"),
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
                                text: TextSpan(
                                    style: const TextStyle(fontSize: 13),
                                    children: [
                                      TextSpan(
                                          text:
                                              "   ${value.wind.speed} km\\h\n"),
                                      const TextSpan(text: "   Wind"),
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
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
                          text: TextSpan(
                              style: const TextStyle(fontSize: 13),
                              children: [
                                TextSpan(text: "${value.main.humidity}°C\n"),
                                const TextSpan(text: "Feels like"),
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
                          text: TextSpan(
                              style: const TextStyle(fontSize: 13),
                              children: [
                                TextSpan(
                                    text:
                                        "${(value.main.pressure / 1015.22).toDouble().toStringAsFixed(2)} atm\n"),
                                const TextSpan(text: "Wind"),
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
                          "assets/icons/sunrise.png",
                          height: 50,
                          width: 50,
                        ),
                        RichText(
                          text: TextSpan(
                              style: const TextStyle(fontSize: 13),
                              children: [
                                TextSpan(text: "$sunrise\n"),
                                const TextSpan(text: "Sunrise"),
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
                          "assets/icons/sunset.png",
                          height: 50,
                          width: 50,
                        ),
                        RichText(
                          text: TextSpan(
                              style: const TextStyle(fontSize: 13),
                              children: [
                                TextSpan(text: "$sunset\n"),
                                const TextSpan(text: "Sunset"),
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
                          text: TextSpan(
                              style: const TextStyle(fontSize: 13),
                              children: [
                                TextSpan(text: "${value.main.tempMax}°C\n"),
                                const TextSpan(text: "Max Temp"),
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
                          text: TextSpan(
                              style: const TextStyle(fontSize: 13),
                              children: [
                                TextSpan(text: "${value.main.tempMin}°C\n"),
                                const TextSpan(text: "Min Temp"),
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
      );
    }, error: (error, _) {
      return const ErrorPage();
    }, loading: () {
      return const Center(
        child: SkeletonScreen(),
      );
    });
  }
}
