import 'package:provider/provider.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DataMulti extends ChangeNotifier {
  String _id = '';
  String _password = '';
  String _check_password = '';
  String _name = '';
  String _phone = '';
  String _bithdaty = '';
  String _gender = '';
  String _carName = '';
  String _carNumber = '';
  String _cardtype = '1';
  String _chargecardcompnay = '1';
  String _chargeCardNumber = '';

  String _accestokken = '';
  String _refreshtokken = '';

  String _Currentuser = '';
  String _changepassword = '';
  String _changepasswordcheck = '';
  String _changecarnumber = '';
  String _changecarName = '';

  String _newvalueofchargecardnumner = '';
  String _newchargecardtype = '';
  var _data = '';


  String _creditCardnumber = '';
  String _creditCardExpiremonth = '';
  String _creditCardExpireyear = '';
  String _creditCardPassword = '';


  String _verificationname = '';
  String  _verificationidcard = '';
  String _verificationgender = '';
  String _verificationmobileno = '';


  String _creditCardnumberregist = '';
  String _creditCardExpiremonthregist = '';
  String _creditCardExpireyearregist = '';
  String _creditCardPasswordregist = '';


  String _findName = '';
  String _findPhone = '';


  String _postalcode = '';
  String _address =  '';



  String _creditcardregistnumber1 = '';
  String _creditcardregistnumber2 = '';
  String _creditcardregistnumber3 = '';
  String _creditcardregistnumber4 = '';

  DataMulti(
      this._id,
      this._password,
      this._check_password,
      this._name,
      this._phone,
      this._bithdaty,
      this._gender,
      this._carNumber,
      this._cardtype,
      this._chargeCardNumber,
      this._accestokken,
      this._Currentuser,
      this._data);


  String get creditcardregistnumber1 => _creditcardregistnumber1;
  String get creditcardregistnumber2 => _creditcardregistnumber2;
  String get creditcardregistnumber3 => _creditcardregistnumber3;
  String get creditcardregistnumber4 => _creditcardregistnumber4;

  String get postalcode => _postalcode;
  String get adress => _address;

  String get findname => _findName;
  String get findphone => _findPhone;

  String get creditCardNumberregist  => _creditCardnumberregist;
  String get creditCardExpireMonthregist => _creditCardExpiremonthregist;
  String get creditCardExpireYearregist => _creditCardExpireyearregist;
  String get creditCardpasswordregist => _creditCardPasswordregist;


  String get creditCardNumber  => _creditCardnumber;
  String get creditCardExpireMonth => _creditCardExpiremonth;
  String get creditCardExpireYear => _creditCardExpireyear;
  String get creditCardpassword => _creditCardPassword;


  String get newvalueofchargecardnumner => _newvalueofchargecardnumner;
  String get newchargecardtype => _newchargecardtype;

  String get id => _id;

  String get password => _password;

  String get check_password => _check_password;

  String get name => _name;

  String get phone => _phone;

  String get bithdaty => _bithdaty;

  String get gender => _gender;

  String get carName => _carName;

  String get carNumber => _carNumber;

  String get cardtype => _cardtype;

  String get chargecardcompnay => _chargecardcompnay;

  String get chargeCardNumber => _chargeCardNumber;

  String get accestokken => _accestokken;
  String get refreshtokken => _refreshtokken;

  String get currentuser => _Currentuser;

  String get changepassword => _changepassword;

  String get changepasswordcheck => _changepasswordcheck;

  String get changecarnumber => _changecarnumber;
  get data => _data;

  String get changecarname => _changecarName;

  String get verificationname => _verificationname;
  String get verificationidcard => _verificationidcard;
  String get verificationgender => _verificationgender;
  String get verificationmobileno => _verificationmobileno;


  void setcreditcardregistnumber1(String newvalue){
    _creditcardregistnumber1 = newvalue;
    notifyListeners();
  }
  void setcreditcardregistnumber2(String newvalue){
    _creditcardregistnumber2 = newvalue;
    notifyListeners();
  }
  void setcreditcardregistnumber3(String newvalue){
    _creditcardregistnumber3 = newvalue;
    notifyListeners();
  }
  void setcreditcardregistnumber4(String newvalue){
    _creditcardregistnumber4 = newvalue;
    notifyListeners();
  }

  void setpostalcode(String newvalue){
    _postalcode = newvalue;
    notifyListeners();
  }

  void setadrress(String newvalue){
    _address = newvalue;
    notifyListeners();
  }


  void setfindname(String newvalue){
    _findName = newvalue;
    notifyListeners();
  }

  void setfindphone(String newvalue){
    _findPhone = newvalue;
    notifyListeners();
  }


  void setverificationname(String newvalue){
    _verificationname = newvalue;
    notifyListeners();
  }

  void setverificationidcard(String newvalue){
    _verificationidcard = newvalue;
    notifyListeners();
  }

  void setverificationgender(String newvalue){
    _verificationgender = newvalue;
    notifyListeners();
  }

  void setverificationmobileno(String newvalue){
    _verificationmobileno = newvalue;
    notifyListeners();
  }



  void setchangebankcardnumberregist(String newvalue){
    _creditCardnumberregist = newvalue;
    notifyListeners();
  }

  void setchangebankcardmonthregist(String newvalue){
    _creditCardExpiremonthregist = newvalue;
    notifyListeners();
  }

  void setchangebankcardyearregist(String newvalue){
    _creditCardExpireyearregist = newvalue;
    notifyListeners();
  }
  void setchangebankcardpasswordregist(String newvalue){
    _creditCardPasswordregist = newvalue;
    notifyListeners();
  }



  void setchangebankcardnumber(String newvalue){
    _creditCardnumber = newvalue;
    notifyListeners();
  }

  void setchangebankcardmonth(String newvalue){
   _creditCardExpiremonth = newvalue;
   notifyListeners();
  }

  void setchangebankcardyear(String newvalue){
  _creditCardExpireyear = newvalue;
  notifyListeners();
  }
  void setchangebankcardpassword(String newvalue){
    _creditCardPassword = newvalue;
    notifyListeners();
  }



  void setnewchargecardtype(String newvalue){
    _newchargecardtype = newvalue;
    notifyListeners();
  }

  void setnewvalueofChargeCardNumber(String newvalue){
    _newvalueofchargecardnumner = newvalue;
    notifyListeners();
  }



  void setchangecarname(String nevalue){
    _changecarName = nevalue;
    notifyListeners();
  }
  void setCarNumber(String value){
    _changecarnumber = value;
    notifyListeners();
  }

  void setpassword(String value){
    _changepassword = value;
    notifyListeners();
  }

  void setpasswordcheck(String value){
    _changepasswordcheck = value;
    notifyListeners();
  }



  void setdata(datas) {
    _data = datas;
    notifyListeners();
  }

  void setCurrentUSer(String newstring) {
    _Currentuser = newstring;
    notifyListeners();
  }

  void settokken(String newstring) {
    _accestokken = newstring;
    notifyListeners();
  }

  void refreshtokken_f(String value){
    _refreshtokken = value;
    notifyListeners();
  }


  void getcardtype(String newstring) {
    _cardtype = newstring;
    notifyListeners();
  }

  void getcarname(String carname){
    _carName = carname;
    notifyListeners();
  }

  void getchargecardcompnay(String newstring) {
    _chargecardcompnay = newstring;
    notifyListeners();
  }

  void getchargeCardNumber(String newstring) {
    _chargeCardNumber = newstring;
    notifyListeners();
  }

  void getCarNumber(String newstring) {
    _carNumber = newstring;
    notifyListeners();
  }

  void getid(String newstring) {
    _id = newstring;
    notifyListeners();
  }

  void getbithday(String newstring) {
    _bithdaty = newstring;
    notifyListeners();
  }

  void getgender(String newstring) {
    _gender = newstring;
    notifyListeners();
  }

  void chagnePassword(String newString) {
    _password = newString;
    notifyListeners();
  }

  void checkPassword(String newString) {
    _check_password = newString;
    notifyListeners();
  }

  void changeName(String newString) {
    _name = newString;
    notifyListeners();
  }

  void changePhone(String newString) {
    _phone = newString;
    notifyListeners();
  }
}
