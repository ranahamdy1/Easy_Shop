import 'package:bloc/bloc.dart';
import 'package:easy_shop/core/models/login_model.dart';
import 'package:easy_shop/public/shared/remote/logic/dio_helper.dart';
import 'package:easy_shop/public/shared/remote/logic/endPoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());


  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  void login({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: Endpoints.login, data: {
      "email": email,
      "phone": password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print('${loginModel.message}');
      emit(LoginSuccessState());
    }).catchError((onError) {
      emit(LoginFailedState(msg: onError.toString()));
      print(onError);
    });
  }

}
