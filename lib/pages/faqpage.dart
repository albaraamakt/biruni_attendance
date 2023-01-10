import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('FAQ'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(29, 79, 145, 1)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.info),
                Text('How many times can I reset the device information?')
              ],
            ),
            Row(
              children: [
                Icon(Icons.info),
                Text('Why I am getting a device verification error?')
              ],
            ),
            Row(children: [
              Icon(Icons.info),
                Text("Why I can't login even though my information is correct?")
            ],)
          ],
        ),
      ),
    );
  }
}