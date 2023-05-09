import 'package:doctor/modules/family/models/family.dart';
import 'package:doctor/modules/authentication/models/profession.dart';
import 'package:doctor/modules/doctor/models/article.dart';
import 'package:doctor/modules/doctor/models/article_bookmark.dart';
import 'package:doctor/modules/doctor/models/article_category.dart';
import 'package:doctor/modules/doctor/models/package.dart';
import 'package:doctor/modules/doctor/models/post.dart';
import 'package:doctor/modules/doctor/models/post_category.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/doctor/models/timetable.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/modules/pharmacy/model/cart.dart';
import 'package:doctor/modules/pharmacy/model/product.dart';
import 'package:doctor/modules/pharmacy/model/product_category.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../modules/pharmacy/model/order.dart';

class Boxes {
  static Box<User> getUsers() {
    return Hive.box<User>('users');
  }

  static Box<PostCategory> getPostCategories() {
    return Hive.box<PostCategory>('post_categories');
  }

  static Box<ProductCategory> getProductCategories() {
    return Hive.box<ProductCategory>('product_categories');
  }

  static Box<Product> getProducts() {
    return Hive.box<Product>('products');
  }

  static Box<Order> getOrders() {
    return Hive.box<Order>('orders');
  }

  static Box<Cart> getCartProducts() {
    return Hive.box<Cart>('cart');
  }

  static Box<ArticleCategory> getArticleCategories() {
    return Hive.box<ArticleCategory>('article_categories');
  }

  static Box<Post> getPosts() {
    return Hive.box<Post>('posts');
  }

  static Box<Appointment> getAppointments() {
    return Hive.box<Appointment>('appointments');
  }

  static Box<Family> getfamily() {
    return Hive.box<Family>('family');
  }

  static Box<Article> getArticles() {
    return Hive.box<Article>('articles');
  }

  static Box<Package> getPackages() {
    return Hive.box<Package>('packages');
  }

  static Box<Timetable> getTimetables() {
    return Hive.box<Timetable>('timetables');
  }

  static Box<User> getDoctors() {
    return Hive.box<User>('doctors');
  }

  static Box<Profession> getProfessions() {
    return Hive.box<Profession>('professions');
  }

  static Box<ArticleBookmark> getArticleBookmarks() {
    return Hive.box<ArticleBookmark>('article_bookmarks');
  }
}
