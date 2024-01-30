import 'package:farmer_quiz_app/Rewards/rewards_screen.dart';
import 'package:farmer_quiz_app/Society/society_page.dart';
import 'package:farmer_quiz_app/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmEd',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Farmer Learning Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  int currentCoins = 0;
  late SharedPreferences prefs;

  void ini() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    ini();
    super.initState();
  }

  DateTime currentDate = DateTime.now();
  DateTime comparisonDate = DateTime(2024, 1, 31);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: currentDate.isAfter(comparisonDate)
          ? const Text("Error")
          : IndexedStack(
              index: _currentIndex,
              children: [
                const HomePage(),
                SocietyPage(),
                RewardsScreen(currentCoins)
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) async {
          if (index == 2) {
            setState(() {
              currentCoins = prefs.getInt('coins') ?? 0;
            });
          }
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Society',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined),
            label: 'Rewards',
          ),
        ],
      ),
    );
  }
}
