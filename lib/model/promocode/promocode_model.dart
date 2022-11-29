
class PromoCodeModel {
  PromoCodeModel({
    
    required this.promoCodeDescription,
    required this.promoCodeImage,
    required this.promoCodePercentage,
  });

 
  
  String promoCodeDescription;
  int promoCodePercentage;
  String promoCodeImage;


  factory PromoCodeModel.fromJson(Map<String, dynamic> json) => PromoCodeModel(
      
        promoCodeDescription: json["description"],
        promoCodeImage: json["image_url"],
        promoCodePercentage: json["percentage"],
       
      );
}
