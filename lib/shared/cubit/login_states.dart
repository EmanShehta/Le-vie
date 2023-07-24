import 'package:la_vie/models/login_model.dart';
import 'package:la_vie/models/signup_model.dart';

abstract class LoginStates{}

class LoginInitState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates{
  final LoginModel loginModel ;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates{
final String error;

  LoginErrorState(this.error);

}

class RegisterLoadingState extends LoginStates{}

class RegisterSuccessState extends LoginStates{
  final SignUpModel signUpModel ;

  RegisterSuccessState(this.signUpModel);
}

class RegisterErrorState extends LoginStates{
  final String error;

  RegisterErrorState(this.error);

}