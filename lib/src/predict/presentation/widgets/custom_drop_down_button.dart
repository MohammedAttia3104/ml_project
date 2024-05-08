import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ml_project/core/cache_helper.dart';
import 'package:ml_project/core/constants/app_strings.dart';
import 'package:ml_project/core/widgets/custom_sized_box.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  final List<String> genderItems = [
    AppStrings.maleGender,
    AppStrings.femaleGender,
  ];
  final List<String> locationItems = [
    'France',
    'Germany',
    'Spain',
  ];
  final List<String> statusItems = [
    AppStrings.hasCreditCard,
    AppStrings.isActiveMember,
  ];
  final List<String> creditCardTypeItems = [
    'DIAMOND',
    'GOLD',
    'PLATINUM',
    'SILVER',
  ];
  List<String> selectedItems = [];
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
                iconStyleData: IconStyleData(
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  iconSize: 24.sp,
                ),
                hint: Text(
                  AppStrings.customerStatus,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                items: statusItems.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    //disable default onTap to avoid closing menu when selecting an item
                    enabled: false,
                    child: StatefulBuilder(
                      builder: (context, menuSetState) {
                        final isSelected = selectedItems.contains(item);
                        return InkWell(
                          onTap: () {
                            if (isSelected) {
                              selectedItems.remove(item);
                            } else {
                              selectedItems.add(item);
                            }
                            CacheHelper.saveStatusList(selectedItems);
                            //This rebuilds the StatefulWidget to update the button's text
                            setState(() {});
                            //This rebuilds the dropdownMenu Widget to update the check mark
                            menuSetState(() {});
                          },
                          child: Container(
                            height: double.infinity,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0).w,
                            child: Row(
                              children: [
                                if (isSelected)
                                  const Icon(Icons.check_box_outlined)
                                else
                                  const Icon(Icons.check_box_outline_blank),
                                gapW(16),
                                Expanded(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
                //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                value: selectedItems.isEmpty ? null : selectedItems.last,
                onChanged: (value) {
                  log('onChanged: $value');
                },
                selectedItemBuilder: (context) {
                  return statusItems.map(
                    (item) {
                      return Container(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          selectedItems.join(', '),
                          style: TextStyle(
                            fontSize: 14.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      );
                    },
                  ).toList();
                },
                buttonStyleData: ButtonStyleData(
                  padding: EdgeInsets.only(left: 16.w, right: 8.w),
                  height: 50.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 40.h,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
            gapH(18),
            DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                // Add more decoration..
              ),
              hint: Text(
                AppStrings.customerGender,
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
              items: genderItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select gender.';
                }
                return null;
              },
              onChanged: (value) {
                log('onChanged gender: $value');
                CacheHelper.saveGender(value!);
              },
              onSaved: (value) {
                selectedValue2 = value.toString();
                CacheHelper.saveGender(selectedValue2!);
              },
              buttonStyleData: ButtonStyleData(
                padding: EdgeInsets.only(right: 8.w),
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                iconSize: 24.sp,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15).r,
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
              ),
            ),
            gapH(18),
            DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                // Add more decoration..
              ),
              hint: Text(
                AppStrings.customerLocation,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              items: locationItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select location.';
                }
                return null;
              },
              onChanged: (value) {
                log('onChanged location: $value');
                CacheHelper.saveLocation(value!);
              },
              onSaved: (value) {
                selectedValue3 = value.toString();
                CacheHelper.saveLocation(selectedValue3!);
              },
              buttonStyleData: ButtonStyleData(
                padding: EdgeInsets.only(right: 8.w),
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                iconSize: 24.sp,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15).r,
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
              ),
            ),
            gapH(18),
            DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                // Add more decoration..
              ),
              hint: Text(
                AppStrings.customerCreditCardType,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              items: creditCardTypeItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select credit card type.';
                }
                return null;
              },
              onChanged: (value) {
                log('onChanged credit card type: $value');
                CacheHelper.saveCreditCardType(value!);
              },
              onSaved: (value) {
                selectedValue4 = value.toString();
                CacheHelper.saveCreditCardType(selectedValue4!);
              },
              buttonStyleData: ButtonStyleData(
                padding: EdgeInsets.only(right: 8.w),
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                iconSize: 24.sp,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15).r,
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
              ),
            ),
            gapH(18),
          ],
        ),
      ),
    );
  }
}
