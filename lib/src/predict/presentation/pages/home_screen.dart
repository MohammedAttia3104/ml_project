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
  late final TextEditingController ageController;
  late final TextEditingController accountBalanceController;
  late final TextEditingController estimatedSalaryController;
  late final FocusNode ageFocusNode;
  late final FocusNode accountBalanceFocusNode;
  late final FocusNode estimatedSalaryFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    ageController = TextEditingController();
    accountBalanceController = TextEditingController();
    estimatedSalaryController = TextEditingController();
    ageFocusNode = FocusNode();
    accountBalanceFocusNode = FocusNode();
    estimatedSalaryFocusNode = FocusNode();
  }

  @override
  void dispose() {
    ageController.dispose();
    accountBalanceController.dispose();
    estimatedSalaryController.dispose();
    ageFocusNode.dispose();
    accountBalanceFocusNode.dispose();
    estimatedSalaryFocusNode.dispose();
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
                      hintText: AppStrings.age,
                      controller: ageController,
                      focusNode: ageFocusNode,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(accountBalanceFocusNode);
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
                      hintText: AppStrings.accountBalance,
                      controller: accountBalanceController,
                      focusNode: accountBalanceFocusNode,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(estimatedSalaryFocusNode);
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
                      hintText: AppStrings.estimatedSalary,
                      controller: estimatedSalaryController,
                      focusNode: estimatedSalaryFocusNode,
                      textAction: TextInputAction.next,
                      onEditingComplete: () {},
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
                                        age: int.parse(ageController.text),
                                        balance: int.parse(
                                          accountBalanceController.text,
                                        ),
                                        estimatedSalary: int.parse(
                                            estimatedSalaryController.text),
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
