import './views/add_page.dart';
import './views/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './controllers/controller.dart';
import './configs/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(Controller());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ApiService().getPosts().then((value) => print("value : $value"));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: appRoutes(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Post it!"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const AddPage());
                },
                child: Icon(
                  Icons.add,
                  size: 26.0,
                ),
              ),
            )
          ],
        ),
        body: const HomePage(),
      ),
    );
  }
}
