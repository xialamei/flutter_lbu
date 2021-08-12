

const mainUrl = "http://app.u17.com/v3/appV3_3/ios/phone/";

const requestPath = {
  "recommendUrl": mainUrl + "comic/boutiqueListNew?sexType=1", //推荐
  "vipUrl": mainUrl + "list/vipList", //vip
  'categoryURl': mainUrl + 'sort/mobileCateList', //分类列表
  'categoryDetailUrl':mainUrl + 'list/commonComicList',//漫画列表

  'detailsUrl' : mainUrl + 'comic/detail_static_new',//详情  参数：comicid
  'detailRealUrl':mainUrl + 'comic/detail_realtime' ,//详情实时 参数：comicid
  'guessUrl' :mainUrl + 'comic/guessLike', //猜您喜欢

  'chapter':mainUrl + 'comic/chapterNew',//章节详情

};
