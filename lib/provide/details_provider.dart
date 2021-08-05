import 'package:flutter/cupertino.dart';
import 'package:my_flutter/page/details/detailmodel.dart';

class DetailsProvider extends ChangeNotifier {

  DetailsModel  details;
  Comic comic;
  List<OtherWorks> others;

  List<Comic> guessLike;
  List<ChapterList> chapters;
  getDetailsModel(DetailsModel model) {
    details = model;
    comic = model.returnData.comic;
    others = model.returnData.otherWorks;
    chapters = model.returnData.chapterList;
    notifyListeners();
  }

  getGuessLike( List<Comic> list){
    guessLike = list;
    notifyListeners();
  }

  setChapts(List<ChapterList> list){
    chapters = list;

    notifyListeners();
  }

}