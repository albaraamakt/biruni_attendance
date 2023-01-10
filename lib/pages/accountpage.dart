import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
          title: Text('Account'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(29, 79, 145, 1)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Ad Soyad'),
                Text('Ogrenci ismi')
              ],
            ),
            Row(
              children: [
                Text('Fakulte'),
                Text('Ogrenci fakultesi')
              ],
            ),
            Row(children: [
              Text('Bolum'),
              Text('Ogrenci bolumu')
            ],)
          ],
        ),
      ),
    );
  }
}
