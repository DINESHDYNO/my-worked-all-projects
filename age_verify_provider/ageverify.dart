import 'package:flutter/cupertino.dart';

class Eighteen_yers_above extends ChangeNotifier{
  String eighteen_yers_above_msg ='';
  bool? isEligible;

  void eligiblechek(int age){
    if(age>=18)
      eligibleForvote();
    else
      noteligibleForvote();
  }
  void eligibleForvote(){
    eighteen_yers_above_msg='You are eligible to vote';
    isEligible=true;
    notifyListeners();
  }
  void noteligibleForvote(){
    eighteen_yers_above_msg='You are not eligible to vote';
    isEligible=false;
    notifyListeners();
  }

}