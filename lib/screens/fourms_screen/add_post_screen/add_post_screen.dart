import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/screens/fourms_screen/fourm_screen.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/components/styles/colors.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/utils/size_extention.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {


  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  static showBlackSuccessSnackBar(BuildContext context, {String? title}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3,),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 25.rw, vertical: 30.rh),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.rSp)),
        backgroundColor: Colors.red.withOpacity(0.7),
        content: Text(
          title ?? 'User Must Add All Information',
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){
        if(state is AddPostSuccessState){
          navigateAndFinish(context, const ForumsScreen());
        }else if (state is AddPostErrorState){

          showBlackSuccessSnackBar(context);
        }
      },
      builder: (context , state){
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black,),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: const Text('Create New Post',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 21,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          body: ListView(
            children: [
              SafeArea(
                child: Padding(
                  padding:  EdgeInsets.all(30.0.rSp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                width: 136.rSp,
                                height: 136.rSp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.rSp),
                                  border: Border.all(
                                    width: 1,
                                    color: defaultColor,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add,
                                      color: defaultColor,
                                    ),
                                    SizedBox(height: 15.rh,),
                                    Text('Add Photo',
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: defaultColor
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: AppCubit.get(context).postImage != null, //only visible when user add photo successfully
                                child: Container(
                                  width: 135.rSp,
                                  height: 135.rSp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5,),
                                    color: defaultColor,
                                  ),
                                  child: Image.network('https://icon-library.com/images/gallery-app-icon/gallery-app-icon-19.jpg',
                                  fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                            ],
                          ),
                          onTap: (){
                            cubit.getImage();
                          },
                        ),
                      ),
                      SizedBox(height: 13.rh,),
                      const Text('Title',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: Color(0xff6F6F6F),
                        ),
                      ),
                      SizedBox(height: 5.rh,),
                      SizedBox(
                        height: 46.rSp,
                        child: TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: defaultColor,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 1.rSp,
                                color: const Color(0xff939393),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.rh,),
                      const Text('Description',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: Color(0xff6F6F6F),
                        ),
                      ),
                      SizedBox(height: 5.rh,),
                      Container(
                        margin: EdgeInsets.zero,
                        height: 130,
                        child: TextField(
                          controller: descriptionController,
                          maxLines: 9999, // to make text field able to take size https://stackoverflow.com/questions/55781224/how-to-create-a-full-screen-textfield-in-flutter
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: defaultColor,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 1.rSp,
                                color: const Color(0xff939393),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 33.rh,),
                      SizedBox(
                        height: 54.rh,
                        child: TextButton(

                          onPressed: () async{
                          await  cubit.createPost(
                                title: titleController.text,
                                description: descriptionController.text,
                              postImage: 'data:image/jpeg;base64,${AppCubit.get(context).postImage}',

                                );


                          },
                          style: ButtonStyle(

                            backgroundColor: MaterialStateProperty.all(defaultColor,), //https://stackoverflow.com/questions/50083390/create-a-button-with-rounded-border
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: const BorderSide(color: Colors.white)
                              ),
                            ),

                          ),
                          child: const Text('Post',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
