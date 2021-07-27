import 'package:flutter/material.dart';
import 'package:golden_diet/get_it.dart';
import 'package:golden_diet/utils/const.dart';
import 'package:golden_diet/utils/widgets/button_back_widget.dart';
import 'package:golden_diet/utils/widgets/custom_radio.dart';
import 'package:golden_diet/utils/widgets/custom_radio_space.dart';
import 'package:golden_diet/utils/widgets/custom_text_field.dart';
import 'package:golden_diet/utils/widgets/custom_text_field_input.dart';
import 'package:golden_diet/utils/widgets/text_field_with_hint.dart';
import 'package:sizer/sizer.dart';
import 'package:golden_diet/utils/widgets/custom_text_widget.dart';

class EnterHealthRecordScreen extends StatefulWidget {
  static const String id = 'EnterHealthRecordScreen';

  const EnterHealthRecordScreen({Key? key}) : super(key: key);

  @override
  _EnterHealthRecordScreenState createState() =>
      _EnterHealthRecordScreenState();
}

class _EnterHealthRecordScreenState extends State<EnterHealthRecordScreen> {
  String genderSelected = '1';
  String typeSelected = '1';
  TextEditingController _textEditingController = TextEditingController();
  List<String> additionList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('أدخل سجلك الصحي'),
        backgroundColor: kMainColor,
        automaticallyImplyLeading: false,
        actions: [ButtonBackWidget(), SizedBox(width: 10)],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              CustomTextWidget(
                  title: 'الجنس:',
                  fontFamily: 'Cocon',
                  size: 14.sp,
                  color: Color(0xff4B4B4B)),
              SizedBox(width: 40),
              CustomRadio(
                title: 'ذكر',
                value: '1',
                selected: '1',
                click: () {},
              ),
              SizedBox(width: 20),
              CustomRadio(
                title: 'انثى',
                value: '0',
                selected: genderSelected,
                click: () {
                  setState(() {});
                },
              ),
            ],
          ),
          SizedBox(height: 15),
          Wrap(
            direction: Axis.horizontal,
            spacing: 5,
            runSpacing: 5,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextWidget(
                      title: 'العمر:',
                      fontFamily: 'Cocon',
                      size: 14.sp,
                      color: Color(0xff4B4B4B)),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: 20.w,
                      child: TextFieldWithHint(
                        hint: '25',
                        height: 40,
                        textEditingController: null,
                        centerHint: true,
                      )),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextWidget(
                      title: 'الوزن:',
                      fontFamily: 'Cocon',
                      size: 14.sp,
                      color: Color(0xff4B4B4B)),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: 20.w,
                      child: TextFieldInput(
                        suffix: ' Kg|',
                        hint: '25',
                        height: 40,
                        textEditingController: null,
                        centerHint: true,
                      )),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextWidget(
                      title: 'الوزن:',
                      fontFamily: 'Cocon',
                      size: 14.sp,
                      color: Color(0xff4B4B4B)),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: 20.w,
                      child: TextFieldInput(
                        suffix: ' cm|',
                        hint: '25',
                        height: 40,
                        textEditingController: null,
                        centerHint: true,
                      )),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextWidget(
                  title: 'الحالة الاجتماعية:',
                  fontFamily: 'Cocon',
                  size: 14.sp,
                  color: Color(0xff4B4B4B)),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  width: 30.w,
                  child: TextFieldWithHint(
                    hint: 'متزوج',
                    height: 40,
                    textEditingController: null,
                    centerHint: true,
                  )),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextWidget(
                  title: 'طبيعة العمل:',
                  fontFamily: 'Cocon',
                  size: 14.sp,
                  color: Color(0xff4B4B4B)),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  width: 30.w,
                  child: TextFieldWithHint(
                    hint: 'موظف',
                    height: 40,
                    textEditingController: null,
                    centerHint: true,
                  )),
            ],
          ),
          SizedBox(height: 20),
          CustomTextWidget(
              title: 'الأمراض والحالات المزمنة؟',
              fontFamily: 'Cocon',
              size: 16.sp,
              color: Color(0xff4B4B4B)),
          SizedBox(height: 10),
          Row(
            children: [
              CustomTextWidget(
                  title: 'السكري',
                  size: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff96999C)),
              SizedBox(width: 15.w),
              CustomRadio(
                  title: 'النوع الأول',
                  value: '1',
                  size: 12.0.sp,
                  color: Color(0xff96999C),
                  selected: typeSelected,
                  click: () {
                    setState(() {
                      typeSelected = '1';
                    });
                  }),
              SizedBox(width: 8.w),
              CustomRadio(
                  title: 'النوع الثاني',
                  value: '2',
                  size: 12.0.sp,
                  color: Color(0xff96999C),
                  selected: typeSelected,
                  click: () {
                    setState(() {
                      typeSelected = '2';
                    });
                  }),
            ],
          ),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'كوليسترول ',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'ارتفاع ضغط الدم',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 20),
          Row(
            children: [
              CustomTextWidget(
                  title: 'مشاكل في الجهاز الهضمي',
                  size: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff96999C)),
              SizedBox(width: 10),
              CustomRadio(
                  title: 'قولون',
                  value: '1',
                  size: 12.0.sp,
                  color: Color(0xff96999C),
                  selected: typeSelected),
              SizedBox(width: 10),
              CustomRadio(
                title: 'قرحة معدة',
                value: '2',
                size: 12.0.sp,
                color: Color(0xff96999C),
                selected: typeSelected,
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'حساسية من اي نوع من الطعام',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'فقر دم ( انيميا)',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'نقص فيتامين دال',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'تكيسات المبايض عند النساء',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'مشاكل في الكلى',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'ارتفاع اليورك اسد ( النقرس)',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 20),
          Row(
            children: [
              CustomTextWidget(
                  title: 'مشاكل في الكبد',
                  size: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff96999C)),
              SizedBox(width: 20),
              CustomRadio(
                  title: 'سرطان الكبد',
                  value: '1',
                  size: 12.0.sp,
                  color: Color(0xff96999C),
                  selected: typeSelected),
              SizedBox(width: 10),
              CustomRadio(
                title: 'سرطان الكبد',
                value: '2',
                size: 12.0.sp,
                color: Color(0xff96999C),
                selected: typeSelected,
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'خشونه في الركبة',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'الام في الرقبة او الظهر',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'كسل في الغده الدرقيه',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 10),
          CustomRadioSpace(
              title: 'سقوط في الشعر',
              value: '2',
              size: 12.0.sp,
              color: Color(0xff96999C),
              selected: typeSelected),
          SizedBox(height: 20),
          CustomTextWidget(
              title: 'امراض اخرى تعاني منها؟',
              size: 16.sp,
              fontFamily: 'Cocon',
              color: Color(0xff4B4B4B)),
          SizedBox(height: 20),
          textFieldAddition('مثال فقر الدم'),
          Column(
            children: additionList.map((e) => drawSingleRow(e)).toList(),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget textFieldAddition(String hint) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: kShadowColor.withOpacity(.2),
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          controller: _textEditingController,
          decoration: InputDecoration(
              suffixIconConstraints: BoxConstraints(
                maxWidth: 100,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    additionList.add(_textEditingController.text);
                    _textEditingController.text = '';
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(30)),
                    alignment: Alignment.center,
                    child: CustomTextWidget(
                      title: 'إضافة',
                      size: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              hintText: hint,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xff96999C),
                fontSize: 16.0.sp,
              ),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              border: InputBorder.none),
        ),
      ),
    );
  }

  Widget drawSingleRow(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CustomTextWidget(
              title: title,
              color: Color(0xff96999C),
              size: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Divider(color: Color(0xff24AE9E).withOpacity(0.5))
        ],
      ),
    );
  }
}
