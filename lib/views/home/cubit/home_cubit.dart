import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/views/home/state/homeState.dart';

class HomeCubit extends Cubit<MainState> {
  HomeCubit() : super(HomeState());

  int currentIndex = 0;

  onStateChange(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        return emit(HomeState());
      case 1:
        return emit(Explorestate());
      case 2:
        return emit(Explorestate());
      case 3:
        return emit(Explorestate());    
    }
  }
}
