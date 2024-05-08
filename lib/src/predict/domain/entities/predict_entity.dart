class PredictEntity {
  final int creditScore;
  final int age;
  final int tenure;
  final int balance;
  final int numOfProducts;
  final int hasCrCard;
  final int isActiveMember;
  final int estimatedSalary;
  final int satisfactionScore;
  final int pointEarned;
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
    required this.creditScore,
    required this.age,
    required this.tenure,
    required this.balance,
    required this.numOfProducts,
    required this.hasCrCard,
    required this.isActiveMember,
    required this.estimatedSalary,
    required this.satisfactionScore,
    required this.pointEarned,
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
        creditScore,
        age,
        tenure,
        balance,
        numOfProducts,
        hasCrCard,
        isActiveMember,
        estimatedSalary,
        satisfactionScore,
        pointEarned,
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
