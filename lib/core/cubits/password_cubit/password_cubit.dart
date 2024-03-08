import 'package:bloc/bloc.dart';
import 'package:easy_shop/core/cubits/login_cubit/login_cubit.dart';
import 'package:easy_shop/core/models/password_model/forget_password_model.dart';
import 'package:easy_shop/public/shared/remote/logic/dio_helper.dart';
import 'package:easy_shop/public/shared/remote/logic/endPoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordInitial());

  static PasswordCubit get(context) => BlocProvider.of(context);

  late ForgetPasswordModel forgetPasswordModel;

  void forgetPassword({
    required String email,
  }) {
    emit(PasswordLoadingState());
    DioHelper.postData(url: Endpoints.forgetPassword, data: {
      "email": email,
    }).then((value) {
      forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);
      print('${forgetPasswordModel.message}');
      emit(PasswordSuccessState());
    }).catchError((onError) {
      emit(PasswordFailedState(msg: onError.toString()));
      print(onError);
    });
  }
}
