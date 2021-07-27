import 'package:flutter/material.dart';
import 'package:golden_diet/features/register/enter_location_screen.dart';
import 'package:golden_diet/features/register/login_screen.dart';
import 'package:golden_diet/get_it.dart';
import 'package:golden_diet/helpers/helper_lang.dart';
import 'package:golden_diet/routing/navigation_service.dart';
import 'package:golden_diet/utils/const.dart';
import 'package:golden_diet/utils/widgets/button_back_widget.dart';
import 'package:golden_diet/utils/widgets/custom_button_widget.dart';
import 'package:golden_diet/utils/widgets/custom_radio.dart';
import 'package:golden_diet/utils/widgets/custom_text_field.dart';
import 'package:golden_diet/utils/widgets/custom_text_widget.dart';
import 'package:golden_diet/utils/widgets/logo_widget.dart';
import 'package:sizer/sizer.dart';

import 'enter_health_record_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String select ='0';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(height: 20),
                ButtonBackWidget(),
                LogoWidget(),
                CustomTextWidget(
                  title: getTranslated(context, 'hello'),
                  color: kMainColor,
                  size: 20.0.sp,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  fontWeight: FontWeight.w600,
                ),
                CustomTextWidget(
                  title: 'املاء البيانات التالية لإتمام إنشاء حسابك',
                  color: Color(0xff4B4B4B),
                  size: 13.sp,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  textEditingController: null,
                  labelText: 'الاسم كامل',
                  suffixIcon:'assets/images/user_icon.png',
                  password: false,
                ),
                CustomTextField(
                  textEditingController: null,
                  labelText: 'ادخل رقم الجوال',
                  keyboardType: TextInputType.phone,
                  password: false,
                ),
                CustomTextField(
                  textEditingController: null,
                  labelText: 'ادخل البريد الإلكتروني',
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: 'assets/images/email_icon.png',
                  password: false,
                ),
                CustomTextField(
                  textEditingController: null,
                  labelText: 'ادخل كلمة المرور',
                  password: true,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CustomRadio(title: 'أدخل سجلك الصحي',value: '1',click: (){
                      getIt<NavigationService>().navigateTo(EnterHealthRecordScreen.id);
                      /*setState(() {
                        select == '1'
                            ? select = '0'
                            : select = '1';
                      });*/
                    },selected: select,),
                    SizedBox(width: 10),
                    CustomRadio(title: 'ادخل الموقع',value: '1',click: (){
                      getIt<NavigationService>().navigateTo(EnterLocationScreen.id);
                      /*setState(() {
                    select == '1'
                        ? select = '0'
                        : select = '1';
                  });*/
                    },selected: select),
                  ],
                ),

                SizedBox(height: 30),
                CustomButtonWidget(
                  title: getTranslated(context, 'next'),
                  onClick: () {},
                  color: kButtonColor,
                ),
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      title: 'هل لديك حساب ؟',
                      size: 12.sp,
                    ),
                    GestureDetector(
                      onTap: (){
                        getIt<NavigationService>().navigateTo(LoginScreen.id);
                      },
                      child: CustomTextWidget(
                        title: 'قم بتسجيل الدخول',
                        size: 12.sp,
                        color: kMainColor,
                      ),
                    ),
                    SizedBox(height: 50)
                  ],
                )
              ],
            )),
      ),
    );
  }
}
