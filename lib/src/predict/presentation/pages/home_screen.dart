import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ml_project/core/cache_helper.dart';
import 'package:ml_project/core/constants/app_strings.dart';
import 'package:ml_project/core/services/services_locator.dart';
import 'package:ml_project/core/widgets/custom_sized_box.dart';
import 'package:ml_project/core/widgets/custom_text_button.dart';
import 'package:ml_project/core/widgets/custom_text_form_field.dart';
import 'package:ml_project/src/predict/data/models/predict_model.dart';
import 'package:ml_project/src/predict/presentation/controllers/predict_cubit.dart';
import '../widgets/custom_drop_down_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController creditScoreController;
  late final TextEditingController ageController;
  late final TextEditingController tenureController;
  late final TextEditingController accountBalanceController;
  late final TextEditingController numOfProductsController;
  late final TextEditingController estimatedSalaryController;
  late final TextEditingController satisfactionScoreController;
  late final TextEditingController pointsEarnedController;
  late final FocusNode creditScoreFocusNode;
  late final FocusNode ageFocusNode;
  late final FocusNode tenureFocusNode;
  late final FocusNode accountBalanceFocusNode;
  late final FocusNode numOfProductsFocusNode;
  late final FocusNode estimatedSalaryFocusNode;
  late final FocusNode satisfactionScoreFocusNode;
  late final FocusNode pointsEarnedFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    creditScoreController = TextEditingController();
    ageController = TextEditingController();
    tenureController = TextEditingController();
    accountBalanceController = TextEditingController();
    numOfProductsController = TextEditingController();
    estimatedSalaryController = TextEditingController();
    satisfactionScoreController = TextEditingController();
    pointsEarnedController = TextEditingController();
    creditScoreFocusNode = FocusNode();
    ageFocusNode = FocusNode();
    tenureFocusNode = FocusNode();
    accountBalanceFocusNode = FocusNode();
    numOfProductsFocusNode = FocusNode();
    estimatedSalaryFocusNode = FocusNode();
    satisfactionScoreFocusNode = FocusNode();
    pointsEarnedFocusNode = FocusNode();
  }

  @override
  void dispose() {
    creditScoreController.dispose();
    ageController.dispose();
    tenureController.dispose();
    accountBalanceController.dispose();
    numOfProductsController.dispose();
    estimatedSalaryController.dispose();
    satisfactionScoreController.dispose();
    pointsEarnedController.dispose();
    creditScoreFocusNode.dispose();
    ageFocusNode.dispose();
    tenureFocusNode.dispose();
    accountBalanceFocusNode.dispose();
    numOfProductsFocusNode.dispose();
    estimatedSalaryFocusNode.dispose();
    satisfactionScoreFocusNode.dispose();
    pointsEarnedFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PredictCubit>(
        create: (context) {
          return PredictCubit(sl());
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: 24.0.h,
                left: 24.0.w,
                right: 24.0.w,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        AppStrings.churnDetection,
                        style: TextStyle(
                          fontSize: 30.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    gapH(20),
                    CustomTextFormField(
                      hintText: AppStrings.creditScore,
                      controller: creditScoreController,
                      focusNode: creditScoreFocusNode,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(ageFocusNode);
                      },
                      validate: (value) {},
                      textAction: TextInputAction.next,
                      textOnChanged: (value) {
                        // int? creditScore = int.tryParse(value);
                        // if (creditScore == null ||
                        //     creditScore < 300 ||
                        //     creditScore > 850) {
                        //   log('Invalid credit score');
                        // } else {
                        //   log('Valid credit score: $creditScore');
                        // }
                      },
                    ),
                    gapH(14),
                    CustomTextFormField(
                      hintText: AppStrings.age,
                      controller: ageController,
                      focusNode: ageFocusNode,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(tenureFocusNode);
                      },
                      textAction: TextInputAction.next,
                      validate: (value) {
                        int? age = int.tryParse(value!);
                        if (age == null) {
                          return 'Invalid age';
                        } else if (age < 18 || age > 100) {
                          return 'age should be between 18 and 100';
                        }
                        return null;
                      },
                      textOnChanged: (value) {
                        int? age = int.tryParse(value!);
                        if (age == null || age <= 0) {
                          log('Invalid age');
                        } else {
                          log('Valid age: $age');
                        }
                      },
                    ),
                    gapH(14),
                    CustomTextFormField(
                      hintText: AppStrings.tenure,
                      controller: tenureController,
                      focusNode: tenureFocusNode,
                      textAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(accountBalanceFocusNode);
                      },
                      textOnChanged: (value) {
                        int? tenure = int.tryParse(value);
                        if (tenure == null || tenure < 0 || tenure > 10) {
                          log('Invalid tenure');
                        } else {
                          log('Valid tenure: $tenure');
                        }
                      },
                    ),
                    gapH(14),
                    CustomTextFormField(
                      hintText: AppStrings.accountBalance,
                      controller: accountBalanceController,
                      focusNode: accountBalanceFocusNode,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(numOfProductsFocusNode);
                      },
                      textAction: TextInputAction.next,
                      textOnChanged: (value) {
                        double? accountBalance = double.tryParse(value);
                        if (accountBalance == null || accountBalance < 0) {
                          log('Invalid account balance');
                        } else {
                          log('Valid account balance: $accountBalance');
                        }
                      },
                    ),
                    gapH(14),
                    CustomTextFormField(
                      hintText: AppStrings.numberOfProducts,
                      controller: numOfProductsController,
                      focusNode: numOfProductsFocusNode,
                      textAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(estimatedSalaryFocusNode);
                      },
                      textOnChanged: (value) {
                        int? numOfProducts = int.tryParse(value);
                        if (numOfProducts == null || numOfProducts < 1) {
                          log('Invalid number of products');
                        } else {
                          log('Valid number of products: $numOfProducts');
                        }
                      },
                    ),
                    gapH(14),
                    CustomTextFormField(
                      hintText: AppStrings.estimatedSalary,
                      controller: estimatedSalaryController,
                      focusNode: estimatedSalaryFocusNode,
                      textAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(satisfactionScoreFocusNode);
                      },
                      textOnChanged: (value) {
                        double? estimatedSalary = double.tryParse(value);
                        if (estimatedSalary == null || estimatedSalary < 0) {
                          log('Invalid estimated salary');
                        } else {
                          log('Valid estimated salary: $estimatedSalary');
                        }
                      },
                    ),
                    gapH(14),
                    CustomTextFormField(
                      hintText: AppStrings.satisfactionScore,
                      controller: satisfactionScoreController,
                      focusNode: satisfactionScoreFocusNode,
                      textAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(pointsEarnedFocusNode);
                      },
                      textOnChanged: (value) {
                        int? satisfactionScore = int.tryParse(value);
                        if (satisfactionScore == null ||
                            satisfactionScore < 1 ||
                            satisfactionScore > 10) {
                          log('Invalid satisfaction score');
                        } else {
                          log('Valid satisfaction score: $satisfactionScore');
                        }
                      },
                    ),
                    gapH(14),
                    CustomTextFormField(
                      hintText: AppStrings.pointsEarned,
                      controller: pointsEarnedController,
                      textAction: TextInputAction.done,

                      // focusNode: pointsEarnedFocusNode,
                      // onEditingComplete: () {
                      //   FocusScope.of(context).unfocus();
                      // },
                      textOnChanged: (value) {
                        int? pointsEarned = int.tryParse(value);
                        if (pointsEarned == null || pointsEarned < 0) {
                          log('Invalid points earned');
                        } else {
                          log('Valid points earned: $pointsEarned');
                        }
                      },
                    ),
                    gapH(24),
                    const CustomDropDownButton(),
                    gapH(24),
                    BlocConsumer<PredictCubit, PredictState>(
                      listener: (context, state) {
                        if (state is PredictSuccess) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Prediction Result'),
                                content: Text(
                                  state.resultModel.willExit
                                      ? 'The Customer will exit with prob ${state.resultModel.prob.toStringAsPrecision(5)}'
                                      : 'The Customer won\'t exit with prob ${state.resultModel.prob.toStringAsPrecision(5)}',
                                ),
                                actions: [
                                  CustomRoundedButton(
                                    buttonText: 'OK',
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    heroTag: '3',
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (state is PredictError) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: Text(state.message),
                                actions: [
                                  CustomRoundedButton(
                                    buttonText: 'OK',
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    heroTag: '2',
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is PredictLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return CustomRoundedButton(
                            buttonText: AppStrings.predict,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                log('*******${CacheHelper.getStatusList().contains(AppStrings.hasCreditCard) ? 1 : 0}');
                                log('*******${CacheHelper.getStatusList().contains(AppStrings.isActiveMember) ? 1 : 0}');
                                log('***${CacheHelper.getGender() == 'Male' ? 1 : 0}');
                                log('***${CacheHelper.getLocation() == 'France' ? 1 : 0}');
                                log('***${CacheHelper.getCreditCardType() == 'SILVER' ? 1 : 0}');
                                context.read<PredictCubit>().predict(
                                      PredictModel(
                                        creditScore: int.parse(
                                          creditScoreController.text,
                                        ),
                                        age: int.parse(ageController.text),
                                        tenure:
                                            int.parse(tenureController.text),
                                        balance: int.parse(
                                          accountBalanceController.text,
                                        ),
                                        numOfProducts: int.parse(
                                            numOfProductsController.text),
                                        estimatedSalary: int.parse(
                                            estimatedSalaryController.text),
                                        satisfactionScore: int.parse(
                                          satisfactionScoreController.text,
                                        ),
                                        pointEarned: int.parse(
                                          pointsEarnedController.text,
                                        ),
                                        cardTypeSilver:
                                            CacheHelper.getCreditCardType() ==
                                                    'SILVER'
                                                ? 1
                                                : 0,
                                        cardTypeDiamond:
                                            CacheHelper.getCreditCardType() ==
                                                    'DIAMOND'
                                                ? 1
                                                : 0,
                                        cardTypeGold:
                                            CacheHelper.getCreditCardType() ==
                                                    'GOLD'
                                                ? 1
                                                : 0,
                                        cardTypePlatinum:
                                            CacheHelper.getCreditCardType() ==
                                                    'PLATINUM'
                                                ? 1
                                                : 0,
                                        genderMale:
                                            CacheHelper.getGender() == 'Male'
                                                ? 1
                                                : 0,
                                        genderFemale:
                                            CacheHelper.getGender() == 'Female'
                                                ? 1
                                                : 0,
                                        geographyFrance:
                                            CacheHelper.getLocation() ==
                                                    'France'
                                                ? 1
                                                : 0,
                                        geographyGermany:
                                            CacheHelper.getLocation() ==
                                                    'Germany'
                                                ? 1
                                                : 0,
                                        geographySpain:
                                            CacheHelper.getLocation() == 'Spain'
                                                ? 1
                                                : 0,
                                        hasCrCard: CacheHelper.getStatusList()
                                                .contains(
                                                    AppStrings.hasCreditCard)
                                            ? 1
                                            : 0,
                                        isActiveMember:
                                            CacheHelper.getStatusList()
                                                    .contains(AppStrings
                                                        .isActiveMember)
                                                ? 1
                                                : 0,
                                      ),
                                    );
                              }
                            },
                            buttonTextColor: Colors.white,
                            heroTag: "1",
                          );
                        }
                      },
                    ),
                    gapH(40)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
