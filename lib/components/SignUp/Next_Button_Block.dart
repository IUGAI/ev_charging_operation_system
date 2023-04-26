import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/screens/CardRegister.dart';
import 'package:provider/provider.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';
import 'package:ev_charging_operation_system/components/AlertWidget.dart';
import 'package:ev_charging_operation_system/model/UserInfo.dart';

class Next_Button extends StatelessWidget {
  const Next_Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stringProvider = Provider.of<DataMulti>(context);
    String passwordController = stringProvider.password;
    String passwordControllerchecked = stringProvider.check_password;
    String id = stringProvider.id;
    String name = stringProvider.verificationname;
    String phone = stringProvider.verificationmobileno;
    String bithday = stringProvider.verificationidcard;
    String gender = stringProvider.verificationgender;
    String car = stringProvider.carNumber;
        return
          Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: ElevatedButton(
            child: Text(
              '다음 ',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            ),
            onPressed: () {
              print('사용자 데이터');
              print('이메일 : ${id}');
              print('비밀번호 : ${passwordController}');
              print('비밀번호 확인 : ${passwordControllerchecked}');
              print('이름 :  ${name}');
              print('휴대전화  :  ${phone}');
              print('생년월  :  ${bithday}');
              print('성별  :  ${gender}');
              print('차량 번호 :  ${car}');
              if (passwordController != passwordControllerchecked){
                return showMyDialog(context, '비밀번호가 일치하지 않습니다');
              } else if (id.isEmpty){
                return showMyDialog(context, '이메일 입력되지 않습니다');
              } else if (passwordController.isEmpty){
                return showMyDialog(context, '비밀번호 입력되지 않습니다');
              }else if (name.isEmpty){
                return showMyDialog(context, '성명 입력되지 않습니다');
              }else if (phone.isEmpty){
                return showMyDialog(context, '휴대전화번호 입력되지 않습니다');
              }else if (bithday.isEmpty){
                return showMyDialog(context, '생년월 입력되지 않습니다');
              } else if (gender.isEmpty){
                return showMyDialog(context, '성별 입력되지 않습니다');
              } else {
                // Person person = Person(id,passwordController,name,phone,bithday,gender);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CardRegister();
                    },
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15),
              primary: Color(0xff73829E),
              onPrimary: Colors.white, // set the text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // set the border radius
              ),
            ),
          ),
        );
  }
}

void showMyDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShow(message: msg);
    },
  );
}

