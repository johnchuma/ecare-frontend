import 'package:dio/dio.dart';
import 'package:doctor/modules/pharmacy/model/product_category.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/endpoint.dart';
import 'package:doctor/utils/loader.dart';
import 'package:doctor/utils/toasts.dart';

class ProductCategoryController {
  Future<void> addProductCategory(ProductCategory category) async {
    try {
      launchLoader();

      FormData formData = FormData.fromMap({
        'name': category.name,
        'file': await MultipartFile.fromFile(category.imageFile.path,
            filename: category.image.split('/').last)
      });
      var response = await Dio().post('${production}productCategory/',
          options: Options(
            headers: {'Authorization': 'bearer ${getMyInfo().tokens}'},
          ),
          data: formData);

      if (response.data['status'] == true) {
        await getProductCategories();
        removeGetWidget();
      }
      if (response.data['status'] == false) {
        removeGetWidget();
        errorToast(response.data);
      }
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      errorToast(e.response!.data['message']);
    }
  }

  Future<void> getProductCategories() async {
    try {
      var response = await Dio().get('${production}productCategory/',
          options: Options(
            headers: {'Authorization': 'bearer ${getMyInfo().tokens}'},
          ));
      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getProductCategories();
        box.clear().then((value) {
          for (var result in results) {
            ProductCategory category = ProductCategory.fromJson(result);
            category.localizeInfo();
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
