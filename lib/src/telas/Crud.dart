
import 'package:flutter/material.dart';
import 'package:thax_vendas/src/model/Api.dart';
import 'package:thax_vendas/src/model/Post.dart';
import 'package:thax_vendas/src/telas/AddPost.dart';

import '../util/DialogUtils.dart';

class Crud extends StatefulWidget {
  const Crud({ Key? key }) : super(key: key);

  @override
  _CrudState createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  
  ListarPost(){
    Future<List<Post>> posts;
    Api api = Api();
    posts = api.pesquisar();
    return posts;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ListarPost(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.active:
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if(snapshot.hasData){
                var data = (snapshot.data as List<Post>).toList();

                return ListView.separated(
                  itemBuilder: ((context, index){
                    return Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit:  BoxFit.cover,
                              image: AssetImage("assets/hotel_imagem.jpg")
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(data[index].title),
                          subtitle: Text(data[index].body),
                          onLongPress: ()async{
                            var result = await DialogUtils.displayDialogOKCallBack(context, "Atenção!!!", "Deseja apagar o post selecionado?");
                            if(result == true){
                              Api api = Api();
                              var result = await api.Apagar(data[index].id ?? 1);
                              if(result){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content:  Text("Post deletado com sucesso"),
                                duration:  Duration(seconds: 2),
                                ));
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content:  Text("Erro ao deletar post, por favor tente novamente."),
                                duration:  Duration(seconds: 2),
                                ));
                              } 
                            }
                          },
                        ),
                      ],
                    );
                  }),
                  separatorBuilder: (context, index) => const Divider(
                    height: 3,
                  ),
                  itemCount: data.length,
                );
              }else{
                return Center(
                  child: Text(snapshot.hasError
                      ? "Erro ao carregar os posts. Recarregue a pagina."
                      : "Nenhum post para ser exibido."),
                );
              }
          }
        }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: ((context) => AddPost()
              )));
          },
          backgroundColor: const Color.fromARGB(255, 245, 133, 36),
          child: const Icon(Icons.add),
          heroTag: "UniqueTag",
        ),
    );
  }
}