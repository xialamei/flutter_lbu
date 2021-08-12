import 'package:flutter/cupertino.dart';
import 'package:my_flutter/page/details/detailmodel.dart';


class ScanProvider extends ChangeNotifier {
  bool  showAppbar = false;

  setShowAppbar(bool show) {
    showAppbar = show;
    notifyListeners();
  }



}