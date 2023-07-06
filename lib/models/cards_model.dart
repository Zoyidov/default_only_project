 class CardsModel{
  
   final String id;
   final String cardType;
   final String cardNumber;
   final String bankName;
   final double moneyAmount;
   final String cardCurrency;
   final DateTime expireDate;
   final String iconImage;
   final Map<String, String> colors;

   CardsModel({
   required this.id,
   required this.cardType,
   required this.cardNumber,
   required this.bankName,
   required this.moneyAmount,
   required this.cardCurrency,
   required this.expireDate,
   required this.iconImage,
   required this.colors,
   });

   factory CardsModel.fromJson(Map<String, dynamic> json) {
   return CardsModel(
   id: json['id'].toString(),
   cardType: json['card_type'],
   cardNumber: json['card_number'],
   bankName: json['bank_name'],
   moneyAmount: json['money_amount'].toDouble(),
   cardCurrency: json['card_currency'],
   expireDate: DateTime.parse(json['expire_date']),
   iconImage: json['icon_image'],
   colors: json['colors'] != null ? Map<String, String>.from(json['colors']) : {},
   );
   }
   }
