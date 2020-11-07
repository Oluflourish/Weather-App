import 'package:community_material_icon/community_material_icon.dart';
import 'package:weather_app/ui/widgets/custom_button.dart';
import 'package:weather_app/ui/widgets/custom_text_form_field.dart';
import 'package:weather_app/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:weather_app/viewmodels/signup_view_model.dart';
import 'package:weather_app/utils/colors.dart';

class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.blackShade1,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, bottom: 24.0),
                    child: Center(
                      child: Center(
                        child: Icon(CommunityMaterialIcons.weather_partlycloudy,
                            color: Colors.white, size: 120.0),
                      ),
                    ),
                  ),
                  Text('Create Account',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold)),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 36.0,
                      vertical: 36.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CustomTextFormField(
                          borderWidth: 1.0,
                          borderStyle: BorderStyle.solid,
                          hasPrefixIcon: true,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'First name',
                          prefixIcon: Icon(Icons.account_circle),
                          controller: firstNameController,
                        ),
                        CustomTextFormField(
                          borderWidth: 1.0,
                          borderStyle: BorderStyle.solid,
                          hasPrefixIcon: true,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'Surname',
                          prefixIcon: Icon(Icons.account_circle),
                          controller: lastNameController,
                        ),
                        CustomTextFormField(
                          borderWidth: 1.0,
                          borderStyle: BorderStyle.solid,
                          hasPrefixIcon: true,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.contact_mail),
                          controller: emailController,
                        ),
                        CustomTextFormField(
                            borderWidth: 1.0,
                            borderStyle: BorderStyle.solid,
                            hasPrefixIcon: true,
                            textInputType: TextInputType.visiblePassword,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye),
                            hintText: 'Password',
                            obscured: true,
                            controller: passwordController),
                        CustomButton(
                          title: 'Create Account',
                          color: AppColors.white,
                          textStyle: TextStyle(color: AppColors.primaryColor),
                          onPressed: () {
                            model.signUp(
                                email: emailController.text,
                                password: passwordController.text,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text);
                          },
                          // textStyle: textTheme.button,
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Already have an account? ',
                              style: TextStyle(color: AppColors.white),
                            ),
                            InkWell(
                              onTap: () {
                                model.navigateToSignIn();
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                child: model.busy ? const Loading() : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
