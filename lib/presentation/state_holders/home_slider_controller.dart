import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/slider_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class HomeSliderController extends GetxController{
  bool _getHomeSlidersController =false;
  String _message='';
  SliderModel _sliderModel=SliderModel();
  SliderModel get sliderModel=>SliderModel();

  bool get getHomeSlidersInprogress=> _getHomeSlidersController;
  String get message=>_message;

  Future<bool> getHomeSlider()async{
    _getHomeSlidersController=true;
    update();
    final NetworkResponse response=await NetworkCaller.getRequest(Urls.getHomeSliders);
    _getHomeSlidersController=false;
    if(response.isSuccess){
      _sliderModel=SliderModel.fromJson(response.responseJson??{});
      update();
      return true;
    }else{
      update();
      return false;
    }
  }
}