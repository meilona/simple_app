import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/app_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    context = context;
    return SafeArea(
      child: FutureBuilder(
        future: apiService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>?> snap) {
          if (snap.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snap.error.toString()}"),
            );
          } else if (snap.connectionState == ConnectionState.done) {
            List<Post>? posts = snap.data;
            return _buildListView(posts!);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildListView(List<Post> posts) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: posts == null ? 0 : posts.length,
        itemBuilder: ((context, index) {
          Post post = posts[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.title!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(post.body!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Warning"),
                                    content: Text(
                                        "Are you sure want to delete data profile ${post.userId}?"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          apiService
                                              .deletePost(post.id!)
                                              .then((isSuccess) {
                                            if (isSuccess!) {
                                              setState(() {});
                                              ScaffoldMessenger.of(this.context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Delete data success")));
                                            } else {
                                              ScaffoldMessenger.of(this.context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Delete data failed")));
                                            }
                                          });
                                        },
                                      ),
                                      TextButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
