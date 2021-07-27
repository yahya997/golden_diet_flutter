import 'package:flutter/material.dart';
import 'package:golden_diet/features/home/home_screen.dart';
import 'package:golden_diet/features/register/forgot_password_screen.dart';
import 'package:golden_diet/features/register/register_screen.dart';
import 'package:golden_diet/get_it.dart';
import 'package:golden_diet/helpers/helper_lang.dart';
import 'package:golden_diet/routing/navigation_service.dart';
import 'package:golden_diet/utils/const.dart';
import 'package:golden_diet/utils/widgets/button_back_widget.dart';
import 'package:golden_diet/utils/widgets/custom_button_widget.dart';
import 'package:golden_diet/utils/widgets/custom_text_field.dart';
import 'package:golden_diet/utils/widgets/custom_text_widget.dart';
import 'package:golden_diet/utils/widgets/logo_widget.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  title: 'سجل دخولك عبر رقم الهاتف وكلمة المرور',
                  color: Color(0xff4B4B4B),
                  size: 13.sp,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  textEditingController: null,
                  labelText: 'ادخل رقم الجوال',
                  password: false,
                  keyboardType: TextInputType.phone,
                ),
                CustomTextField(
                  textEditingController: null,
                  labelText: 'ادخل كلمة المرور',
                  password: true,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: (){
                    getIt<NavigationService>()
                        .navigateTo(ForgotPasswordScreen.id);
                  },
                  child: CustomTextWidget(
                      title: 'هل نسيت كلمة المرور؟',
                      color: Color(0xff4B4B4B),
                      size: 11.sp,
                      fontWeight: FontWeight.w500),
                ),

                SizedBox(height: 30),
                CustomButtonWidget(
                  title: ' الدخول',
                  onClick: () {
                    getIt<NavigationService>().navigateTo(HomeScreen.id);
                  },
                  color: kButtonColor,
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      title: 'لا تملك حساب بعد؟  ',
                      size: 12.sp,
                    ),
                    GestureDetector(
                      onTap: () {
                        getIt<NavigationService>()
                            .navigateTo(RegisterScreen.id);
                      },
                      child: CustomTextWidget(
                        title: 'سجل الأن',
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
