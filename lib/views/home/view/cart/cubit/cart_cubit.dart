import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/views/home/state/homeState.dart';

class CarCubit extends Cubit<MainState> {
  CarCubit() : super(HomeState());

  int currentpage = 0;

  changecatog(int index) {
    if (index == 0) {
      currentpage = 0;
      emit(CartState());
    } else {
      currentpage = 1;
      emit(state);
      emit(CartState());
    }

    debugPrint(currentpage.toString());
  }

  List<String> orderStatusTitles = [
    'Order Completed',
    'On Delivery',
    'Order Confirmed',
    'Order Received',
  ];


  List<String> orderStatusSubTitles = [
    '--:--',
    '10:10 AM',
    '9:55 AM',
    '9:50 AM',
  ];
}
