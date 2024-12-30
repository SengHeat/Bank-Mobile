import 'package:bank_mobile_app/theme/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Example',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const QrGenerateScreen(),
    );
  }
}

class QrGenerateScreen extends StatelessWidget {
  const QrGenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            QrImageView(
              data: '00020101021129450016abaakhppxxx@abaa01090040088030208ABA Bank40390006abaP2P011293E5DBC161FE02090040088035204000053038405802KH5909SENG HEAT6010Phnom Penh6304C69F',  // The data you want to encode
              version: QrVersions.auto,
              size: 200.0,
            ),
            // The icon that will appear in the center of the QR code
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: ColorResources.getWhiteColor(context),
                  shape: BoxShape.circle
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorResources.getBlackColor(context),
                  shape: BoxShape.circle
                ),
                child: Image.asset(
                  "assets/icons/icon_dolla.png",
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                  color: ColorResources.getWhiteColor(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
