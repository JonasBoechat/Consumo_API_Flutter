import 'package:consumo_api/models/post_model.dart';
import 'package:consumo_api/repositories/home_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  fetch() async {
    posts.value = await _homeRepository.getList();
  }
}
