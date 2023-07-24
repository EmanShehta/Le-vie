import 'package:la_vie/models/post_model.dart';
import 'package:la_vie/models/update_model.dart';

abstract class AppStates {}

class InitialAppStates extends AppStates{}

class AppBottomNavChangeState extends AppStates{}

class ProductLoadingHomeState extends AppStates{}

class ProductSuccessHomeState extends AppStates{}

class ProductErrorHomeState extends AppStates{

}
class ProductLoadingSeedState extends AppStates{}

class ProductSuccessSeedState extends AppStates{}

class ProductErrorSeedState extends AppStates{

}
class ProductLoadingPlantState extends AppStates{}

class ProductSuccessPlantState extends AppStates{}

class ProductErrorPlantState extends AppStates{

}
class ProductLoadingToolsState extends AppStates{}

class ProductSuccessToolsState extends AppStates{}

class ProductErrorToolsState extends AppStates{

}

class ProfileLoadingState extends AppStates{}

class ProfileSuccessState extends AppStates{}

class ProfileErrorState extends AppStates{

}




class ProfileUpdateLoadingState extends AppStates{}

class ProfileUpdateSuccessState extends AppStates{
  final UpdateProfileModel updateProfileModel ;

  ProfileUpdateSuccessState(this.updateProfileModel);
}

class ProfileUpdateErrorState extends AppStates{
  final String error;

  ProfileUpdateErrorState(this.error);

}

class ForumLoadingState extends AppStates{}

class ForumSuccessState extends AppStates{}

class ForumErrorState extends AppStates{

}

class AddPostLoadingState extends AppStates{}


class AddPostSuccessState extends AppStates{
  final PostModel postModel ;

  AddPostSuccessState(this.postModel);
}

class AddPostErrorState extends AppStates{
  final String error;

  AddPostErrorState(this.error);

}


class PostImageSuccessState extends AppStates{}

class PostImageErrorState extends AppStates{
}


class MyForumLoadingState extends AppStates{}

class MyForumSuccessState extends AppStates{}

class MyForumErrorState extends AppStates{

}