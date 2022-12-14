///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class fetchSubCategoriesByUsingCategoriesIdCategorySubCategories {
/*
{
  "coverImage": "https://track-sub-category-images.s3.us-west-1.amazonaws.com/mindfulness.jpg",
  "numOfTracks": 1,
  "isDeleted": false,
  "_id": "62bd5226f96997dfc841c36b",
  "categoryId": "62bd4a5ec532b23e72eb6306",
  "desc": "This is your sound Sub Category",
  "name": "Mindfullness",
  "id": "62bd5226f96997dfc841c36b"
}
*/

  String? coverImage;
  int? numOfTracks;
  bool? isDeleted;
  String? Id;
  String? categoryId;
  String? desc;
  String? name;
  String? id;

  fetchSubCategoriesByUsingCategoriesIdCategorySubCategories({
    this.coverImage,
    this.numOfTracks,
    this.isDeleted,
    this.Id,
    this.categoryId,
    this.desc,
    this.name,
    this.id,
  });
  fetchSubCategoriesByUsingCategoriesIdCategorySubCategories.fromJson(Map<String, dynamic> json) {
    coverImage = json['coverImage']?.toString();
    numOfTracks = json['numOfTracks']?.toInt();
    isDeleted = json['isDeleted'];
    Id = json['_id']?.toString();
    categoryId = json['categoryId']?.toString();
    desc = json['desc']?.toString();
    name = json['name']?.toString();
    id = json['id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['coverImage'] = coverImage;
    data['numOfTracks'] = numOfTracks;
    data['isDeleted'] = isDeleted;
    data['_id'] = Id;
    data['categoryId'] = categoryId;
    data['desc'] = desc;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class fetchSubCategoriesByUsingCategoriesIdCategory {
/*
{
  "coverImage": "https://track-category-images.s3.us-west-1.amazonaws.com/allayya-category-Illustration.jfif",
  "isDeleted": false,
  "_id": "62bd4a5ec532b23e72eb6306",
  "desc": "This is affirmations category.",
  "name": "Affirmations",
  "updatedAt": "2022-07-14T17:49:36.931Z",
  "subCategories": [
    {
      "coverImage": "https://track-sub-category-images.s3.us-west-1.amazonaws.com/mindfulness.jpg",
      "numOfTracks": 1,
      "isDeleted": false,
      "_id": "62bd5226f96997dfc841c36b",
      "categoryId": "62bd4a5ec532b23e72eb6306",
      "desc": "This is your sound Sub Category",
      "name": "Mindfullness",
      "id": "62bd5226f96997dfc841c36b"
    }
  ],
  "id": "62bd4a5ec532b23e72eb6306"
}
*/

  String? coverImage;
  bool? isDeleted;
  String? Id;
  String? desc;
  String? name;
  String? updatedAt;
  List<fetchSubCategoriesByUsingCategoriesIdCategorySubCategories?>? subCategories;
  String? id;

  fetchSubCategoriesByUsingCategoriesIdCategory({
    this.coverImage,
    this.isDeleted,
    this.Id,
    this.desc,
    this.name,
    this.updatedAt,
    this.subCategories,
    this.id,
  });
  fetchSubCategoriesByUsingCategoriesIdCategory.fromJson(Map<String, dynamic> json) {
    coverImage = json['coverImage']?.toString();
    isDeleted = json['isDeleted'];
    Id = json['_id']?.toString();
    desc = json['desc']?.toString();
    name = json['name']?.toString();
    updatedAt = json['updatedAt']?.toString();
    if (json['subCategories'] != null) {
      final v = json['subCategories'];
      final arr0 = <fetchSubCategoriesByUsingCategoriesIdCategorySubCategories>[];
      v.forEach((v) {
        arr0.add(fetchSubCategoriesByUsingCategoriesIdCategorySubCategories.fromJson(v));
      });
      subCategories = arr0;
    }
    id = json['id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['coverImage'] = coverImage;
    data['isDeleted'] = isDeleted;
    data['_id'] = Id;
    data['desc'] = desc;
    data['name'] = name;
    data['updatedAt'] = updatedAt;
    if (subCategories != null) {
      final v = subCategories;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['subCategories'] = arr0;
    }
    data['id'] = id;
    return data;
  }
}

class fetchSubCategoriesByUsingCategoriesId {
/*
{
  "status": true,
  "message": "Category by Id.",
  "category": {
    "coverImage": "https://track-category-images.s3.us-west-1.amazonaws.com/allayya-category-Illustration.jfif",
    "isDeleted": false,
    "_id": "62bd4a5ec532b23e72eb6306",
    "desc": "This is affirmations category.",
    "name": "Affirmations",
    "updatedAt": "2022-07-14T17:49:36.931Z",
    "subCategories": [
      {
        "coverImage": "https://track-sub-category-images.s3.us-west-1.amazonaws.com/mindfulness.jpg",
        "numOfTracks": 1,
        "isDeleted": false,
        "_id": "62bd5226f96997dfc841c36b",
        "categoryId": "62bd4a5ec532b23e72eb6306",
        "desc": "This is your sound Sub Category",
        "name": "Mindfullness",
        "id": "62bd5226f96997dfc841c36b"
      }
    ],
    "id": "62bd4a5ec532b23e72eb6306"
  }
}
*/

  bool? status;
  String? message;
  fetchSubCategoriesByUsingCategoriesIdCategory? category;

  fetchSubCategoriesByUsingCategoriesId({
    this.status,
    this.message,
    this.category,
  });
  fetchSubCategoriesByUsingCategoriesId.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    category = (json['category'] != null) ? fetchSubCategoriesByUsingCategoriesIdCategory.fromJson(json['category']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}
