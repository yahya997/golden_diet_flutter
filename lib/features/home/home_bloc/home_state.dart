import 'package:equatable/equatable.dart';
import 'package:golden_diet/models/products_model.dart';

class HomeState extends Equatable {
   final int? onTabIndex;
   final ProductsModel? productsModel;
   final bool loading ;

   const HomeState({
     this.onTabIndex,
      this.productsModel,
     this.loading = false
  });

  HomeState copyWith({
    int ?onTabIndex,
    ProductsModel? productsModel,
    bool? loading,
  }) {
    return HomeState(
      onTabIndex: onTabIndex ?? this.onTabIndex,
      productsModel: productsModel ?? this.productsModel,
      loading: loading ?? this.loading
    );
  }

  @override
  List<Object?> get props => [
    onTabIndex,
    productsModel,
    loading
  ];
}
