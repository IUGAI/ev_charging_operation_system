import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  String id = '';
  String password = '';
  String check_password = '';
  String name = '';
  String phone = '';
  String bithdaty = '';
  String gender = '';
  String carNumber = '';
  String cardtype = '';
  String chargecardcompnay = '';
  String chargeCardNumber = '';




  void getcardtype(String newstring){
    cardtype = newstring;
    notifyListeners();
  }

  void getchargecardcompnay(String newstring){
    chargecardcompnay = newstring;
    notifyListeners();
  }

  void getchargeCardNumber(String newstring){
    chargeCardNumber = newstring;
    notifyListeners();
  }

  void getCarNumber(String newstring){
    carNumber = newstring;
    notifyListeners();
  }

 void getid(String newstring) {
   id = newstring;
   notifyListeners();
 }

  void getbithday(String newstring) {
    bithdaty = newstring;
    notifyListeners();
  }

  void getgender(String newstring) {
    gender = newstring;
    notifyListeners();
  }

  void chagnePassword(String newString) {
    password = newString;
    notifyListeners();
  }

  void checkPassword(String newString){
    check_password = newString;
    notifyListeners();
  }

  void changeName(String newString){
    name = newString;
    notifyListeners();
  }


  void changePhone(String newString){
    phone = newString;
    notifyListeners();
  }
}
