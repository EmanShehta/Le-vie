import 'package:flutter/material.dart';
import 'package:la_vie/screens/qr_screen/scanner_overlay.dart';
import 'package:la_vie/utils/size_extention.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);


  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  MobileScannerController cameraController = MobileScannerController();



showSnackBar(String text){
  return SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.rSp),),),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(20.rSp),
    backgroundColor: Colors.white.withOpacity(0.53),
    duration: const Duration(seconds: 10,),
    content:  SizedBox(
      width: 341.rSp,
      height: 75.rSp,
        child: InkWell(
            onTap: (){
              if(mounted){
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }
            },
            child: Text(text,
        style: const TextStyle(
          color: Colors.black,
        ),
        )),),
  );
}
// ref https://pub.dev/packages/mobile_scanner.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Scan a seed'),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: Stack(

          children: [
            MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) {
                  if (barcode.rawValue == null) {
                    debugPrint('Failed to scan Barcode');
                  } else {
                    final String code = barcode.rawValue!;
                    debugPrint('Barcode found! $code');
                    ScaffoldMessenger.of(context).showSnackBar(showSnackBar(code));
                  }
                }),
            QRScannerOverlay(
              overlayColour: Colors.black.withOpacity(.4),
            ),

          ],
        ));
  }
}