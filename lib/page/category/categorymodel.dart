class CategoryModel {
  int code;
  CategoryDataModel data;

  CategoryModel({this.code, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new CategoryDataModel.fromJson(json['data']) : null;
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

class CategoryDataModel {
  int stateCode;
  String message;
  CategoryReturnDataModel returnData;

  CategoryDataModel({this.stateCode, this.message, this.returnData});

  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    stateCode = json['stateCode'];
    message = json['message'];
    returnData = json['returnData'] != null
        ? new CategoryReturnDataModel.fromJson(json['returnData'])
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

class CategoryReturnDataModel {
  List<RankingList> rankingList;
  String recommendSearch;

  CategoryReturnDataModel({this.rankingList, this.recommendSearch});

  CategoryReturnDataModel.fromJson(Map<String, dynamic> json) {
    if (json['rankingList'] != null) {
      rankingList = new List<RankingList>();
      json['rankingList'].forEach((v) {
        rankingList.add(new RankingList.fromJson(v));
      });
    }
    recommendSearch = json['recommendSearch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rankingList != null) {
      data['rankingList'] = this.rankingList.map((v) => v.toJson()).toList();
    }
    data['recommendSearch'] = this.recommendSearch;
    return data;
  }
}

class RankingList {
  int sortId;
  String sortName;
  bool isLike;
  String cover;
  bool canEdit;
  String argName;
  int argValue;
  int argCon;

  RankingList(
      {this.sortId,
        this.sortName,
        this.isLike,
        this.cover,
        this.canEdit,
        this.argName,
        this.argValue,
        this.argCon});

  RankingList.fromJson(Map<String, dynamic> json) {
    sortId = json['sortId'];
    sortName = json['sortName'];
    isLike = json['isLike'];
    cover = json['cover'];
    canEdit = json['canEdit'];
    argName = json['argName'];
    argValue = json['argValue'];
    argCon = json['argCon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sortId'] = this.sortId;
    data['sortName'] = this.sortName;
    data['isLike'] = this.isLike;
    data['cover'] = this.cover;
    data['canEdit'] = this.canEdit;
    data['argName'] = this.argName;
    data['argValue'] = this.argValue;
    data['argCon'] = this.argCon;
    return data;
  }
}

