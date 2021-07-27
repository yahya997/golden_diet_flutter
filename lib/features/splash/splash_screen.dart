import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golden_diet/features/splash/intro_screen.dart';
import 'package:golden_diet/get_it.dart';
import 'package:golden_diet/routing/navigation_service.dart';
import 'package:golden_diet/utils/const.dart';
import 'package:golden_diet/utils/widgets/custom_text_widget.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    goToIntroSlider();
    animationController = new AnimationController(
        duration: Duration(seconds: 2), vsync: this)..addListener(() =>
        setState(() {}));
    animation = Tween(begin: -200.0, end: -25.0).animate(animationController);
    animationController.forward();
  }


  stopRotation() {
    animationController.stop();
  }


  @override
  void dispose() {
    stopRotation();
    super.dispose();
  }
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
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Container(
                    width: 70.w,
                    height: 70.w,
                    padding: EdgeInsets.all(3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff5F5F60).withOpacity(.2),
                          offset: Offset(0.0, 3.0),
                          blurRadius: 3.0,
                        ),
                      ],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/images/golden_diet.png',height: 200,width: 250,),
                        AnimatedBuilder(
                            animation: animation,
                            builder: (context, child) {
                              //print(animation.value );
                              return Transform.translate(
                                  offset: Offset(animation.value,0),
                                  child: Container(
                                      child: Image.asset('assets/images/golden_diet_logo.png',width: 180,height: 200,)));
                            })
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    color: kMainColor.withOpacity(0.5),
                    child: CustomTextWidget(
                      title:animation.status ==AnimationStatus.completed ? 'شريكك الدائم للحفاظ على صحتك' : 'أكلك الصحي يوصلك لباب بيتك' ,
                      color:Colors.white,
                      size: 14.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return Transform.rotate(
                            angle: animationController.value * 20,
                            child: Image.asset('assets/images/loading.png'));
                      })

                ],
              ),
            ),
          )
        ),
      ),
    );
  }
  goToIntroSlider() {
    Timer(Duration(seconds: 4), navigationPage);
  }
  void navigationPage() {
    getIt<NavigationService>().navigateToAndRemove(IntroScreen.id);
  }
}
