import 'package:farmer_quiz_app/home_page/learn1.dart';
import 'package:farmer_quiz_app/home_page/learn2.dart';
import 'package:flutter/material.dart';

class LearningList extends StatelessWidget {
  const LearningList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn about Crops'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Learning1()),
              );
            },
            child: ListCard(
                imagePath: 'assets/images/farmerLearning.png',
                title: 'How to Put Crops in field?'),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Learning2()),
              );
            },
            child: ListCard(
                imagePath: 'assets/images/farmerLearning.png',
                title: 'Which Crop is good this Season?'),
          ),
        ],
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const ListCard({super.key, required this.imagePath, required this.title});

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
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
