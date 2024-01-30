import 'package:flutter/material.dart';

class Learning1 extends StatefulWidget {
  Learning1({super.key});

  @override
  State<Learning1> createState() => _Learning1State();
}

class _Learning1State extends State<Learning1> {
  int currQs = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('How to Put Crops in field?'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset('assets/images/crop1.png'),
              Text(
                  '\n\nDear Farmers,\n\nCrop rotation is a straightforward and effective farming practice that can bring numerous benefits to your fields. Here\'s a short guide to help you understand and implement crop rotation on your farm.'),
              Text(
                '\nWhat is Crop Rotation?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                  'Crop rotation is a farming method where different crops are planted in the same area over a sequence of seasons. This practice helps break the cycle of pests and diseases, enhances soil fertility, and promotes sustainable agriculture.\n\n'),
              Image.asset('assets/images/crop2.png'),
              Text(
                '\nEasy Steps to Start Crop Rotation:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Understand Crop Families: Group crops based on their families (e.g., legumes, brassicas, grains) as plants within the same family often share similar pests and diseases.',
              ),
              Text(
                '\nPlan Your Rotation:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                  'Create a simple plan for the upcoming seasons, rotating crops within the designated family groups.'),
              Text(
                '\nInclude Cover Crops:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                  'Integrate cover crops like legumes or grasses in your rotation to add organic matter and enhance soil structure.'),
              Text(
                '\nObserve Local Climate:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                  'Consider local climate patterns and choose crops that suit each season\'s conditions.'),
              Text(
                '\nRecord Keeping:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                  'Keep track of your crop rotation plan for future reference, noting any issues or successes.\n\n'),
            ]),
          ),
        ));
  }
}
