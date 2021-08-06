class HomeModel {
  int code;
  HomeDataModel data;

  HomeModel({this.code, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = (json['data'] != null && !(json['data'].isEmpty)) ? new HomeDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class HomeDataModel {
  int stateCode;
  String message;
  ReturnData returnData;

  HomeDataModel({this.stateCode, this.message, this.returnData});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    stateCode = json['stateCode'];
    message = json['message'];
    returnData = (json['returnData'] != null && !(json['returnData'].isEmpty))
        ? new ReturnData.fromJson(json['returnData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateCode'] = this.stateCode;
    data['message'] = this.message;
    if (this.returnData != null) {
      data['returnData'] = this.returnData.toJson();
    }
    return data;
  }
}

class ReturnData {

  List<ComicLists> comicLists;
  String editTime;

  ReturnData(
      {  this.comicLists, this.editTime});

  ReturnData.fromJson(Map<String, dynamic> json) {

    if (json['comicLists'] != null && !(json['comicLists'].isEmpty)) {
      comicLists = new List<ComicLists>();
      json['comicLists'].forEach((v) {
        if (v != null && !(v.isEmpty)){
          comicLists.add(new ComicLists.fromJson(v));
        }
      });
    }
    editTime = json['editTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.comicLists != null && !(this.comicLists.isEmpty)) {
      data['comicLists'] = this.comicLists.map((v) => v.toJson()).toList();
    }
    data['editTime'] = this.editTime;
    return data;
  }
}

class ComicLists {
  List<Comics> comics;
  int comicType;
  int canedit;
  String sortId;
  String titleIconUrl;
  String newTitleIconUrl;
  String description;
  String itemTitle;
  String argName;
  int argValue;
  int argType;

  ComicLists(
      {this.comics,
        this.comicType,
        this.canedit,
        this.sortId,
        this.titleIconUrl,
        this.newTitleIconUrl,
        this.description,
        this.itemTitle,
        this.argName,
        this.argValue,
        this.argType});

  ComicLists.fromJson(Map<String, dynamic> json) {
    if (json['comics'] != null && !(json['comics'].isEmpty)) {
      comics = new List<Comics>();
      json['comics'].forEach((v) {
        if (v != null && !(v.isEmpty)) {
          comics.add(new Comics.fromJson(v));
        }
      });
    }
    comicType = json['comicType'];
    canedit = json['canedit'];
    sortId = json['sortId'];
    titleIconUrl = json['titleIconUrl'];
    newTitleIconUrl = json['newTitleIconUrl'];
    description = json['description'];
    itemTitle = json['itemTitle'];
    argName = json['argName'];
    argValue = json['argValue'];
    argType = json['argType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comics != null && !(this.comics.isEmpty)) {
      data['comics'] = this.comics.map((v) => v.toJson()).toList();
    }
    data['comicType'] = this.comicType;
    data['canedit'] = this.canedit;
    data['sortId'] = this.sortId;
    data['titleIconUrl'] = this.titleIconUrl;
    data['newTitleIconUrl'] = this.newTitleIconUrl;
    data['description'] = this.description;
    data['itemTitle'] = this.itemTitle;
    data['argName'] = this.argName;
    data['argValue'] = this.argValue;
    data['argType'] = this.argType;
    return data;
  }
}

class Comics {
  int comicId;
  String name;
  String cover;
  List<String> tags;
  String subTitle;
  String description;
  String cornerInfo;
  String shortDescription;
  String authorName;
  int isVip;

  Comics(
      {this.comicId,
        this.name,
        this.cover,
        this.tags,
        this.subTitle,
        this.description,
        this.cornerInfo,
        this.shortDescription,
        this.authorName,
        this.isVip});

  Comics.fromJson(Map<String, dynamic> json) {
    comicId = json['comicId'];
    name = json['name']== null ? "": json['name'];
    cover = json['cover'];
    tags = (json['tags']!= null && !(json['tags'].isEmpty)) ? json['tags'].cast<String>() : [];
    subTitle = json['subTitle'] == null ? "" : json['subTitle'];
    description = json['description'];
    cornerInfo = json['cornerInfo'];
    shortDescription = json['short_description'];
    authorName = json['author_name'];
    isVip = json['is_vip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comicId'] = this.comicId;
    data['name'] = this.name;
    data['cover'] = this.cover;
    data['tags'] = this.tags;
    data['subTitle'] = this.subTitle;
    data['description'] = this.description;
    data['cornerInfo'] = this.cornerInfo;
    data['short_description'] = this.shortDescription;
    data['author_name'] = this.authorName;
    data['is_vip'] = this.isVip;
    return data;
  }
}

