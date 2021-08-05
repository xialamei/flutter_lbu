import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:my_flutter/provide/details_provider.dart';
import 'package:provider/provider.dart';
import 'detailmodel.dart';


class DetailScan extends StatelessWidget {

  var chapterNum = 0;

  @override
  Widget build(BuildContext context) {
    
    var chapters = context.watch<DetailsProvider>().chapters;
    ChapterList list = chapters[chapterNum];
    return Container();



  }
}
