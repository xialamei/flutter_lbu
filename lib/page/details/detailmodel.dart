class DetailsModel {
  int stateCode;
  String message;
  ReturnData returnData;

  DetailsModel({this.stateCode, this.message, this.returnData});

  DetailsModel.fromJson(Map<String, dynamic> json) {
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
  Comic comic;
  List<ChapterList> chapterList;
  List<OtherWorks> otherWorks;
  Emotion emotion;

  ReturnData({this.comic, this.chapterList, this.otherWorks, this.emotion});

  ReturnData.fromJson(Map<String, dynamic> json) {
    comic = json['comic'] != null ? new Comic.fromJson(json['comic']) : null;
    if (json['chapter_list'] != null) {
      chapterList = new List<ChapterList>();
      json['chapter_list'].forEach((v) {
        chapterList.add(new ChapterList.fromJson(v));
      });
    }
    if (json['otherWorks'] != null) {
      otherWorks = new List<OtherWorks>();
      json['otherWorks'].forEach((v) {
        otherWorks.add(new OtherWorks.fromJson(v));
      });
    }
    emotion =
        json['emotion'] != null ? new Emotion.fromJson(json['emotion']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comic != null) {
      data['comic'] = this.comic.toJson();
    }
    if (this.chapterList != null) {
      data['chapter_list'] = this.chapterList.map((v) => v.toJson()).toList();
    }
    if (this.otherWorks != null) {
      data['otherWorks'] = this.otherWorks.map((v) => v.toJson()).toList();
    }
    if (this.emotion != null) {
      data['emotion'] = this.emotion.toJson();
    }
    return data;
  }
}

class Comic {
  String name;
  String comicId;
  String shortDescription;
  int accredit;
  String cover;
  int isVip;
  String type;
  String ori;
  List<String> themeIds;
  String seriesStatus;
  int lastUpdateTime;
  String description;
  String cateId;
  int status;
  String threadId;
  String lastUpdateWeek;
  String wideCover;
  List<ClassifyTags> classifyTags;
  int isWeek;
  String level;
  Author author;
  int isDub;

  Comic(
      {this.name,
      this.comicId,
      this.shortDescription,
      this.accredit,
      this.cover,
      this.isVip,
      this.type,
      this.ori,
      this.themeIds,
      this.seriesStatus,
      this.lastUpdateTime,
      this.description,
      this.cateId,
      this.status,
      this.threadId,
      this.lastUpdateWeek,
      this.wideCover,
      this.classifyTags,
      this.isWeek,
      this.level,
      this.author,
      this.isDub});

  Comic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    comicId = json['comic_id'];
    shortDescription = json['short_description'];
    accredit = json['accredit'];
    cover = json['cover'];
    isVip = json['is_vip'];
    type = json['type'];
    ori = json['ori'];
    if (json['theme_ids']!= null ) {
      themeIds = json['theme_ids'].cast<String>();
    }
    seriesStatus = json['series_status'];
    lastUpdateTime = json['last_update_time'];
    description = json['description'];
    cateId = json['cate_id'];
    status = json['status'];
    threadId = json['thread_id'];
    lastUpdateWeek = json['last_update_week'];
    wideCover = json['wideCover'];
    if (json['classifyTags'] != null) {
      classifyTags = new List<ClassifyTags>();
      json['classifyTags'].forEach((v) {
        classifyTags.add(new ClassifyTags.fromJson(v));
      });
    }
    isWeek = json['is_week'];
    level = json['level'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    isDub = json['is_dub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['comic_id'] = this.comicId;
    data['short_description'] = this.shortDescription;
    data['accredit'] = this.accredit;
    data['cover'] = this.cover;
    data['is_vip'] = this.isVip;
    data['type'] = this.type;
    data['ori'] = this.ori;
    data['theme_ids'] = this.themeIds;
    data['series_status'] = this.seriesStatus;
    data['last_update_time'] = this.lastUpdateTime;
    data['description'] = this.description;
    data['cate_id'] = this.cateId;
    data['status'] = this.status;
    data['thread_id'] = this.threadId;
    data['last_update_week'] = this.lastUpdateWeek;
    data['wideCover'] = this.wideCover;
    if (this.classifyTags != null) {
      data['classifyTags'] = this.classifyTags.map((v) => v.toJson()).toList();
    }
    data['is_week'] = this.isWeek;
    data['level'] = this.level;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['is_dub'] = this.isDub;
    return data;
  }
}

class ClassifyTags {
  String name;
  String argName;
  int argVal;

  ClassifyTags({this.name, this.argName, this.argVal});

  ClassifyTags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    argName = json['argName'];
    argVal = json['argVal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['argName'] = this.argName;
    data['argVal'] = this.argVal;
    return data;
  }
}

class Author {
  String avatar;
  String name;
  String id;

  Author({this.avatar, this.name, this.id});

  Author.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class ChapterList {
  String name;
  String imageTotal;
  String chapterId;
  String type;
  String price;
  String size;
  int passTime;
  String releaseTime;
  String zipHighWebp;
  String cropZipSize;
  int isNew;
  bool hasLockedImage;
  List<List> imHightArr;
  int countImHightArr;

  ChapterList(
      {this.name,
      this.imageTotal,
      this.chapterId,
      this.type,
      this.price,
      this.size,
      this.passTime,
      this.releaseTime,
      this.zipHighWebp,
      this.cropZipSize,
      this.isNew,
      this.hasLockedImage,
      this.imHightArr,
      this.countImHightArr});

  ChapterList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageTotal = json['image_total'];
    chapterId = json['chapter_id'];
    type = json['type'].toString();
    price = json['price'];
    size = json['size'];
    passTime = json['pass_time'];
    releaseTime = json['release_time'];
    zipHighWebp = json['zip_high_webp'];
    cropZipSize = json['crop_zip_size'];
    isNew = json['is_new'];
    hasLockedImage = json['has_locked_image'];
    if (json['imHightArr'] != null) {
      imHightArr = new List<List>();
      //json['imHightArr'].forEach((v) { imHightArr.add(new List.fromJson(v)); });
    }
    countImHightArr = json['countImHightArr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image_total'] = this.imageTotal;
    data['chapter_id'] = this.chapterId;
    data['type'] = this.type;
    data['price'] = this.price;
    data['size'] = this.size;
    data['pass_time'] = this.passTime;
    data['release_time'] = this.releaseTime;
    data['zip_high_webp'] = this.zipHighWebp;
    data['crop_zip_size'] = this.cropZipSize;
    data['is_new'] = this.isNew;
    data['has_locked_image'] = this.hasLockedImage;
    if (this.imHightArr != null) {
      //  data['imHightArr'] = this.imHightArr.map((v) => v.toJson()).toList();
    }
    data['countImHightArr'] = this.countImHightArr;
    return data;
  }
}

class ImHightArr {
  String height;
  String widht;

  ImHightArr({this.widht, this.height});

  ImHightArr.fromJson(Map<String, dynamic> json) {
    height = json["height"];
    widht = json["width"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class OtherWorks {
  String comicId;
  String coverUrl;
  String name;
  String passChapterNum;

  OtherWorks({this.comicId, this.coverUrl, this.name, this.passChapterNum});

  OtherWorks.fromJson(Map<String, dynamic> json) {
    comicId = json['comicId'];
    coverUrl = json['coverUrl'];
    name = json['name'];
    passChapterNum = json['passChapterNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comicId'] = this.comicId;
    data['coverUrl'] = this.coverUrl;
    data['name'] = this.name;
    data['passChapterNum'] = this.passChapterNum;
    return data;
  }
}

class Emotion {
  String emotionUrl;
  int emotionVersion;

  Emotion({this.emotionUrl, this.emotionVersion});

  Emotion.fromJson(Map<String, dynamic> json) {
    emotionUrl = json['emotionUrl'];
    emotionVersion = json['emotionVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emotionUrl'] = this.emotionUrl;
    data['emotionVersion'] = this.emotionVersion;
    return data;
  }
}
