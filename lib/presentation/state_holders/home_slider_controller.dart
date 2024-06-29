import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/slider_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class HomeSliderController extends GetxController{
  bool _getHomeSlidersInprogress =false;
  SliderModel _sliderModel=SliderModel();
  String _message='';

  SliderModel get sliderModel=>_sliderModel;

  bool get getHomeSlidersInprogress=> _getHomeSlidersInprogress;
  String get message=>_message;

  Future<bool> getHomeSlider()async{
    _getHomeSlidersInprogress=true;
    update();
    final NetworkResponse response=await NetworkCaller.getRequest(Urls.getHomeSliders);
    _getHomeSlidersInprogress=false;
    if(response.isSuccess){
      _sliderModel=SliderModel.fromJson(response.responseJson??{});
      update();
      return true;
    }else{
      _message = 'Sliders data fetch failed!';
      update();
      return false;
    }
  }
}