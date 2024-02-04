import 'package:MetnaVadq/core/api/endpoints.dart';
import 'package:MetnaVadq/features/posts/data/models/full_post_model.dart';
import 'package:MetnaVadq/features/secure_storage/secure_storage_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostService with ChangeNotifier {
  final Dio _api = Dio();
  final SecureStorageManager _storage = SecureStorageManager();
/// TODO fix return value
  /// It doesnt return list it stops after print comment
  Future<List<FullPostModel>> getPosts(int pageNum, int pageSize) async {
    try {
      pageSize ??= 20;

      final response = await _api.get(Endpoints.GET_POSTS_PAGEABLE_ENDPOINT,
          options: Options(headers: {
            "Authorization": "Bearer ${await _storage.getAccessToken()}"
          }),
          queryParameters: {
            'page': pageNum,
            'page-size': pageSize,
          });
      //print(response.data);
      print("!!!!!${await (response.data as List)
          .map((el) => FullPostModel.fromJson(el))
          .toList()}");
      return (response.data as List)
      .map((el) => FullPostModel.fromJson(el))
      .toList();
    } on DioException catch (e) {
      rethrow;
    }
  }



}
