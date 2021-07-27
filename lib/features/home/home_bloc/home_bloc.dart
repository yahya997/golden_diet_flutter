import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_diet/data/api_repository.dart';
import 'package:golden_diet/features/home/home_bloc/home_state.dart';
import 'package:golden_diet/get_it.dart';
import 'package:golden_diet/models/products_model.dart';

import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvents,HomeState>{
  HomeBloc() : super(const HomeState(onTabIndex: 2));

  ProductsModel? productsModel;

  @override
  Stream<HomeState> mapEventToState(HomeEvents event)async* {
    if(event is OnTabEvent){
      log('index => ${event.onTab}');
      yield state.copyWith(onTabIndex: event.onTab);
    } else if(event is FetchDataEvent){
      if(productsModel == null){
        yield state.copyWith(loading: true);

        productsModel = await getProducts();
      }

      yield state.copyWith(productsModel: productsModel,loading: false);
    }
  }

  Future<ProductsModel> getProducts() async {
    return await getIt<ApiRepo>().getProducts();
  }

}