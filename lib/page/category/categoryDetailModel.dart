class CategoryDetailModel {
  int code;
  String msg;
  CategoryDetailDataModel data;

  CategoryDetailModel({this.code, this.msg, this.data});

  CategoryDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new CategoryDetailDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class CategoryDetailDataModel {
  int stateCode;
  String message;
  ReturnData returnData;

  CategoryDetailDataModel({this.stateCode, this.message, this.returnData});

  CategoryDetailDataModel.fromJson(Map<String, dynamic> json) {
    stateCode = json['stateCode'];
    message = json['message'];
    returnData = json['returnData'] != null
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
  List<Comics> comics;
  bool hasMore;

  DefaultParameters defaultParameters;
  int page;

  ReturnData(
      {this.comics,
        this.hasMore,

        this.defaultParameters,
        this.page});

  ReturnData.fromJson(Map<String, dynamic> json) {
    if (json['comics'] != null) {
      comics = new List<Comics>();
      json['comics'].forEach((v) {
        comics.add(new Comics.fromJson(v));
      });
    }
    hasMore = json['hasMore'];

    defaultParameters = json['defaultParameters'] != null
        ? new DefaultParameters.fromJson(json['defaultParameters'])
        : null;
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comics != null) {
      data['comics'] = this.comics.map((v) => v.toJson()).toList();
    }
    data['hasMore'] = this.hasMore;

    if (this.defaultParameters != null) {
      data['defaultParameters'] = this.defaultParameters.toJson();
    }
    data['page'] = this.page;
    return data;
  }
}

class Comics {
  String cover;
  int comicId;
  String description;
  String shortDescription;
  int isVip;
  String name;
  int flag;
  List<String> tags;
  String author;
  String vipIcon;

  Comics(
      {this.cover,
        this.comicId,
        this.description,
        this.shortDescription,
        this.isVip,
        this.name,
        this.flag,
        this.tags,
        this.author,this.vipIcon});

  Comics.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    comicId = json['comicId'];
    description = json['description'];
    shortDescription = json['short_description'];
    isVip = json['is_vip'];
    name = json['name'];
    flag = json['flag'];
    tags = json['tags'].cast<String>();
    author = json['author'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['comicId'] = this.comicId;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['is_vip'] = this.isVip;
    data['name'] = this.name;
    data['flag'] = this.flag;
    data['tags'] = this.tags;
    data['author'] = this.author;
    return data;
  }
}

class DefaultParameters {
  int defaultSelection;
  int defaultArgCon;
  String defaultConTagType;

  DefaultParameters(
      {this.defaultSelection, this.defaultArgCon, this.defaultConTagType});

  DefaultParameters.fromJson(Map<String, dynamic> json) {
    defaultSelection = json['defaultSelection'];
    defaultArgCon = json['defaultArgCon'];
    defaultConTagType = json['defaultConTagType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defaultSelection'] = this.defaultSelection;
    data['defaultArgCon'] = this.defaultArgCon;
    data['defaultConTagType'] = this.defaultConTagType;
    return data;
  }
}

