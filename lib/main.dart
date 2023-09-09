import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_info/homepage.dart';

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
      home: const SafeArea(child: TestPage()),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}

// class TestSection extends ConsumerWidget {
//   const TestSection({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final weather = ref.watch(weatherData("Dhaka"));
//     return weather.when(data: (data) {
//       return Text(data.name.toString());
//     }, error: (error, _) {
//       return Text(error.toString());
//     }, loading: () {
//       return CircularProgressIndicator();
//     });
//   }
// }
