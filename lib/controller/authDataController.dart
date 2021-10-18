import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:get/get.dart';

class AuthDataController extends GetxController{
  final authData= AuthUser(username: '', userId: '').obs;

}