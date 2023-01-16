import 'package:flutter/material.dart';
import 'package:luminouskey_task/constants/app_images.dart';
import 'package:luminouskey_task/constants/sizes.dart';
import 'package:luminouskey_task/controllers/signup_provider.dart';
import 'package:luminouskey_task/shared/auth_button.dart';
import 'package:luminouskey_task/shared/auth_text_field.dart';
import 'package:luminouskey_task/shared/background.dart';
import 'package:luminouskey_task/views/landing_views/landing_page.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            ///----------------------///
            ///----App BackGround----///
            ///----------------------///
            const BackGround(
              image: AppImages.loginBackground,
            ),

            ///------------------///
            ///----Components----///
            ///------------------///
            Consumer<SignUpProvider>(builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: Sizes.height(context) / 8),

                    ///---------------------------///
                    ///----Create Account Text----///
                    ///---------------------------///
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: Sizes.allSize(context) / 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: Sizes.height(context) / 10),

                    ///----------------------------///
                    ///----TextFields Container----///
                    ///----------------------------///
                    Container(
                      width: Sizes.width(context) / 1.1,
                      height: Sizes.height(context) / 3,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ///------------------------///
                          ///----Mobile TextField----///
                          ///------------------------///
                          MyTextField(
                            hintText: 'Name',
                            keyboardType: TextInputType.text,
                            prefixIcon: Icons.person,
                            onChanged: (newVal) {
                              provider.setUserName(newVal);
                            },
                          ),

                          ///------------------------///
                          ///----Mobile TextField----///
                          ///------------------------///
                          MyTextField(
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icons.email_outlined,
                            onChanged: (newVal) {
                              provider.setUserEmail(newVal);
                            },
                          ),

                          ///------------------------///
                          ///----Mobile TextField----///
                          ///------------------------///
                          MyTextField(
                            hintText: 'Mobile',
                            keyboardType: TextInputType.phone,
                            prefixIcon: Icons.phone,
                            onChanged: (newVal) {
                              provider.setUserPhoneNumber(newVal);
                            },
                          ),

                          ///--------------------------///
                          ///----Password TextField----///
                          ///--------------------------///
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: MyTextField(
                              hintText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              prefixIcon: Icons.lock,
                              obscureText: provider.isObscure,
                              suffixIcon: provider.isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              visibilityOnTap: () {
                                provider.setIsObscure();
                              },
                              onChanged: (newVal) {
                                provider.setUserPassword(newVal);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///------------------------------///
                    ///----Forgot password Button----///
                    ///------------------------------///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontSize: Sizes.allSize(context) / 90,
                                color: Colors.cyan.shade800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: Sizes.height(context) / 10),

                    ///--------------------///
                    ///----Login Button----///
                    ///--------------------///
                    AuthButton(
                      onTap: () {
                        provider.createAccount(context);
                      },
                      title: 'Signup',
                    ),

                    SizedBox(height: Sizes.height(context) / 10),

                    ///---------------------------------///
                    ///----dont have an account Text----///
                    ///---------------------------------///
                    Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: Sizes.allSize(context) / 90),
                    ),

                    ///----------------------------------///
                    ///----Create your account Button----///
                    ///----------------------------------///
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: Sizes.allSize(context) / 80,
                          decoration: TextDecoration.underline,
                          color: Colors.cyan.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
