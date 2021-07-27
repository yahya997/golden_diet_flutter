import 'package:flutter/material.dart';
import 'package:golden_diet/models/page_model.dart';
import 'package:golden_diet/utils/const.dart';
import 'package:sizer/sizer.dart';
class ContentPageView extends StatelessWidget {
  final List<PageModel> pages;
  final int index;

  ContentPageView(this.pages, this.index);

  @override
  Widget build(BuildContext context) {
    return SizerUtil.orientation == Orientation.portrait ? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30.0.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  pages[index].image,
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(height: 5.0.h),
          Text(
            pages[index].title,
            style: TextStyle(
              color: kMainColor,
              fontSize: 22.0.sp,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            pages[index].description,
            style: TextStyle(
              color: kColorGray,
              fontSize: 12.0.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pages.map((e) {
              return buildIndicator(e, index);
            }).toList(),
          ),
        ],
      ),
    ) : Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Container(height: 200,width: 200,color: Colors.white,)
        Container(
          height: 30.0.h,
          width: MediaQuery.of(context).size.width *.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(
                pages[index].image,
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * .6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  pages[index].title,
                  style: TextStyle(
                    color: kMainColor,
                    fontSize: 20.0.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                child: Text(
                  pages[index].description,
                  style: TextStyle(
                    color: kColorGray,
                    fontSize: 12.0.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildIndicator(PageModel model, int index) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        height: 8,
        width: model.id == index ? 20 : 8,
        decoration: BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.circular(15)));
  }
}