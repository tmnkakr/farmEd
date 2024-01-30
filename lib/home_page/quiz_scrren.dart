import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
int coins = 0;

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currQs = 0;

  @override
  void initState() {
    intili();
    super.initState();
  }

  void intili() async {
    try {
      prefs = await SharedPreferences.getInstance();
      setState(() {
        coins = prefs.getInt('coins') ?? 0;
      });
      print(coins.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  final Map<String, dynamic> Question1 = {
    "question": "What is the correct sequence of steps in planting seeds?",
    "options": [
      {
        "option": "Watering, fertilizing, planting, covering",
        "isCorrect": false
      },
      {"option": "Tilling, watering, planting, weeding", "isCorrect": false},
      {"option": "Planting, watering, weeding, harvesting", "isCorrect": false},
      {"option": "Tilling, planting, watering, covering", "isCorrect": true},
    ],
  };

  final Map<String, dynamic> Question2 = {
    "question": "What is the proper sequence of steps in harvesting a crop ?",
    "options": [
      {"option": "Sorting, cleaning, packing, drying", "isCorrect": false},
      {"option": "Drying, cleaning, sorting, packing", "isCorrect": false},
      {"option": "Cleaning, drying, sorting, packing", "isCorrect": true},
      {"option": "Packing, sorting, drying, cleaning", "isCorrect": false},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Time'),
          // actions: [
          //   Padding(
          //       padding: EdgeInsets.only(right: 40),
          //       child: Text(
          //         coins.toString() + ' Coins',
          //         style: TextStyle(fontSize: 20),
          //       ))
          // ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(children: [
            Ques(qs: Question1),
            const SizedBox(height: 20),
            Ques(qs: Question2)
          ]),
        ));
  }
}

class Ques extends StatelessWidget {
  final Map<String, dynamic> qs;

  const Ques({super.key, required this.qs});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              qs['question'] ?? ' ',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            optionWt(
                ind: 1,
                op: qs['options'][0]['option'],
                isCr: qs['options'][0]['isCorrect']),
            optionWt(
                ind: 2,
                op: qs['options'][1]['option'],
                isCr: qs['options'][1]['isCorrect']),
            optionWt(
                ind: 3,
                op: qs['options'][2]['option'],
                isCr: qs['options'][2]['isCorrect']),
            optionWt(
                ind: 4,
                op: qs['options'][3]['option'],
                isCr: qs['options'][3]['isCorrect'])
          ],
        ),
      ),
    );
  }
}

class optionWt extends StatefulWidget {
  int ind;
  String op;
  bool isCr;
  optionWt(
      {super.key, required this.ind, required this.op, required this.isCr});

  @override
  State<optionWt> createState() => _optionWtState();
}

class _optionWtState extends State<optionWt> {
  Color bc = Colors.grey;
  Color tc = Colors.black;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        int coin = prefs.getInt('coins') ?? 0;
        if (widget.isCr) {
          coins += 5;
          coin += 5;
          prefs.setInt('coins', coins);
          setState(() {
            bc = Colors.green;
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Congrats'),
                content: Text('You won 5 more Coins, check your Reward now!',
                    style: TextStyle(color: Colors.green)),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          setState(() {
            bc = Colors.red;
          });
        }
        tc = Colors.white;
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)), color: bc),
        child: Row(
          children: [
            Text(widget.ind.toString() + '.  '),
            Text(
              widget.op,
              style: TextStyle(fontSize: 16, color: tc),
            ),
          ],
        ),
      ),
    );
  }
}
