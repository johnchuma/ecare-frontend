// ignore_for_file: avoid_print, duplicate_ignore, prefer_interpolation_to_compose_strings, unused_import

import 'package:doctor/modules/authentication/controller/firebase_controller.dart';
import 'package:doctor/modules/authentication/utils/google_auth.dart';
import 'package:doctor/modules/authentication/pages/new_password.dart';
import 'package:doctor/modules/initialization/pages/waypage_page.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/loader.dart';
import 'package:doctor/utils/redirection.dart';
import 'package:doctor/utils/toasts.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/utils/endpoint.dart';
import 'package:dio/dio.dart';

class AuthController extends GetxController {
  GoogleSignIn googleSignIn = GoogleSignIn();

  static void registerWithGoogle() async {
    try {
      // ignore: avoid_print
      GoogleSignIn(
              serverClientId:
                  "371960617698-6fkohgt0i2v52867nsa1gepd7hh3gncr.apps.googleusercontent.com")
          .signIn()
          .then((value) => {print(value)})
          // ignore: invalid_return_type_for_catch_error
          .catchError((error) => print(error));
    } catch (e) {
      print(e);
    }
  }

  Future getDoctors() async {
    try {
      var response = await Dio().get(
        '${production}auth/doctors/',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      print(response);

      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getDoctors();
        box.clear().then((value) {
          for (var result in results) {
            User doctor = User.fromDocumentSnapshot(result);
            doctor.localizeDoctor();
          }
        });
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
    } on DioError catch (e) {
      errorToast(e.response!.data['message']);
      print(e.response);
    }
  }

  static Future signIn(User user) async {
    try {
      launchLoader();

      var response = await Dio()
          .post(production + 'auth/login', options: Options(), data: {
        'email': user.email.trim(),
        'password': user.password,
      });
      await FirebaseController().firebaseAuth();
      var data = response.data;
      print(data);
      if (response.data['status'] == true) {
        removeGetWidget();
        successToast("Welcome to ecare services");
        redirectTo(const WayPage());
      }
      if (response.data['status'] == false) {
        removeGetWidget();
        errorToast(response.data);
      }
      user = User.fromDocumentSnapshot(data['response']);
      user.tokens = data['tokens']['ACCESS_TOKEN'];
      user.localizeMyInfo(user);
      await FirebaseController().firebaseAuth();
    } on DioError catch (e) {
      removeGetWidget();
      errorToast(e.response!.data['message']);
      print(e.response);
    }
  }

  static Future<void> forgotPassword(User user) async {
    try {
      launchLoader();

      FormData formData = FormData.fromMap({
        'email': user.email.trim(),
      });
      var response = await Dio().post(production + 'auth/forgot-password',
          options: Options(), data: formData);
      if (response.data['status'] == true) {
        removeGetWidget();
        successToast(
            "Code for password recovery is sent to your email address");
        redirectTo(NewPasswordPage(user));
      }
      if (response.data['status'] == false) {
        removeGetWidget();
        errorToast(response.data);
      }
    } on DioError catch (e) {
      removeGetWidget();
      errorToast(e.response!.data['message']);
      print(e.response);
    }
  }

  // static void facebookLogin() {
  //   try {} catch (e) {
  //     print(e);
  //   }
  // }

  // void signInWithGoogle() async {
  //   launchLoader();

  //   googleAuth().then((user) {
  //     FormData formData = FormData.fromMap({
  //       'name': user?.displayName,
  //       'email': user?.email.trim(),
  //       'type': "",
  //       'password': ""
  //     });
  //     formData.finalize();
  //   });
  // }

  static Future<void> updatePassword(User user) async {
    try {
      launchLoader();
      FormData formData = FormData.fromMap({
        'email': user.email.trim(),
        "password": user.password,
        "code": user.code
      });
      var response = await Dio().patch(production + 'auth/password',
          options: Options(), data: formData);
      var data = response.data;

      if (data['status']) {
        removeGetWidget();
        removeGetWidget();
        removeGetWidget();
        successToast("Password is updated successfuly");
        print("THis is runing");
      }
      if (response.data['status'] == false) {
        removeGetWidget();
        errorToast(response.data);
      }

      user = User.fromDocumentSnapshot(data['body']);
      user.tokens = data['tokens']['ACCESS_TOKEN'];
      user.localizeMyInfo(user);
    } on DioError catch (e) {
      removeGetWidget();
      errorToast(e.response!.data['message']);
      print(e.response);
    }
  }

  static Future<void> registerUser(User user) async {
    try {
      launchLoader();
      print(user.latitude);
      print(user.longitude);
      FormData formData = FormData.fromMap({
        'name': user.name,
        'email': user.email.trim(),
        'phone': user.phone,
        'hospital': user.hospital,
        'age': user.age,
        'gender': user.gender,
        'licence': user.licence,
        'latitude': user.latitude,
        'longitude': user.longitude,
        'profession_uuid': user.profession.uuid,
        'type': user.type,
        'password': user.password,
        'file': await MultipartFile.fromFile(user.imageFile.path,
            filename: user.image.split('/').last)
      });
      var response = await Dio().post(production + 'auth/register',
          options: Options(), data: formData);
      await FirebaseController().firebaseAuth();
      var data = response.data;
      print(data);
      if (response.data['status'] == true) {
        removeGetWidget();
        successToast("Your account is registred successfully");
        redirectTo(const WayPage());
      }
      if (response.data['status'] == false) {
        removeGetWidget();
        errorToast(response.data);
      }
      user = User.fromDocumentSnapshot(data['body']);
      user.tokens = data['tokens']['ACCESS_TOKEN'];
      user.localizeMyInfo(user);
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      errorToast(e.response!.data['message']);
      print(e.response);
    }
  }
}


  // var response = await Dio().patch('$production/auth/register',
  //         options: Options(headers: {'Authorization': 'Bearer ${me!.tokens}'}),
  //         data: {
  //           'as': type,
  //         });