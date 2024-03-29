class Endpoints {
  //API
  static const _API_URL = 'http://192.168.43.152:8080';
  static const _API_VERSION = '/api/v1';
  static const URL = _API_URL + _API_VERSION;

  //ENDPOINTS
  //Auth
  static const LOGIN_ENDPOINT = '$URL/auth/authenticate';
  static const REGISTER_ENDPOINT = '$URL/auth/register';
  static const REFRESH_TOKEN_ENDPOINT = '$URL/auth/refresh';

  //User
  static const GET_USER_PROFILE = '$URL/user';
  static const GET_USER_POSTS = '$URL/fish-catch/user';

  //Fish catches
  static const GET_POSTS_PAGEABLE_ENDPOINT = '$URL/fish-catch';
}