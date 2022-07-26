///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class RecomendedDataRecommSubCategories {
/*
{
  "coverImage": "https://track-sub-category-images.s3.us-west-1.amazonaws.com/allayya-subcategory-zane-lee-KYhAYwhpQH4-unsplash.jpg",
  "numOfTracks": 0,
  "isDeleted": true,
  "_id": "62d12064616b4e4268941a16",
  "categoryId": "62bd4a5ec532b23e72eb6306",
  "name": "eeeeeeeeeeeeeee",
  "desc": "egggggggggggggggggggggg",
  "createdAt": "2022-07-15T08:08:04.614Z",
  "updatedAt": "2022-07-15T08:37:15.159Z",
  "__v": 0,
  "id": "62d12064616b4e4268941a16"
}
*/

  String? coverImage;
  int? numOfTracks;
  bool? isDeleted;
  String? Id;
  String? categoryId;
  String? name;
  String? desc;
  String? createdAt;
  String? updatedAt;
  int? V;
  String? id;

  RecomendedDataRecommSubCategories({
    this.coverImage,
    this.numOfTracks,
    this.isDeleted,
    this.Id,
    this.categoryId,
    this.name,
    this.desc,
    this.createdAt,
    this.updatedAt,
    this.V,
    this.id,
  });
  RecomendedDataRecommSubCategories.fromJson(Map<String, dynamic> json) {
    coverImage = json['coverImage']?.toString();
    numOfTracks = json['numOfTracks']?.toInt();
    isDeleted = json['isDeleted'];
    Id = json['_id']?.toString();
    categoryId = json['categoryId']?.toString();
    name = json['name']?.toString();
    desc = json['desc']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
    id = json['id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['coverImage'] = coverImage;
    data['numOfTracks'] = numOfTracks;
    data['isDeleted'] = isDeleted;
    data['_id'] = Id;
    data['categoryId'] = categoryId;
    data['name'] = name;
    data['desc'] = desc;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    data['id'] = id;
    return data;
  }
}

class RecomendedData {
/*
{
  "status": true,
  "results": 26,
  "message": "Recommended tracks",
  "recommSubCategories": [
    {
      "coverImage": "https://track-sub-category-images.s3.us-west-1.amazonaws.com/allayya-subcategory-zane-lee-KYhAYwhpQH4-unsplash.jpg",
      "numOfTracks": 0,
      "isDeleted": true,
      "_id": "62d12064616b4e4268941a16",
      "categoryId": "62bd4a5ec532b23e72eb6306",
      "name": "eeeeeeeeeeeeeee",
      "desc": "egggggggggggggggggggggg",
      "createdAt": "2022-07-15T08:08:04.614Z",
      "updatedAt": "2022-07-15T08:37:15.159Z",
      "__v": 0,
      "id": "62d12064616b4e4268941a16"
    }
  ]
}
*/

  bool? status;
  int? results;
  String? message;
  List<RecomendedDataRecommSubCategories?>? recommSubCategories;

  RecomendedData({
    this.status,
    this.results,
    this.message,
    this.recommSubCategories,
  });
  RecomendedData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results']?.toInt();
    message = json['message']?.toString();
    if (json['recommSubCategories'] != null) {
      final v = json['recommSubCategories'];
      final arr0 = <RecomendedDataRecommSubCategories>[];
      v.forEach((v) {
        arr0.add(RecomendedDataRecommSubCategories.fromJson(v));
      });
      recommSubCategories = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['results'] = results;
    data['message'] = message;
    if (recommSubCategories != null) {
      final v = recommSubCategories;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['recommSubCategories'] = arr0;
    }
    return data;
  }
}
