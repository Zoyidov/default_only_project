 class CardsModel {

    final int id;
    final String cardType;
    final String cardNumber;
    final String bankName;
    final double moneyAmount;
    final String cardCurrency;
    final String expireDate;
    final String iconImage;
    final Map<String, dynamic> colors;

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
          id: json['id'] as int? ?? 0,
          cardType: json['card_type'] as String? ?? "",
          cardNumber: json['card_number'] as String? ?? "",
          bankName: json['bank_name'] as String? ?? "",
          moneyAmount: json['money_amount'] as double? ?? 0000.0,
          cardCurrency: json['card_currency'] as String? ?? "",
          expireDate: json['expire_date'] as String? ?? "",
          iconImage: json['icon_image'] as String? ?? "",
          colors: json['colors'],
       );
    }
 }
