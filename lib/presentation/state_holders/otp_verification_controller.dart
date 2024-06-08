import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class OtpVerificationController extends GetxController{
  bool _otpVerificationInprogress =false;
  String _message='';
  bool get otpVerificationInprogress=> _otpVerificationInprogress;
  String get message=>_message;

  Future<bool> verifyOtp(String email, String otp)async{
    _otpVerificationInprogress=true;
    update();
    final NetworkResponse response=await NetworkCaller.getRequest(Urls.verifyOtp(email, otp));
    _otpVerificationInprogress=false;
    update();
    if(response.isSuccess){
      _message=response.responseJson?['data']??'';
      return true;
    }else{
      _message=response.responseJson?['data']??'';
      _otpVerificationInprogress = false;
      return false;
    }
  }
}