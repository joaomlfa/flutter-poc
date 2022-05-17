
import 'package:thax_vendas/src/model/Post.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

const DEFAULT_URL = "https://jsonplaceholder.typicode.com/posts";

class Api{
  Api();
  Future<List<Post>> pesquisar() async{
    
    var uri = Uri.parse(DEFAULT_URL);
    http.Response response = await http.get(uri);

    if(response.statusCode == 200){
      var postsJson = json.decode(response.body) as List ;
      List<Post> posts = postsJson.map((map) => Post.fromJson(map)).toList();
      return posts;
    }else{
      throw Exception("Erro ao obter posts");
    }
  }
  Future<bool>Adicionar(Post post) async{
    try{
      var uri = Uri.parse(DEFAULT_URL);
      String jsonPost = jsonEncode(post);
      http.Response response = await http.post(uri, body: jsonPost);
      if(response.statusCode == 201){
        return Future<bool>.value(true);
      }else{
        return Future<bool>.value(false);
      }
    }catch(e){
      return Future<bool>.value(false);
    } 
  }
  Future<bool>Apagar(int id)async{
    try{
      var uri = Uri.parse(DEFAULT_URL + "/" + id.toString());
      http.Response response = await http.delete(uri);
      if(response.statusCode == 200){
        return Future<bool>.value(true);
      }else{
        return Future<bool>.value(false);
      }
    }catch(e)
    {
      return Future<bool>.value(false);
    }
  }
}