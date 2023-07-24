import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/login_model.dart';
import 'package:la_vie/models/signup_model.dart';
import 'package:la_vie/shared/cubit/login_states.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';

import '../network/remote/end_points.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

   userLogin({
    required String email,
    required String password,
})
   async {
     emit(LoginLoadingState());
     DioHelper.postData(url: LOGIN, data: {
      'email':email,
      'password':password,
    },).then((value)  {
      loginModel = LoginModel.fromJson(value!.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      if(error is DioError){

      print(error.response!.data['message'],);
      emit(LoginErrorState(error.response!.data['message'][0]));
      }
    });
  }




  SignUpModel? signUpModel;
  userRegister({
    required String email,
    required String password,
    required String firsName,
    required String lastName,

  })
  async {
    emit(RegisterLoadingState());
    DioHelper.postData(url: SIGNUP, data: {
      'email':email,
      'password':password,
      'firstName':firsName,
      'lastName':lastName,
    },).then((value)  {
      signUpModel = SignUpModel.fromJson(value!.data);

      emit(RegisterSuccessState(signUpModel!));
    }).catchError((error){
      if(error is DioError){

        print(error.response!.data['message'],);
        emit(RegisterErrorState(error.response!.data['message'][0]));
      }
    });
  }
}


