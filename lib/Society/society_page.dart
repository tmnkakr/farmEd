import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocietyPage extends StatefulWidget {
  SocietyPage({super.key});

  @override
  State<SocietyPage> createState() => _SocietyPageState();
}

class _SocietyPageState extends State<SocietyPage> {
  List<String> myList = [];
  late SharedPreferences prefs;

  @override
  void initState() {
    intili();
    super.initState();
  }

  intili() async {
    prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('myListKey');
    setState(() {
      myList = jsonString?.split(',') ?? [];
    });
    print('len ' + myList.length.toString());
  }

  void addPost(BuildContext context) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Please Write your Content here...',
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                String? jsonString = prefs.getString('myListKey');
                myList = jsonString?.split(',') ?? [];
                setState(() {
                  myList.add(controller.text.trim());
                });
                jsonString = myList.join(',');
                prefs.setString('myListKey', jsonString);

                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(myList.length);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            myList.length,
            (index) => Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    myList[index],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addPost(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class LargeCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const LargeCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [Text("data")],
      ),
    );
  }
}
