
import '../../../models/econo_app/models_sinup.dart';
abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLodingState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  final String error;
  SignUpErrorState(this.error);
}

class Successtate extends SignUpStates {
  final SignUpModel signup;
  Successtate(this.signup);
}

class ShopChangePassword extends SignUpStates{

}