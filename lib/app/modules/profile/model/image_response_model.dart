///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class ImageUpload {
/*
{
  "status": true,
  "message": "File uploaded",
  "url": "https://allayya-user-image.s3.us-west-1.amazonaws.com/allayya-user-login.png"
}
*/

  bool? status;
  String? message;
  String? url;

  ImageUpload({
    this.status,
    this.message,
    this.url,
  });
  ImageUpload.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['url'] = url;
    return data;
  }
}
