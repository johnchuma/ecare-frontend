// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:doctor/modules/doctor/models/article.dart';
import 'package:doctor/modules/doctor/models/article_bookmark.dart';
import 'package:doctor/modules/doctor/models/article_category.dart';
import 'package:doctor/modules/doctor/models/post.dart';
import 'package:doctor/modules/doctor/models/post_like.dart';
import 'package:doctor/modules/patients/pages/articles_bookmarks.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/endpoint.dart';
import 'package:doctor/utils/loader.dart';
import 'package:doctor/utils/redirection.dart';
import 'package:doctor/utils/toasts.dart';

class ArticleController {
  Future getArticleCategories() async {
    try {
      var response = await Dio().get(
        '${production}articleCategory/',
        options: Options(
          headers: {'Authorization': 'bearer ${getMyInfo().tokens}'},
        ),
      );
      print(response);
      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getArticleCategories();
        box.clear().then((value) {
          for (var result in results) {
            ArticleCategory category = ArticleCategory.fromJson(result);
            category.localizeInfo();
          }
        });
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
    } on DioError catch (e) {
      // errorToast(e.response!.data['message']);
      print(e);
      print(e.response);
    }
  }

  Future<void> addArticle(Article article) async {
    try {
      launchLoader();
      FormData formData = FormData();
      for (var file in article.imageFiles) {
        formData.files.addAll([
          MapEntry(
              "file",
              await MultipartFile.fromFile(file.path,
                  filename: file.path.split("/").last))
        ]);
      }
      formData.fields.addAll([
        MapEntry("title", article.title),
        MapEntry("description", article.description),
        MapEntry("article_category_uuid", article.category.uuid)
      ]);
      var response = await Dio().post('${production}article',
          options: Options(
              headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
          data: formData);
      var data = response.data;
      print(data);
      if (response.data['status'] == true) {
        await getArticles();
        removeGetWidget();
        removeGetWidget();
        successToast("Article is added successfully");

        // redirectTo(const WayPage());
      }
      if (response.data['status'] == false) {
        removeGetWidget();
        errorToast(response.data);
      }
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      print(e);
      print(e);
      // errorToast(e.response!.data['error']);
      // print(e.response);
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
        await getArticles();
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      errorToast(e.response!.data['error']);
      print(e.response);
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
      await getArticles();

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

  Future<void> deleteArticle(Article article) async {
    try {
      launchLoader();
      var response = await Dio().delete(
        '${production}article/${article.uuid}',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      await getArticles();
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
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
        await getArticles();
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

  Future<void> bookmarkArticle(Article article) async {
    try {
      launchLoader();
      var response = await Dio().post(
        '${production}article/bookmark/${article.uuid}',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      if (response.data['status'] == true) {
        await getArticleBookmarks();
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
      redirectTo(const ArticlesBookmarks());
    } on DioError catch (e) {
      removeGetWidget();
      print(e);
      // errorToast(e.response!.data['error']);
      print(e.response);
    }
  }

  Future getArticles() async {
    try {
      var response = await Dio().get(
        '${production}article/',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      print(response);

      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getArticles();
        box.clear().then((value) {
          for (var result in results) {
            Article article = Article.fromJson(result);
            article.localizeInfo();
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

  Future removeBookmark(ArticleBookmark bookmark) async {
    try {
      launchLoader();
      var response = await Dio().delete(
        '${production}article/bookmark/${bookmark.uuid}',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      if (response.data['status'] == true) {
        await getArticleBookmarks();
        removeGetWidget();
        removeGetWidget();
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
    } on DioError catch (e) {
      errorToast(e.response!.data['message']);
      print(e.response);
    }
  }

  Future getArticleBookmarks() async {
    try {
      var response = await Dio().get(
        '${production}article/bookmarks',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      print(response);

      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getArticleBookmarks();
        box.clear().then((value) {
          for (var result in results) {
            ArticleBookmark bookmark = ArticleBookmark.fromJson(result);
            bookmark.localizeInfo();
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
