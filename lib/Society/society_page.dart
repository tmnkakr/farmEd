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
          title: const Text('Add New Message'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Please Write here...',
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
                sendPost(context, 'Share');
              },
              child: Text('Share'),
            ),
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
                sendPost(context, 'Send');
              },
              child: Text('Post'),
            ),
          ],
        );
      },
    );
  }

  void sendPost(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message $text'),
          content: Text('Successfully $text your Message...'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('ok')),
          ],
        );
      },
    );
  }

  void deletePost(String text) {
    String? jsonString = prefs.getString('myListKey');
    myList = jsonString?.split(',') ?? [];
    setState(() {
      myList.remove(text);
      // myList.add(controller.text.trim());
    });
    jsonString = myList.join(',');
    prefs.setString('myListKey', jsonString);
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
                  child: Row(
                    children: [
                      Text(
                        myList[index],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            deletePost(myList[index]);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red))
                    ],
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
