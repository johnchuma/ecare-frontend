// ignore_for_file: must_be_immutable, unused_import, unnecessary_string_interpolations

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/authentication/utils/google_auth.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/authentication/pages/new_password.dart';
import 'package:doctor/modules/authentication/pages/registration_page.dart';
import 'package:doctor/modules/doctor/pages/doctor_page.dart';
import 'package:doctor/modules/initialization/controller/initialization_controller.dart';
import 'package:doctor/modules/initialization/pages/as.dart';
import 'package:doctor/modules/patients/pages/patient_index.dart';
import 'package:doctor/modules/pharmacy/pharmacy_home_page.dart';
import 'package:doctor/modules/pharmacy/pharmacy_maps.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';

import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  User user = User();

  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.height / 2.2;
    double bottomHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).size.height / 2.2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  BrandColor.main_color,
                  BrandColor.main_color,
                ])),
                width: double.infinity,
                height: headerHeight,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: headerHeight - 160,
                        child: CachedNetworkImage(imageUrl: Photos.login)),
                    customHeading("Login to continue ", 25, null,
                        BrandColor.in_background, FontWeight.w400),
                    customHint("We make your health better", null,
                        BrandColor.in_background.withOpacity(0.4)),
                  ],
                )),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 55),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Container(
                      height: bottomHeight - 55,
                      color: BrandColor.in_background,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                familyForm("Email", "Your email address",
                                    textEditingController: emailController),
                                familyForm("Password", "Your password",
                                    textEditingController: passwordController,
                                    hideText: true),
                                GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                      child: Container(
                                        color: BrandColor.in_background,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                customHeading(
                                                    "Forgot your password ?",
                                                    20),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                customHint(
                                                    "Enter your email address and we will share a link to create a new password "),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                familyForm(
                                                    "Email", "Enter your email",
                                                    textEditingController:
                                                        emailController),
                                                GestureDetector(
                                                    onTap: () {
                                                      user.email =
                                                          emailController.text;

                                                      user.forgotPassword();
                                                    },
                                                    child:
                                                        customButton("Submit")),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      customHeading("Forget password ?", 14,
                                          null, Colors.black, FontWeight.w500),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 60,
                  right: 60,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              user.email = emailController.text;
                              user.password = passwordController.text;
                              user.signin();
                            }
                          },
                          child: customButton("Login")),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customHeading("Don't have an account ?", 14, null,
                              null, FontWeight.w500),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const As());
                            },
                            child: customHeading("Register", 14, null,
                                BrandColor.main_color, FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}




// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:doctor/includes/custom_avatar.dart';
// import 'package:doctor/includes/custom_button.dart';
// import 'package:doctor/includes/custom_form.dart';
// import 'package:doctor/includes/custom_heading.dart';
// import 'package:doctor/includes/custom_hint.dart';
// import 'package:doctor/includes/custom_text.dart';
// import 'package:doctor/modules/authentication/controller/auth_controller.dart';
// import 'package:doctor/modules/authentication/pages/registration_page.dart';
// import 'package:doctor/utils/brand_colors.dart';
// import 'package:doctor/utils/photos.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // ignore: must_be_immutable
// class SignInPage extends StatelessWidget {
//   SignInPage({super.key});
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController repeatPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: BrandColor.background_color,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: SingleChildScrollView(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   SizedBox(
//                     width: ,
//                       height: MediaQuery.of(context).size.height / 3,
//                       child: CachedNetworkImage(imageUrl: Photos.health)),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   customHeading("Welcome back!"),
//                   customText("Get your health better"),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Column(
//                         children: const [],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   customForm("Email", "Enter email address", emailController,
//                       Icons.email),
//                   const SizedBox(
//                     height: 0,
//                   ),
//                   customForm("Password", "Enter your password",
//                       passwordController, null, null, null, true),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       customHeading("Forget password ?", 14, null, Colors.black,
//                           FontWeight.w500),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 50),
//                     child: GestureDetector(
//                         onTap: () {},
//                         child: customButton('Sign in', BrandColor.main_color)),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   customHint("Signin with your"),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             AuthController.registerWithGoogle();
//                           },
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(30),
//                             child: Container(
//                               color: Colors.red,
//                               height: 45,
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 15),
//                                 child: Row(
//                                   children: [
//                                     ClipOval(
//                                       child: Container(
//                                         color: BrandColor.in_background,
//                                         child: customAvatar(20,
//                                             "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png"),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                     customHeading(
//                                         "Google", 13, null, Colors.white)
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(30),
//                           child: Container(
//                             color: BrandColor.main_color,
//                             height: 45,
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               child: Row(
//                                 children: [
//                                   customAvatar(20,
//                                       "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/768px-Facebook_Logo_%282019%29.png"),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   customHeading(
//                                       "Facebook", 13, null, Colors.white)
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       customHeading("I don't have an account ?", 14, null, null,
//                           FontWeight.w500),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Get.to(() => RegistrationPage());
//                         },
//                         child: customHeading("Register", 14, null,
//                             BrandColor.main_color, FontWeight.w600),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
