import 'package:dio/dio.dart';
import 'package:doctor/modules/pharmacy/model/cart.dart';
import 'package:doctor/modules/pharmacy/model/order.dart';
import 'package:doctor/modules/pharmacy/model/product.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/loader.dart';
import 'package:doctor/utils/toasts.dart';

import '../../../utils/endpoint.dart';

class ProductController {
  Future<void> addProduct(Product product) async {
    try {
      launchLoader();
      FormData formData = FormData();

      for (var file in product.imageFiles) {
        formData.files.addAll([
          MapEntry(
              "file",
              await MultipartFile.fromFile(file.path,
                  filename: file.path.split("/").last))
        ]);
      }
      formData.fields.addAll([
        MapEntry("name", product.name),
        MapEntry("price", product.price.toString()),
        MapEntry("amount", product.amount.toString()),
        MapEntry("discount", product.discount.toString()),
        MapEntry("description", product.description),

        // MapEntry("post_category_uuid", post.category.uuid)
      ]);
      var response = await Dio().post('${production}products/',
          options: Options(
              headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
          data: formData);
      if (response.data['status'] == true) {
        removeGetWidget();
        removeGetWidget();
        await getProducts();

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
    }
  }

  Future<void> addToCart(Product product) async {
    try {
      launchLoader();

      var response = await Dio().post(
        '${production}products/cart/${product.uuid}',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      if (response.data['status'] == true) {
        removeGetWidget();
        await getProducts();
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
    }
  }

  Future<void> orderCartProducts(List<Cart> cartList) async {
    try {
      launchLoader();
      List<String> productsUUID = [];
      for (var cart in cartList) {
        Product product = cart.product;
        for (var i = 0; i < product.total; i++) {
          productsUUID.add(product.uuid);
        }
      }
      var productUUIDString = productsUUID.join(',');
      var response = await Dio().post('${production}products/order/',
          options: Options(
              headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
          data: {"products_uuid": productUUIDString});
      if (response.data['status'] == true) {
        removeGetWidget();
        await getOrders();
        await getCartProducts();
        // redirectTo(const WayPage());
      }
      if (response.data['status'] == false) {
        removeGetWidget();
        errorToast(response.data);
      }
    } on DioError catch (e) {
      removeGetWidget();
      errorToast(e.response!.data['error']);
    }
  }

  Future<void> getOrders() async {
    try {
      var response = await Dio().get('${production}products/order',
          options: Options(
            headers: {'Authorization': 'bearer ${getMyInfo().tokens}'},
          ));
      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getOrders();
        box.clear().then((value) {
          for (var result in results) {
            Order order = Order.findJson(result);
            order.localizeInfo();
          }
        });
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
    } on DioError catch (e) {
      errorToast(e.response!.data['message']);
    }
  }

  Future<void> getProducts() async {
    try {
      var response = await Dio().get('${production}products/',
          options: Options(
            headers: {'Authorization': 'bearer ${getMyInfo().tokens}'},
          ));
      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getProducts();
        box.clear().then((value) {
          for (var result in results) {
            Product product = Product.fromJson(result);
            product.localizeInfo();
          }
        });
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
    } on DioError catch (e) {
      errorToast(e.response!.data['message']);
    }
  }

  Future<void> getCartProducts() async {
    try {
      var response = await Dio().get('${production}products/cart',
          options: Options(
            headers: {'Authorization': 'bearer ${getMyInfo().tokens}'},
          ));
      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getCartProducts();
        box.clear().then((value) {
          for (var result in results) {
            Cart cart = Cart.fromJson(result);
            cart.localizeInfo();
          }
        });
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
    } on DioError catch (e) {
      errorToast(e.response!.data['message']);
    }
  }
}
