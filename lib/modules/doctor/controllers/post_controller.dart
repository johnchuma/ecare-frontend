// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:doctor/modules/doctor/models/post.dart';
import 'package:doctor/modules/doctor/models/post_category.dart';
import 'package:doctor/modules/doctor/models/post_like.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/endpoint.dart';
import 'package:doctor/utils/loader.dart';
import 'package:doctor/utils/toasts.dart';

class PostController {
  Future getPostCategories() async {
    try {
      var response = await Dio().get(
        '${production}postCategory/',
        options: Options(
          headers: {'Authorization': 'bearer ${getMyInfo().tokens}'},
        ),
      );
      print(response);
      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getPostCategories();
        box.clear().then((value) {
          for (var result in results) {
            PostCategory category = PostCategory.fromJson(result);
            category.localizeInfo();
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

  Future<void> addPost(Post post) async {
    try {
      launchLoader();
      FormData formData = FormData();

      for (var file in post.imageFiles) {
        formData.files.addAll([
          MapEntry(
              "file",
              await MultipartFile.fromFile(file.path,
                  filename: file.path.split("/").last))
        ]);
      }
      formData.fields.addAll([
        MapEntry("caption", post.caption),
        MapEntry("post_category_uuid", post.category.uuid)
      ]);
      var response = await Dio().post('${production}post',
          options: Options(
              headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
          data: formData);
      var data = response.data;
      print(data);
      if (response.data['status'] == true) {
        await getPost();
        removeGetWidget();
        removeGetWidget();
        successToast("Post is added successfully");

        // redirectTo(const WayPage());
      }
      if (response.data['status'] == false) {
        removeGetWidget();
        errorToast(response.data);
      }
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      errorToast(e.response!.data['error']);
      print(e.response);
    }
  }

  Future<void> likePost(Post post) async {
    try {
      launchLoader();
      FormData formData = FormData.fromMap({});
      var response = await Dio().post('${production}post/like/${post.uuid}',
          options: Options(
              headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
          data: formData);
      var data = response.data;
      print(data);
      if (response.data['status'] == true) {
        await getPost();
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
    } on DioError catch (e) {
      print(e);
      removeGetWidget();
      // errorToast(e.response!.data['error']);
      // print(e.response);
    }
  }

  Future<void> removeLike(PostLike postLike) async {
    try {
      launchLoader();
      var response = await Dio().delete(
        '${production}post/dislike/${postLike.uuid}',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      await getPost();

      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      print(e);
      // errorToast(e.response!.data['error']);
      // print(e.response);
    }
  }

  Future<void> deletePost(Post post) async {
    try {
      launchLoader();
      var response = await Dio().delete(
        '${production}post/${post.uuid}',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      await getPost();

      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      print(e);
      // errorToast(e.response!.data['error']);
      // print(e.response);
    }
  }

  Future<void> commentPost(Post post, String comment) async {
    try {
      launchLoader();
      var response = await Dio().post('${production}post/comment/${post.uuid}',
          options: Options(
              headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
          data: {"comment": comment});
      var data = response.data;
      print(data);
      if (response.data['status'] == true) {
        await getPost();
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      print(e);
      // errorToast(e.response!.data['error']);
      print(e.response);
    }
  }

  Future getPost() async {
    try {
      var response = await Dio().get(
        '${production}post/',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      print(response);

      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getPosts();
        box.clear().then((value) {
          for (var result in results) {
            Post post = Post.fromJson(result);
            post.localizeInfo();
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
}
