import 'package:MetnaVadq/core/api/dio/api.dart';
import 'package:MetnaVadq/core/api/endpoints.dart';
import 'package:MetnaVadq/core/secure_storage/secure_storage_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final api = ref.read(apiProvider);
  final secureStorage = ref.read(secureStorageProvider);
  return UserRepository(api: api, storage: secureStorage);
});

class UserRepository {
  final DioClient _api;
  final SecureStorageManager _storage;

  UserRepository({required DioClient api, required SecureStorageManager storage})
      : _api = api,
        _storage = storage;

  Future<Response?> getUserProfile(int? id) async {
    try {
      var userId;
      if (id == null) {
        userId = "";
      } else {
        userId = id.toString();
      }

      final response = await _api.dio.get(
        "${Endpoints.GET_USER_PROFILE}?userId=$userId",
        options: Options(headers: {
          "Authorization": "Bearer ${await _storage.getAccessToken()}"
        }),
      );

      print(response.toString());

      return response;
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      print("ERROR!!!!!!");
      print(e);
    }

    return null;
  }

  Future<Response?> getUserPosts(int? id, int page, int limit) async {
    try {
      var userId;
      if (id == null) {
        userId = "";
      } else {
        userId = id.toString();
      }

      final response = await _api.dio.get(
        "${Endpoints.GET_USER_POSTS}?userId=?page-size=$limit&page=$page&user-id=$userId",
        options: Options(headers: {
          "Authorization": "Bearer ${await _storage.getAccessToken()}"
        }),
      );

      print(response.toString());

      return response;
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      print("ERROR!!!!!!");
      print(e);
    }

    return null;
  }

}
