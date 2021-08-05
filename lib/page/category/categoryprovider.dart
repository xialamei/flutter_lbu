import 'package:flutter/cupertino.dart';
import 'categorymodel.dart';

import 'categoryDetailModel.dart';

class CategoryProvider extends ChangeNotifier {

  ///分类页面
  CategoryModel  category;

  CategoryDetailModel details;

  getCategory(CategoryModel model) {
    category = model;
    notifyListeners();
  }


  ///点击分类-列表
  getDetails(CategoryDetailModel model) {
    details = model;
    notifyListeners();
  }
}