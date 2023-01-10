import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'accountpage.dart';
import 'faqpage.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  String _scanBarcode = 'Unknown';

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBarView(children: [
        Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FaqPage(),
                          ));
                        },
                        child: Icon(Icons.question_mark_rounded),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AccountPage(),
                          ));
                        },
                        child: Icon(Icons.account_circle),
                      ),
                    )
                  ],
                ),
                Text(
                  'Ogrenci ismi'.toUpperCase(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Ogrencinin okudugu bolum',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromRGBO(29, 79, 145, 1),
            centerTitle: true,
            toolbarHeight: 140,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    scanQR();
                  },
                  child: Column(
                    children: const [
                      Icon(
                        IconData(0xe4f7, fontFamily: 'MaterialIcons'),
                        size: 140,
                        color: Color.fromRGBO(29, 79, 145, 1),
                      ),
                      Text(
                        'Scan QR Code',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(29, 79, 145, 1)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: TabBar(
              indicatorColor: Color.fromARGB(0, 0, 0, 0),
              labelColor: Color.fromRGBO(137, 137, 137, 1),
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.qr_code,
                  ),
                  text: 'QR Scan',
                ),
                Tab(
                    icon: Icon(
                      Icons.history,
                    ),
                    text: 'History')
              ]),
        ),
        Scaffold(
            appBar: AppBar(
              title: Text(
                'History',
                style: TextStyle(fontSize: 24),
              ),
              leading: Icon(IconData(0xe3dc, fontFamily: 'MaterialIcons')),
              actions: [
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: Text("Are you sure?"),
                              content: Text("Record Will be deleted..."),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      print("Deleted");
                                      Navigator.pop(context);
                                    },
                                    child: Text("Delete")),
                                ElevatedButton(
                                    onPressed: () {
                                      print("Cancelled");
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel"))
                              ],
                            );
                          }));
                    },
                    child: Icon(Icons.delete))
              ],
              backgroundColor: Color.fromRGBO(29, 79, 145, 1),
              centerTitle: true,
              toolbarHeight: 140,
            ),
            body: Center(
              child: Text('No Records Found'),
            ),
            bottomNavigationBar: TabBar(
                indicatorColor: Color.fromARGB(0, 0, 0, 0),
                labelColor: Color.fromRGBO(137, 137, 137, 1),
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.qr_code,
                    ),
                    text: 'QR Scan',
                  ),
                  Tab(
                      icon: Icon(
                        Icons.history,
                      ),
                      text: 'History')
                ]))
      ]),
    );
  }
}
