import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:golden_diet/helpers/helper_lang.dart';
import 'package:golden_diet/utils/const.dart';
import 'package:golden_diet/utils/widgets/button_back_widget.dart';
import 'package:golden_diet/utils/widgets/custom_button_widget.dart';
import 'package:golden_diet/utils/widgets/custom_text_widget.dart';
import 'package:golden_diet/utils/widgets/text_field_search.dart';
import 'package:golden_diet/utils/widgets/text_field_with_hint.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class EnterLocationScreen extends StatefulWidget {
  static const String id ='EnterLocationScreen';
  const EnterLocationScreen({Key? key}) : super(key: key);

  @override
  _EnterLocationScreenState createState() => _EnterLocationScreenState();
}

class _EnterLocationScreenState extends State<EnterLocationScreen> {
  Completer<GoogleMapController> _mapController = Completer();
  late Map<MarkerId, Marker> _markers = {};
  String latitude = "";
  String longitude = "";
  String newLat = "";
  String newLog = "";
  int _markerIdCounter = 0;

  final _controller = TextEditingController();

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ادخل الموقع'),
        backgroundColor: kMainColor,
        automaticallyImplyLeading: false,
        actions: [
          ButtonBackWidget(),
          SizedBox(width: 10)],
      ),
      body: Stack(
        children: [
          latitude != "" || longitude != ""
              ? Container(
            child: GoogleMap(
              markers: Set<Marker>.of(_markers.values),
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    double.parse(latitude), double.parse(longitude)),
                zoom: 12.0,
              ),
              myLocationEnabled: true,
              onCameraMove: (CameraPosition position) {
                if (_markers.length > 0) {
                  MarkerId markerId = MarkerId(_markerIdVal());
                  Marker ?marker = _markers[markerId];
                  Marker updatedMarker = marker!.copyWith(
                    positionParam: position.target,
                  );
                  setState(() {
                    /*log('message => ${position.target.latitude}');
                          log('message1 => ${position.target.longitude}');*/
                   /* getIt<HomeProvider>().lat = position.target.latitude.toString();
                    getIt<HomeProvider>().long = position.target.longitude.toString();*/
                    _markers[markerId] = updatedMarker;
                  });
                }
              },
              gestureRecognizers: Set()
                ..add(Factory<EagerGestureRecognizer>(
                        () => EagerGestureRecognizer())),
            ),
          )
              : Container(),
          Container(
            height: 100,
            width: double.infinity,
            //color: Colors.white.withOpacity(0.7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldSearch(_controller)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.white.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextWidget(title: 'حدد موقعك  على الخريطة في الاعلى !',size: 15.sp,color: kMainColor)),
                    SizedBox(height: 5),
                    Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextWidget(title: 'ومن ثم ادخل تفاصيل المكان في الاسفل',size: 13.sp,)),
                    SizedBox(height: 8),
                    TextFieldWithHint(hint: 'ادخل اسم الشارع'),
                    SizedBox(height: 3),
                    TextFieldWithHint(hint: 'ادخل رقم العمارة'),
                    SizedBox(height: 3),
                    TextFieldWithHint(hint: 'اسم العنوان'),
                    SizedBox(height: 8),
                    CustomButtonWidget(
                      padding: 30,
                        title: '      ${getTranslated(context, 'save')}     ',
                        color: kMainColor,
                        onClick: () {
                          //Navigator.pushNamed(context, UnitPriceScreen.id);
                        }),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    LatLng INITIAL_LOCATION =
    LatLng(double.parse(latitude), double.parse(longitude));
    _mapController.complete(controller);
    if (INITIAL_LOCATION != null) {
      MarkerId markerId = MarkerId(_markerIdVal());
      LatLng position = INITIAL_LOCATION;
      Marker marker =
      Marker(markerId: markerId, position: position, draggable: false);
      setState(() {
        _markers[markerId] = marker;
      });

      Future.delayed(Duration(seconds: 1), () async {
        GoogleMapController controller = await _mapController.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: position,
              zoom: 17.0,
            ),
          ),
        );
      });
    }
  }

  String _markerIdVal({bool increment = false}) {
    String val = 'marker_id_$_markerIdCounter';
    if (increment) _markerIdCounter++;
    return val;
  }

  getUserLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
    });
  }
}
