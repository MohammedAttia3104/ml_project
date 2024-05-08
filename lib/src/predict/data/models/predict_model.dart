import 'package:ml_project/src/predict/domain/entities/predict_entity.dart';

class PredictModel extends PredictEntity {
  PredictModel(
      {required super.creditScore,
      required super.age,
      required super.tenure,
      required super.balance,
      required super.numOfProducts,
      required super.hasCrCard,
      required super.isActiveMember,
      required super.estimatedSalary,
      required super.satisfactionScore,
      required super.pointEarned,
      required super.geographyFrance,
      required super.geographyGermany,
      required super.geographySpain,
      required super.genderFemale,
      required super.genderMale,
      required super.cardTypeDiamond,
      required super.cardTypeGold,
      required super.cardTypePlatinum,
      required super.cardTypeSilver});

  factory PredictModel.fromJson(Map<String, dynamic> json) {
    return PredictModel(
      creditScore: json["CreditScore"],
      age: json["Age"],
      tenure: json["Tenure"],
      balance: json["Balance"],
      numOfProducts: json["NumOfProducts"],
      hasCrCard: json["HasCrCard"],
      isActiveMember: json["IsActiveMember"],
      estimatedSalary: json["EstimatedSalary"],
      satisfactionScore: json["Satisfaction Score"],
      pointEarned: json["Point Earned"],
      geographyFrance: json["Geography_France"] ?? 0,
      geographyGermany: json["Geography_Germany"] ?? 0,
      geographySpain: json["Geography_Spain"] ?? 0,
      genderFemale: json["Gender_Female"] ?? 0,
      genderMale: json["Gender_Male"] ?? 0,
      cardTypeDiamond: json["Card Type_DIAMOND"] ?? 0,
      cardTypeGold: json["Card Type_GOLD"] ?? 0,
      cardTypePlatinum: json["Card Type_PLATINUM"] ?? 0,
      cardTypeSilver: json["Card Type_SILVER"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "CreditScore": creditScore,
      "Age": age,
      "Tenure": tenure,
      "Balance": balance,
      "NumOfProducts": numOfProducts,
      "HasCrCard": hasCrCard,
      "IsActiveMember": isActiveMember,
      "EstimatedSalary": estimatedSalary,
      "Satisfaction Score": satisfactionScore,
      "Point Earned": pointEarned,
      "Geography_France": geographyFrance,
      "Geography_Germany": geographyGermany,
      "Geography_Spain": geographySpain,
      "Gender_Female": genderFemale,
      "Gender_Male": genderMale,
      "Card Type_DIAMOND": cardTypeDiamond,
      "Card Type_GOLD": cardTypeGold,
      "Card Type_PLATINUM": cardTypePlatinum,
      "Card Type_SILVER": cardTypeSilver,
    };
  }
}
