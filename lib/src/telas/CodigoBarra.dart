import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class CodigoBarra extends StatefulWidget {
  const CodigoBarra({ Key? key }) : super(key: key);

  @override
  _CodigoBarraState createState() => _CodigoBarraState();
}

class _CodigoBarraState extends State<CodigoBarra> {
  String _code = "Scaneie um Código de Barra ou QR Code"; 
  Future<void> LeitorCodigo(String tipo) async{
    String scannedContent;
    try{

      scannedContent = await FlutterBarcodeScanner.scanBarcode(
        "#031cfc",
        "Cancelar", 
        true, 
        tipo == "barcode" ? ScanMode.BARCODE : ScanMode.QR);
      if(scannedContent == "-1"){
        scannedContent == "Permita acesso a camêra ou tente novamente.";
      }
    }on PlatformException{
      scannedContent = "Erro ao ler código de barra.";
    } 
    if (!mounted) return;

    setState(() {
      _code = scannedContent;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                primary: Colors.black
              ),
              onPressed: () => LeitorCodigo("barcode") , 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Código de barras"),
                  Icon(CupertinoIcons.barcode)
                ]),
              ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                primary: Colors.black
              ),
              onPressed: () => LeitorCodigo("qrcode"), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Qr code"),
                  Icon(Icons.qr_code)
                ])
              ),
            SizedBox(
              height: 20,
            ),
            Text(_code)
          ],
        ),
      )
    );
  }
}