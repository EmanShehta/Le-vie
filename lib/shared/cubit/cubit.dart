import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/forum_model.dart';
import 'package:la_vie/models/home_model.dart';
import 'package:la_vie/models/mypost_model.dart';
import 'package:la_vie/models/planets_model.dart';
import 'package:la_vie/models/post_model.dart';
import 'package:la_vie/models/profile_model.dart';
import 'package:la_vie/models/seed_model.dart';
import 'package:la_vie/models/tools_model.dart';
import 'package:la_vie/models/update_model.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';
import 'package:la_vie/shared/network/remote/end_points.dart';
import '../../models/one_product_model.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/leave_screen/leave_screen.dart';
import '../../screens/notification_screen/notification_screen.dart';
import '../../screens/profile_screen/profile_screen.dart';
import '../../screens/qr_screen/qr_screen.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;

  List<Widget> screens = [
    LeaveScreen(),
    QrScreen(),
    HomeScreen(),
    NotficationScreen(),
    ProfileScreen(),
  ];

  void changeBottomNav(int index, context) {
    if (index != 4) {
      currentIndex = index;
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
    emit(AppBottomNavChangeState());
  }


  HomeModel? homeModel;

  getProducts() async {
    emit(ProductLoadingHomeState());
    await DioHelper.getData(
      url: PRODUCT,
      accessToken: accessToken,
    ).then((value) {
      homeModel = HomeModel.fromJson(value!.data);
      emit(ProductSuccessHomeState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(ProductErrorHomeState());
      }
    });
  }

  PlanetModel? planetModel;

  getPlanets() async {
    emit(ProductLoadingPlantState());

    await DioHelper.getData(
      url: PLANETS,
      accessToken: accessToken,
    ).then((value) {
      planetModel = PlanetModel.fromJson(value!.data);
      emit(ProductSuccessPlantState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(ProductErrorPlantState());
      }
    });
  }

  SeedModel? seedModel;

  getSeeds() async {
    emit(ProductLoadingSeedState());
    await DioHelper.getData(
      url: SEEDS,
      accessToken: accessToken,
    ).then((value) {
      seedModel = SeedModel.fromJson(value!.data);
      emit(ProductSuccessSeedState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(ProductErrorSeedState());
      }
    });
  }


  ToolsModel? toolsModel;

  getTools() async {
    emit(ProductLoadingToolsState());
    await DioHelper.getData(
      url: TOOLS,
      accessToken: accessToken,
    ).then((value) {
      toolsModel = ToolsModel.fromJson(value!.data);
      emit(ProductSuccessToolsState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(ProductErrorToolsState());
      }
    });
  }

  ProfileModel? profileModel;

  getUserData() async {
    emit(ProfileLoadingState());
    await DioHelper.getData(
      url: PROFILE,
      accessToken: accessToken,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value!.data);

      emit(ProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(ProfileErrorState());
      }
    });
  }


  UpdateProfileModel? updateProfileModel;

  userUpdateProfile({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  }) async {
    emit(ProfileUpdateLoadingState());
    await DioHelper.patchData(
      url: UPDATE,
      data: {
        'email': email ?? profileModel!.data.email,
        'firstName': firstName ?? profileModel!.data.firstName,
        'lastName': lastName ?? profileModel!.data.lastName,

      },).then((value) {
      updateProfileModel = UpdateProfileModel.fromJson(value!.data);
      emit(ProfileUpdateSuccessState(updateProfileModel!));
      getUserData();
    }).catchError((error) {
      if (error is DioError) {
        print(error.response!.data['message'],);
        emit(ProfileUpdateErrorState(error.response!.data['message'][0]));
      }
    });
  }


  OneProductModel? oneProductModel;

  getOneProduct(String? productId) async {
    emit(ProductLoadingHomeState());
    await DioHelper.getData(
      url: "$PRODUCT/$productId",
      accessToken: accessToken,
    ).then((value) {
      oneProductModel = OneProductModel.fromJson(value!.data);
      print(
          'eg' + oneProductModel!.data.name + oneProductModel!.data.productId);

      emit(ProductSuccessHomeState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(ProductErrorHomeState());
      }
    });
  }


  ForumModel? forumModel;

  getForums(int index) async {
    emit(ForumLoadingState());
    await DioHelper.getData(
      url: FORUMS,
      accessToken: accessToken,
    ).then((value) {
      forumModel = ForumModel.fromJson(value!.data);
      print(forumModel!.data![index].userId);

      emit(ForumSuccessState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(ForumLoadingState());
      }
    });
  }



  PostModel? postModel;
  createPost({
    required String? title,
    required String? description,
     String? postImage,
}) async {
    emit(AddPostLoadingState());
    await DioHelper.postData(
      data: {
        'title':title,
        'description':description,
        'imageBase64':postImage,
      },
      url: FORUMS,
      accessToken: accessToken,
    ).then((value) {
      postModel = PostModel.fromJson(value!.data);
      print(postModel!.data.title);
      emit(AddPostSuccessState(postModel!));
    }).catchError((error){
      print(error.toString());
      if(error is DioError) {
        print(error.message.toString());
        emit(AddPostErrorState(error.message));
      }
    });

  }




  String? postImage;
  final ImagePicker _picker = ImagePicker();


  Future getImage() async {
    final XFile? image =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (image != null) {
      //answer is here : https://dailydevsblog.com/troubleshoot/resolved-convert-image-file-into-base64-image-in-flutter-web-45328/
       postImage = base64Encode(File(image.path).readAsBytesSync());
      print(postImage);
      emit(PostImageSuccessState());
    } else {
      print('Image not selected');
      emit(PostImageErrorState());
    }
  }


  MyPostModel? myPostModel;

  getMyForums(int index) async {
    emit(MyForumLoadingState());
    await DioHelper.getData(
      url: MYFORUMS,
      accessToken: accessToken,
    ).then((value) {
      myPostModel = MyPostModel.fromJson(value!.data);
      print(myPostModel!.data[index].userId);

      emit(MyForumSuccessState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(MyForumLoadingState());
      }
    });
  }



}

