import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_diet/features/home/home_bloc/home_bloc.dart';
import 'package:golden_diet/features/home/home_bloc/home_event.dart';
import 'package:golden_diet/features/home/screen1.dart';
import 'package:golden_diet/features/home/screen2.dart';
import 'package:golden_diet/features/home/screen3.dart';
import 'package:golden_diet/features/home/screen4.dart';
import 'package:golden_diet/get_it.dart';
import 'package:golden_diet/utils/const.dart';
import 'home_bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key ?key}) : super(key: key);
  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _buildScreens = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
    Screen4(),
  ];

  List<IconData> iconsSelected = [
    Icons.person,
    Icons.shopping_cart,
    Icons.home,
    Icons.file_copy_rounded,
    Icons.check_circle_outline,
  ];


  @override
  void initState() {
    getIt<HomeBloc>().add(FetchDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
      builder: (context, state) {
        return Scaffold(
        body: _buildScreens[state.onTabIndex!],
        floatingActionButton: FloatingActionButton(
          onPressed: () => getIt<HomeBloc>().add(OnTabEvent(onTab: 2)),
          child: Icon(iconsSelected[2],color: kMainColor),
          elevation:2.0,
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(iconsSelected[4],color: kMainColor),
                  onPressed: () => getIt<HomeBloc>().add(OnTabEvent(onTab: 4)),
                  padding: EdgeInsets.all(0.0),
                  iconSize: state.onTabIndex == 4
                      ? 30
                      : 25,
                ),
                IconButton(
                  icon: Icon(iconsSelected[3],color: kMainColor),
                  onPressed: () => getIt<HomeBloc>().add(OnTabEvent(onTab: 3)),
                  padding: EdgeInsets.all(0.0),
                  iconSize: state.onTabIndex == 3
                      ? 30
                      : 25,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                IconButton(
                  icon: Icon(iconsSelected[1],color: kMainColor),
                  onPressed: () => getIt<HomeBloc>().add(OnTabEvent(onTab: 1)),
                  padding: EdgeInsets.all(0.0),
                  iconSize: state.onTabIndex == 1
                      ? 30
                      : 25,
                ),
                IconButton(
                  icon: Icon(iconsSelected[0],color: kMainColor),
                  onPressed: () => getIt<HomeBloc>().add(OnTabEvent(onTab: 0)),
                  padding: EdgeInsets.all(0.0),
                  iconSize: state.onTabIndex == 0
                      ? 30
                      : 25,
                ),
              ],
            ),
          ),
          shape: CircularNotchedRectangle(),
          elevation:  15.0,
          color: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
      },
    );
  }
}

/*

  @override
  Widget build(BuildContext context) {
    print('object');
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
          icon: Image.asset('assets/images/home_icon.png'),
          activeIcon: Image.asset('assets/images/home_icon.png'),
          label: '',
          backgroundColor: Colors.white),
      BottomNavigationBarItem(
          icon: Image.asset('assets/images/home_icon.png'),
          activeIcon: Image.asset('assets/images/home_icon.png'),
          label: '',
          backgroundColor: Colors.white),
      BottomNavigationBarItem(
          icon: Image.asset('assets/images/home_icon.png'),
          activeIcon: Image.asset('assets/images/home_icon.png'),
          label: '',
          backgroundColor: Colors.white),
      BottomNavigationBarItem(
          icon: Image.asset('assets/images/home_icon.png'),
          activeIcon: Image.asset('assets/images/home_icon.png'),
          label: '',
          backgroundColor: Colors.white),


    ];
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: _buildScreens[state.onTabIndex],
          bottomNavigationBar: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    selectedItemColor: kMainColor,
                    unselectedItemColor: Color(0xffC6C6C6),
                    onTap: (index){
                      getIt<HomeBloc>().add(OnTabEvent(onTab: index));
                    },
                    elevation: 15,
                    mouseCursor: MouseCursor.defer,
                    type: BottomNavigationBarType.fixed,
                    showUnselectedLabels: true,
                    currentIndex: state.onTab,
                    items: items,
                  )

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width: 60,
                      height: 1,
                      color: state.onTab == 0 ? Color(0xff707070) : Colors.white),
                  Container(
                      width: 60,
                      height: 1,
                      color: state.onTab == 1 ? Color(0xff707070) : Colors.white),
                  Container(
                      width: 60,
                      height: 1,
                      color: state.onTab == 2 ? Color(0xff707070) : Colors.white),
                  Container(
                      width: 60,
                      height: 1,
                      color: state.onTab == 3 ? Color(0xff707070) : Colors.white),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

 */