import 'dart:convert';
import 'package:flutter/services.dart' as bundle;

class DataService {
  static final DataService _instance = DataService.init();
  static DataService get instance => _instance;
  DataService.init();

  List alldata = [];

  Future getdata() async {
    final data =
        await bundle.rootBundle.loadString('lib/data/product_data.json');

    List lst = jsonDecode(data) as List;

    alldata = lst;

  }
}
