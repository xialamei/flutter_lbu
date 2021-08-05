import 'package:flutter/cupertino.dart';
import 'home_model.dart';


class HomeProvider extends ChangeNotifier {

  HomeModel  homeModel = null;

  getHomeData(HomeModel list) {
    homeModel = list;
    notifyListeners();
  }




}