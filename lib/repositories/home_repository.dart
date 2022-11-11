import 'package:consumo_api/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
