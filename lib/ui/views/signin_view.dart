import 'package:community_material_icon/community_material_icon.dart';
import 'package:weather_app/ui/widgets/custom_button.dart';
import 'package:weather_app/ui/widgets/custom_text_form_field.dart';
import 'package:weather_app/ui/widgets/loading.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:weather_app/viewmodels/signin_view_model.dart';

class SignInView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignInViewModel>.withConsumer(
      viewModelBuilder: () => SignInViewModel(),
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
                          child: Icon(
                              CommunityMaterialIcons.weather_partlycloudy,
                              color: Colors.white,
                              size: 120.0),
                        ),
                      ),
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.account_circle),
                            controller: emailController,
                          ),
                          CustomTextFormField(
                            borderWidth: 1.0,
                            borderStyle: BorderStyle.solid,
                            hasPrefixIcon: true,
                            textInputType: TextInputType.visiblePassword,
                            prefixIcon: Icon(Icons.lock),
                            hintText: 'Password',
                            obscured: true,
                            controller: passwordController,
                          ),
                          CustomButton(
                            title: 'Sign In',
                            textStyle: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                            color: AppColors.white,
                            onPressed: () {
                              model.login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            },
                            // textStyle: textTheme.button,
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Are you a new user? ',
                                style: TextStyle(
                                    color: AppColors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  model.navigateToSignUp();
                                },
                                child: Text(
                                  'Sign Up',
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
          )),
    );
  }
}
