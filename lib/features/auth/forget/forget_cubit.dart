import 'package:bloc/bloc.dart';

import 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetState().init());
}
