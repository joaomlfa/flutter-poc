import 'package:flutter/material.dart';
import 'package:thax_vendas/src/model/Api.dart';
import 'package:thax_vendas/src/model/Post.dart';

class AddPost extends StatelessWidget {
  AddPost({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();  
  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerpost = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "uniqueTag",
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form( 
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _controllerTitulo,
                  decoration: const InputDecoration(
                    hintText: "Entre com o título",
                    label: Text("Título")
                  ),
                  validator: (value){
                    if(value == "" || value == null) 
                      return "Entre com um título";
                    else
                      return null;
                  },
                ),
                TextFormField(
                  controller: _controllerpost,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: "Escreva o post",
                    label: Text("Post"),
                  ),
                  validator: (value){
                    if(value == "" || value == null)
                      return "Entre com um post";
                    else
                      return null;
                  },
                ),
               Container(  
                padding: const EdgeInsets.only(top: 40.0),  
                child: ElevatedButton(  
                  child: const Text('Submit'),  
                  onPressed: () async{  
                    if (_formKey.currentState!.validate()) {  
                      Post post = Post.noId(1, _controllerTitulo.text, _controllerpost.text);
                      Api api = Api();
                      var result = await api.Adicionar(post);
                      if(result){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:  Text("Post adicionado com sucesso."),
                        duration:  Duration(seconds: 2),
                        ));
                        Navigator.pop(context);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:  Text("Erro ao adicionar post, por favor tente novamente."),
                        duration:  Duration(seconds: 2),
                        ));
                        Navigator.pop(context);
                      } 
                    }  
                  },  
                )), 
              ],
            ),
          ),
        )
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 133, 36),
        title: Text("Adicionar Post"),
      ),
    );
  }
}