import 'package:bloc/bloc.dart';

import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteState().init());
}
