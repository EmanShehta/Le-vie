import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/styles/colors.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/utils/size_extention.dart';

class UpdateProfileScreen extends StatefulWidget {
   const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  var firstNameController = TextEditingController();

   var lastNameController = TextEditingController();

   var emailController = TextEditingController();

   var passwordController = TextEditingController();

   var formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context, state){
        if(state is ProfileUpdateSuccessState){
          Navigator.pop(context);
        }
      },
      builder: (context , state){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text('Update Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,

              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  (state is ProfileUpdateLoadingState)? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: LinearProgressIndicator(),
                  ): SizedBox(height: 5.rh,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          validator: ( value){
                            return 'User Must Input Data' ;
                          },
                          controller: firstNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: defaultColor,
                              ),
                            ),
                            labelText: 'First Name',
                          ),
                        ),
                      ),
                      SizedBox(width: 20.rw,),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          validator: ( value){
                            return 'User Must Input Data' ;
                          },
                          controller: lastNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: defaultColor,
                              ),
                            ),
                            labelText: 'last Name',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.rh,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: ( value){
                      return 'User Must Input Email Address' ;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1,
                          color: defaultColor,
                        ),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 20.rh,),
                  ElevatedButton(onPressed: (){
                    AppCubit.get(context).userUpdateProfile(
                        email: emailController.text.trim() == ''? null :emailController.text,
                        firstName: firstNameController.text.trim() == ''? null :firstNameController.text,
                        lastName: lastNameController.text.trim() == ''? null :lastNameController.text,
                    );
                  },

                    child: const Text('Update Your Profile'),),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
