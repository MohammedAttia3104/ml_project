class PredictEntity {
  final int age;
  final int balance;
  final int hasCrCard;
  final int isActiveMember;
  final int estimatedSalary;
  final int geographyFrance;
  final int geographyGermany;
  final int geographySpain;
  final int genderFemale;
  final int genderMale;
  final int cardTypeDiamond;
  final int cardTypeGold;
  final int cardTypePlatinum;
  final int cardTypeSilver;

  PredictEntity({
    required this.age,
    required this.balance,
    required this.hasCrCard,
    required this.isActiveMember,
    required this.estimatedSalary,
    required this.geographyFrance,
    required this.geographyGermany,
    required this.geographySpain,
    required this.genderFemale,
    required this.genderMale,
    required this.cardTypeDiamond,
    required this.cardTypeGold,
    required this.cardTypePlatinum,
    required this.cardTypeSilver,
  });

  @override
  List<Object> get props => [
        age,
        balance,
        hasCrCard,
        isActiveMember,
        estimatedSalary,
        geographyFrance,
        geographyGermany,
        geographySpain,
        genderFemale,
        genderMale,
        cardTypeDiamond,
        cardTypeGold,
        cardTypePlatinum,
        cardTypeSilver,
      ];
}
