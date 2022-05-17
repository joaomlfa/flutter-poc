import 'package:flutter/material.dart';
import 'package:thax_vendas/src/Home.dart';

class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _EmailController = TextEditingController();
    final _SenhaController = TextEditingController();
    void VerificarAcesso(BuildContext context){
       String emailString = _EmailController.text.trim();
       String senhaString = _SenhaController.text;
       if(emailString == "joaomlfa@gmail.com" && senhaString == "123456"){
         Navigator.pushReplacementNamed(context, "home");
       }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
         decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/wallpaper2.jpg"),
                fit: BoxFit.cover
              )
            ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            bottom: 0,
            left: 25,
            right: 25,
            top: 70
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/logo.png"),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "E-mail",
              ),
              controller:_EmailController,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Senha"),
              controller: _SenhaController,
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){}, 
                child: const Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12
                  ),
                )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromARGB(255, 245, 133, 36),
                    Color.fromARGB(255, 249, 43, 127),
                  ]
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5)
                )
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: ()=>VerificarAcesso(context), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child:  Image.asset("assets/bell_60_60.png"),
                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  )),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Color(0XFF3C5A99),
                borderRadius: BorderRadius.all(
                  Radius.circular(5)
                )
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: (){}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      const Text(
                        "Login com Facebook",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child:  Image.asset("assets/fb-icon.png"),
                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  )),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: (){}, 
                child: const Text(
                  "Criar Conta",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12
                  ),
                )),
            ),
          ],
        ),
        ),
      ),
    );
  }
}