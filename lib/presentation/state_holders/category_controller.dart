import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/models/category_model.dart';
import '../../data/utility/urls.dart';

class CategoryController extends GetxController{
  bool _getCategoriesInprogress =false;
  CategoryModel _categoryModel=CategoryModel();
  String _message='';

  CategoryModel get categoryModel=>_categoryModel;

  bool get getCategoriesInprogress=> _getCategoriesInprogress;
  String get message=>_message;

  Future<bool> getCategories()async{
    _getCategoriesInprogress=true;
    update();
    final NetworkResponse response=await NetworkCaller.getRequest(Urls.getCategories);
    _getCategoriesInprogress=false;
    if(response.isSuccess){
      _categoryModel=CategoryModel.fromJson(response.responseJson??{});
      update();
      return true;
    }else{
      _message = 'Category list data fetch failed!';
      update();
      return false;
    }
  }
}