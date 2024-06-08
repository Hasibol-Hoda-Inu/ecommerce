import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class EmailVerificationController extends GetxController{
  bool _emailVerificationInprogress =false;
  String _message='';
  bool get emailVerificationInprogress=> _emailVerificationInprogress;
  String get message=>_message;

  Future<bool> verifyEmail(String email)async{
    _emailVerificationInprogress=true;
    update();
    final NetworkResponse response=await NetworkCaller.getRequest(Urls.verifyEmail(email));
    _emailVerificationInprogress=false;
    update();
    if(response.isSuccess){
      _message=response.responseJson?['data']??'';
      return true;
    }else{
      _message=response.responseJson?['data']??'';
      _emailVerificationInprogress=true;
      return false;
    }
  }
}