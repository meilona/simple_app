import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../models/post.dart';

class AddController extends GetxController {
  var isLoading = true.obs;
  var post = Post().obs;
}
