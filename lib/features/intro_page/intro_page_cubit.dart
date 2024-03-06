import 'package:bloc/bloc.dart';

import 'intro_page_state.dart';

class Intro_pageCubit extends Cubit<Intro_pageState> {
  Intro_pageCubit() : super(Intro_pageState().init());
}
