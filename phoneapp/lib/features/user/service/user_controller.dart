import 'package:MetnaVadq/features/posts/data/models/partial_post_model.dart';
import 'package:MetnaVadq/features/user/data/user_model.dart';
import 'package:MetnaVadq/features/user/service/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userControllerProvider = Provider((ref) {
  final userRepository = ref.read(userRepositoryProvider);
  return UserController(userRepository: userRepository);
});

class UserController {
  final UserRepository _userRepository;

  UserController({required UserRepository userRepository}): _userRepository = userRepository;

  Future<UserModel> getUserProfile(int? id) async {
    try {
    final response = await _userRepository.getUserProfile(id);

    UserModel userProfile = UserModel.fromJson(response?.data);

    return userProfile;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<PartialPostModel>> getUserPosts(int? id, int page, int limit) async {
    try {
      final response = await _userRepository.getUserPosts(id, page, limit);

      List<PartialPostModel> userPosts = (response?.data as List).map((e) => PartialPostModel.fromJson(e)).toList();

      return userPosts;
    } catch (e) {
      print(e);
      throw e;
    }
  }

}
