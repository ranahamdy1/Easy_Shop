import 'package:bloc/bloc.dart';
import 'package:easy_shop/core/models/product_model.dart';
import 'package:easy_shop/core/models/search_model.dart';
import 'package:easy_shop/public/shared/remote/logic/dio_helper.dart';
import 'package:easy_shop/public/shared/remote/logic/endPoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of(context);

  late ProductModel productModel;

  void getProduct() {
    emit(ProductLoadingState());
    DioHelper.getData(
      url: Endpoints.products,
    ).then((value) {
      productModel = ProductModel.fromJson(value.data);
      print('${productModel.message}');
      emit(ProductSuccessState());
    }).catchError((onError) {
      emit(ProductFailedState(msg: onError.toString()));
      print(onError);
    });
  }

  late SearchModel searchModel;

  void searchProduct({
    required String name,
    required int page,
  }) {
    emit(ProductLoadingState());
    DioHelper.getData(
        url: Endpoints.searchProducts,
        query: {"name": name, "page": page}).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print('${productModel.message}');
      emit(ProductSuccessState());
    }).catchError((onError) {
      emit(ProductFailedState(msg: onError.toString()));
      print(onError);
    });
  }
}
