import 'package:http/http.dart' show Client;
import '../models/post.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  Client client = Client();

  // request ke endpoint using GET method
  Future<List<Post>> getPosts() async {
    final res = await client.get(Uri.parse("$baseUrl/posts"));
    return postFromJson(res.body);
    // if (res.statusCode == 200) {
    //   return postFromJson(res.body);
    // } else {
    //   return null;
    // }
  }

  //delete
  Future<bool?> deletePost(int id) async {
    final res = await client.delete(Uri.parse("$baseUrl/posts/$id"),
        headers: {"content-type": "application/json"});
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }

  //create
  Future<bool?> createPost(Post data) async {
    final res = await client.post(Uri.parse("$baseUrl/posts"),
        headers: {"content-type": "application/json"}, body: postToJson(data));
    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }
}
