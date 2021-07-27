import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_diet/utils/const.dart';

import 'home_bloc/home_bloc.dart';
import 'home_bloc/home_state.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
      builder: (context, state) {
        if (state.loading) {
          return Center(child: CircularProgressIndicator());
        }
        if(state.productsModel == null){
          return Container();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Test Api'),
            backgroundColor: kMainColor,
          ),
          body: ListView.builder(
            itemCount: state.productsModel!.products!.length ,
            itemBuilder: (context, index) {
            return Text('${state.productsModel!.products![index].name}');
          },),
        );
      },
    );
  }
}
