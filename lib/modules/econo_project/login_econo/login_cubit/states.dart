

import '../../../../models/econo_app/login_model.dart';

abstract class ELoginSates{}
class LoginInitialState extends ELoginSates{}

class LoginLoadingState extends ELoginSates{}
class LoginSuccessState extends ELoginSates{
   final   Login_Models? loginModel;
  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends ELoginSates{}

class ForgetLoadingState extends ELoginSates{}
class ForgetSuccessState extends ELoginSates{}
class ForgetErrorState extends ELoginSates{}

class CodeLoadingState extends ELoginSates{}
class CodeSuccessState extends ELoginSates{}
class CodeErrorState extends ELoginSates{}

class NewLoadingState extends ELoginSates{}
class NewSuccessState extends ELoginSates{}
class NewErrorState extends ELoginSates{}

class ShopChangePasswordd extends ELoginSates{}