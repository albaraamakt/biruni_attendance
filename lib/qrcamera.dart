// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// class QrCamera extends StatefulWidget {
//   const QrCamera({super.key});

//   @override
//   State<QrCamera> createState() => _QrCameraState();
// }

// class _QrCameraState extends State<QrCamera> {
//   // String _scanBarcode = 'Unknown';

//   // Future<void> startBarcodeScanStream() async {
//   //   FlutterBarcodeScanner.getBarcodeStreamReceiver(
//   //           '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
//   //       .listen((barcode) => print(barcode));
//   // }

//   // Future<void> scanQR() async {
//   //   String barcodeScanRes;
//   //   try {
//   //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//   //         '#ff6666', 'Cancel', true, ScanMode.QR);
//   //     print(barcodeScanRes);
//   //   } on PlatformException {
//   //     barcodeScanRes = 'Failed to get platform version.';
//   //   }

//   //   // If the widget was removed from the tree while the asynchronous platform
//   //   // message was in flight, we want to discard the reply rather than calling
//   //   // setState to update our non-existent appearance.
//   //   if (!mounted) return;

//   //   setState(() {
//   //     _scanBarcode = barcodeScanRes;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return scanQR();
//   }
// }