import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:golden_diet/features/register/login_screen.dart';
import 'package:golden_diet/get_it.dart';
import 'package:golden_diet/helpers/helper_lang.dart';
import 'package:golden_diet/models/page_model.dart';
import 'package:golden_diet/routing/navigation_service.dart';
import 'package:golden_diet/utils/const.dart';
import 'package:golden_diet/utils/shared_preferences.dart';
import 'package:golden_diet/utils/widgets/content_page_view.dart';
import 'package:golden_diet/utils/widgets/custom_text_widget.dart';
import 'package:sizer/sizer.dart';

class IntroScreen extends StatefulWidget {
  static const String id = 'IntroScreen';

  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController controller =
      PageController(viewportFraction: 1, keepPage: true);
  var currentPageValue = 0.0;
  late List<PageModel> pages;
  late int currentPage;

  void _addPages() {
    pages = [];
    pages.add(PageModel(
        0,
        '${getTranslated(context, 'intro_1')}',
        '${getTranslated(context, 'intro_details_1')}',
        'assets/images/img1.png'));
    pages.add(PageModel(
        1,
        '${getTranslated(context, 'intro_2')}',
        '${getTranslated(context, 'intro_details_2')}',
        'assets/images/img2.png'));
    pages.add(PageModel(
        2,
        '${getTranslated(context, 'intro_3')}',
        '${getTranslated(context, 'intro_details_3')}',
        'assets/images/img3.png'));
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {

                },
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(14),
                    child: Icon(
                      Icons.arrow_forward_ios,
                    )),
              ),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    currentPage = index;
                    return ContentPageView(pages, index);
                  },
                  itemCount: pages.length,
                  controller: controller,
                ),
              ),
              GestureDetector(
                onTap: ()async{
                  if (currentPage == 2) {
                    await savePrefBool(skip_intro, true);
                    // Navigator.pushNamed(context, RegisterScreen.id);
                    getIt<NavigationService>().navigateTo(LoginScreen.id);
                  } else {
                    setState(() {
                      currentPage = controller.page!.toInt();
                      log('currentPage => $currentPage');
                      controller.jumpToPage(++currentPage);
                    });
                  }
                },
                child: Text('\t\t${getTranslated(context, 'next')}\t\t',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: kMainColor,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.center),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: ()async{
                  await savePrefBool(skip_intro, true);
                  getIt<NavigationService>().navigateTo(LoginScreen.id);
                },
                child: CustomTextWidget(
                  title: 'تخطي وإستمرار',
                ),
              ),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
