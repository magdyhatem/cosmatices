

class SliderModel {
  int? id;
  String? couponCode;
  int? discountPercent;
  String? descriptionTitle1En;
  String? descriptionTitle1Ar;
  String? descriptionTitle2En;
  String? descriptionTitle2Ar;
  String? imageUrl;

  SliderModel(
      {this.id,
        this.couponCode,
        this.discountPercent,
        this.descriptionTitle1En,
        this.descriptionTitle1Ar,
        this.descriptionTitle2En,
        this.descriptionTitle2Ar,
        this.imageUrl});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponCode = json['coupon_code'];
    discountPercent = json['discount_percent'];
    descriptionTitle1En = json['description_title1_en'];
    descriptionTitle1Ar = json['description_title1_ar'];
    descriptionTitle2En = json['description_title2_en'];
    descriptionTitle2Ar = json['description_title2_ar'];
    imageUrl = json['image_url'];
  }

 }
