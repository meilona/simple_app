import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_app/services/app_service.dart';
import 'package:simple_app/views/home_page.dart';
import 'package:simple_app/widgets/text.dart';

import '../controllers/controller.dart';
import '../models/post.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? _id;
  String? _userId;
  String? _title;
  String? _body;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildId() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Id'),
      validator: (String? value) {
        int? id = int.tryParse(value!);
        if (id == null || id <= 0) {
          return 'UserId must be greater than 0';
        }
      },
      onSaved: (String? value) {
        _id = value!;
      },
    );
  }

  Widget _buildUserId() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'UserId'),
      validator: (String? value) {
        int? userId = int.tryParse(value!);
        if (userId == null || userId <= 0) {
          return 'UserId must be greater than 0';
        }
      },
      onSaved: (String? value) {
        _userId = value!;
      },
    );
  }

  Widget _buildTitle() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Title'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Title is Required';
        }
      },
      onSaved: (String? value) {
        _title = value!;
      },
    );
  }

  Widget _buildBody() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Body'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Body is Required';
        }
      },
      onSaved: (String? value) {
        _body = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: [
              _buildId(),
              _buildUserId(),
              _buildTitle(),
              _buildBody(),
              ElevatedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  _formKey.currentState!.save();

                  print(_id);
                  print(_userId);
                  print(_title);
                  print(_body);
                  Post post = Post(
                      id: int.tryParse(_id!),
                      userId: int.tryParse(_userId!),
                      title: _title,
                      body: _body);
                  ApiService().createPost(post).then((isSuccess) {
                    if (isSuccess!) {
                      print('success save data');
                      Get.to(() => const HomePage());
                    } else {
                      print('failed to save data');
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
