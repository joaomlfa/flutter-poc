import 'package:flutter/material.dart';
import 'package:thax_vendas/src/telas/Bluetooth.dart';
import 'package:thax_vendas/src/telas/CodigoBarra.dart';
import 'package:thax_vendas/src/telas/Crud.dart';
import 'package:thax_vendas/src/telas/Nfc.dart';
import 'package:thax_vendas/src/telas/Pagamento.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Crud(),
      CodigoBarra(),
      Bluetooth(),
      Pagamento(),
      Nfc()
    ];
    return Scaffold(
      appBar:AppBar(
        title: Text("THEx Vendas"),
        backgroundColor: const Color.fromARGB(255, 245, 133, 36),
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 245, 133, 36),
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: "Leitor"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bluetooth),
            label: "Bluetooth"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "Pagamento"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nfc),
            label: "NFC"
          )
        ],
      ),
    );
  }
}