// ignore: unused_import
// ignore_for_file: unused_import, duplicate_ignore, deprecated_member_use, avoid_print

import 'package:doctor/includes/post_item.dart';
import 'package:doctor/modules/authentication/models/profession.dart';
import 'package:doctor/modules/doctor/models/article.dart';
import 'package:doctor/modules/doctor/models/article_bookmark.dart';
import 'package:doctor/modules/doctor/models/article_category.dart';
import 'package:doctor/modules/doctor/models/package.dart';
import 'package:doctor/modules/doctor/models/post.dart';
import 'package:doctor/modules/doctor/models/post_category.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/authentication/pages/registration_page.dart';
import 'package:doctor/modules/chat/pages/chat_page.dart';
import 'package:doctor/modules/doctor/models/post_comment.dart';
import 'package:doctor/modules/doctor/models/post_image.dart';
import 'package:doctor/modules/doctor/models/post_like.dart';
import 'package:doctor/modules/doctor/models/timetable.dart';
import 'package:doctor/modules/doctor/pages/comments_page.dart';
import 'package:doctor/modules/doctor/pages/create_articles_page.dart';
import 'package:doctor/modules/doctor/pages/create_post_page.dart';
import 'package:doctor/modules/doctor/pages/doctor_page.dart';
import 'package:doctor/modules/doctor/pages/notification_page.dart';
import 'package:doctor/modules/doctor/pages/reviews_page.dart';
import 'package:doctor/modules/emergency/pages/emergency_page.dart';
import 'package:doctor/modules/family/models/family.dart';
import 'package:doctor/modules/family/pages/family_page.dart';
import 'package:doctor/modules/initialization/pages/as.dart';
import 'package:doctor/modules/initialization/pages/splash_page.dart';
import 'package:doctor/modules/appointment/book_appointment.dart';
import 'package:doctor/modules/initialization/pages/waypage_page.dart';
import 'package:doctor/modules/patients/pages/articles_page.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/modules/patients/pages/my_orders.dart';
import 'package:doctor/modules/patients/pages/patient_index.dart';
import 'package:doctor/modules/patients/pages/posts_page.dart';
import 'package:doctor/modules/patients/pages/specialist_page.dart';
import 'package:doctor/modules/pharmacy/model/cart.dart';
import 'package:doctor/modules/pharmacy/model/order.dart';
import 'package:doctor/modules/pharmacy/model/product.dart';
import 'package:doctor/modules/pharmacy/model/product_category.dart';
import 'package:doctor/modules/pharmacy/model/product_image.dart';
import 'package:doctor/modules/pharmacy/pharmacy_maps.dart';
import 'package:doctor/modules/settings/pages/bulb_app.dart';
import 'package:doctor/modules/settings/pages/settings_page.dart';
import 'package:doctor/modules/shop/shopping_cart.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(PostCategoryAdapter());
  Hive.registerAdapter(PostImageAdapter());
  Hive.registerAdapter(PostCommentAdapter());
  Hive.registerAdapter(PostLikeAdapter());
  Hive.registerAdapter(PostAdapter());
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(ArticleBookmarkAdapter());
  Hive.registerAdapter(ArticleCategoryAdapter());
  Hive.registerAdapter(TimetableAdapter());
  Hive.registerAdapter(PackageAdapter());
  Hive.registerAdapter(ProfessionAdapter());
  Hive.registerAdapter(FamilyAdapter());
  Hive.registerAdapter(AppointmentAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(ProductImageAdapter());
  Hive.registerAdapter(ProductCategoryAdapter());
  Hive.registerAdapter(CartAdapter());
  Hive.registerAdapter(OrderAdapter());
  await Hive.openBox<User>('users');
  await Hive.openBox<Cart>('cart');
  await Hive.openBox<Order>('orders');
  await Hive.openBox<Product>('products');
  await Hive.openBox<ProductCategory>('product_categories');
  await Hive.openBox<Appointment>('appointments');
  await Hive.openBox<Family>('family');
  await Hive.openBox<User>('doctors');
  await Hive.openBox<Package>('packages');
  await Hive.openBox<Timetable>('timetables');
  await Hive.openBox<Profession>('professions');
  await Hive.openBox<Post>('posts');
  await Hive.openBox<Article>('articles');
  await Hive.openBox<PostCategory>('post_categories');
  await Hive.openBox<ArticleCategory>('article_categories');
  await Hive.openBox<ArticleBookmark>('article_bookmarks');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
  
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: BrandColor.main_color,
                onPrimary: BrandColor.in_background,
                secondary: Colors.white,
                onSecondary: BrandColor.main_color,
                error: BrandColor.main_color,
                onError: BrandColor.main_color,
                background: BrandColor.main_color,
                onBackground: BrandColor.text_color,
                surface: BrandColor.in_background,
                onSurface: BrandColor.text_color),
            appBarTheme: const AppBarTheme(brightness: Brightness.dark),
            textTheme: GoogleFonts.poppinsTextTheme()),
        home: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 0)),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return const WayPage();
              }
              return const SplashScreen();
            })),
      ),
    );
  }
}
