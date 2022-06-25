import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organic/core/components/themes/all_themes.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/service/data_service.dart';
import 'package:organic/views/home/state/homeState.dart';

class HomeCubit extends Cubit<MainState> {
  HomeCubit() : super(HomeState());

  changeState(MainState state) {
    emit(state);
  }

  int currentIndex = 0;

  List categoriesList = [
    'assets/images/broccoli.png',
    'assets/images/banana.png',
    'assets/images/meat.png'
  ];

  static bool dark = false;

  changeMode() {
    if (dark == false) {
      dark = true;
      emit(Explorestate());
    } else {
      dark = false;
      emit(Explorestate());
    }
  }

  List categoriesName = ['Vegetables', 'Fruits', 'Meats'];

  List mostSearched = ['Onion', 'Watermelon', 'Blackurrant', 'Mushroom'];

  final Set searchedItems = {};

  search(String text) {
    for (var i = 0; i < DataService.instance.alldata[0].length; i++) {
      if (text.isEmpty) {
        searchedItems.clear();
      } else if (DataService.instance.alldata[0][i]['name']
          .toString()
          .toLowerCase()
          .contains(text.toString().toLowerCase())) {
        debugPrint(DataService.instance.alldata[0][i]['name'].toString());
        searchedItems.add(DataService.instance.alldata[0][i]);
      }
    }
  }

  List<String> cuponssub = [
    '7 days remaining',
    '7 days remaining',
    '7 days remaining',
    '0 days remaining',
  ];

  List<String> cupons = [
    '15% Discount all item',
    'Free Shipping',
    '10% Discount all item',
    'Free Shipping',
  ];

  List<Color> colorList = [
    ColorConst.whiteGreen,
    ColorConst.whitePink,
    ColorConst.whiteYellow,
    ColorConst.whiteblue,
    ColorConst.whiteGreen,
    ColorConst.whitePink,
    ColorConst.whiteYellow,
  ];

  int kg = 1;

  buymore() {
    kg++;
  }

  int random = Random().nextInt(4);

  static List<int> randoms = List.generate(4, (index) => Random().nextInt(4));

  onStateChange(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        return emit(HomeState());
      case 1:
        return emit(Explorestate());
      case 2:
        return emit(CartState());
      case 3:
        return emit(ProfileState());
    }
  }

  // Icons list for profile page
  List profileIconList = [
    IconConst.profilewhite,
    IconConst.documentwhite,
    IconConst.heartwhite,
    IconConst.locationwhite,
    IconConst.creditcardwhite,
    IconConst.headphonewhite,
    IconConst.lockwhite,
    IconConst.logoutwhite
  ];

  // Title list for profile page
  List titleList = [
    "Edit Profile",
    "My Orders",
    "My Wishlist",
    "My Address",
    "Payment Method",
    "Customer Service",
    "Change Password",
    "Logout"
  ];
  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController ccvController = TextEditingController();
  TextEditingController expiresController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  bool _isShown = true;

  get getShown => _isShown;

  void obSecure() {
    _isShown = !_isShown;
  }

  final imagePicker = ImagePicker();
  XFile? image;

  void fromGallery() async {
    image = (await imagePicker.pickImage(source: ImageSource.gallery))!;
    // emit(HomeState());
  }

  String groupValue = "radios";

  void radioButton(dynamic v) {
    groupValue = v;
  }
}
