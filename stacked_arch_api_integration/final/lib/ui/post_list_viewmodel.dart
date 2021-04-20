import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:start/datamodel/post.dart';
import 'package:http/http.dart' as http;

class PostViewModelList extends FutureViewModel<List<Post>> {
  final client = http.Client();

  @override
  Future<List<Post>> futureToRun() async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final jsonDecoded = jsonDecode(response.body) as List;
    List<Post> postList = [];
    jsonDecoded.forEach((post) {
      Post newPost = Post.fromJson(post);
      postList.add(newPost);
    });
    return postList;
  }
}