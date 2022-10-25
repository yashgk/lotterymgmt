import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/app_colors.dart';
import 'package:lotto_mgmt/core/constants/app_dimensions.dart';
import 'package:lotto_mgmt/core/constants/app_text_styles.dart';
import 'package:lotto_mgmt/core/constants/helpers.dart';

class RegistrationModule extends StatefulWidget {
  const RegistrationModule({Key? key}) : super(key: key);

  @override
  State<RegistrationModule> createState() => _RegistrationModuleState();
}

class _RegistrationModuleState extends State<RegistrationModule> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FocusNode fnEmail = FocusNode();
  FocusNode fnName = FocusNode();

  FocusNode fnPassword = FocusNode();

  bool hidePassword = true;
  bool tncChecked = false;

  List<String> userType = ['Multiple Shop User', 'Single Shop User'];
  String selectedUserType = 'Multiple Shop User';

  OutlineInputBorder standardBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppDimensions.standardBorder),
    borderSide: const BorderSide(
      color: AppColors.primaryColor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimensions.sizeZero,
      child: Column(
        children: [
          Text(
            "Registration",
            style: AppTextStyle.largeText.copyWith(
              fontSize: AppDimensions.sizeTwentyFive,
              color: AppColors.onyxColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          vBox(AppDimensions.sizeTwenty),
          SizedBox(
            width: size!.width * 0.2,
            child: InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.standardBorder),
                  gapPadding: AppDimensions.sizeTen,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: selectedUserType,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  isDense: true,
                  isExpanded: true,
                  items: userType.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedUserType = newValue!;
                    });
                  },
                ),
              ),
            ),
          ),
          vBox(AppDimensions.sizeTwenty),
          SizedBox(
            width: size!.width * 0.2,
            child: TextField(
              controller: nameController,
              focusNode: fnName,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Full Name",
                prefixIcon: const Icon(Icons.account_circle_outlined),
                border: standardBorder,
                errorBorder: standardBorder.copyWith(
                    borderSide: const BorderSide(color: AppColors.redAccent)),
                // focusedBorder: standardBorder.copyWith(borderSide:const BorderSide(color: AppColors.greyColor)),
                // enabledBorder: standardBorder,
                // disabledBorder: standardBorder.copyWith(borderSide:const BorderSide(color: AppColors.greyColor)),
              ),
            ),
          ),
          vBox(AppDimensions.sizeTwenty),
          SizedBox(
            width: size!.width * 0.2,
            child: TextField(
              controller: emailController,
              focusNode: fnEmail,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "E-mail",
                prefixIcon: const Icon(Icons.alternate_email_rounded),
                border: standardBorder,
                errorBorder: standardBorder.copyWith(
                    borderSide: const BorderSide(color: AppColors.redAccent)),
                // focusedBorder: standardBorder.copyWith(borderSide:const BorderSide(color: AppColors.greyColor)),
                // enabledBorder: standardBorder,
                // disabledBorder: standardBorder.copyWith(borderSide:const BorderSide(color: AppColors.greyColor)),
              ),
            ),
          ),
          vBox(AppDimensions.sizeTwenty),
          SizedBox(
            width: size!.width * 0.2,
            child: TextField(
              controller: passwordController,
              focusNode: fnPassword,
              obscureText: hidePassword,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.key_outlined),
                  border: standardBorder,
                  errorBorder: standardBorder.copyWith(
                      borderSide: const BorderSide(color: AppColors.redAccent)),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    child: Icon(hidePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                  )
                  // focusedBorder: standardBorder.copyWith(borderSide:const BorderSide(color: AppColors.greyColor)),
                  // enabledBorder: standardBorder,
                  // disabledBorder: standardBorder.copyWith(borderSide:const BorderSide(color: AppColors.greyColor)),
                  ),
            ),
          ),
          vBox(AppDimensions.sizeThirty),
          SizedBox(
            width: size!.width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: tncChecked,
                    onChanged: (value) {
                      setState(() {
                        tncChecked = value!;
                      });
                    }),
                RichText(
                  text: TextSpan(
                      text: "I agree to ",
                      style: AppTextStyle.mediumText
                          .copyWith(color: AppColors.onyxColor),
                      children: [
                        TextSpan(
                          text: "Terms and Condition.",
                          style: AppTextStyle.mediumText
                              .copyWith(color: AppColors.primaryColor),
                        )
                      ]),
                ),
              ],
            ),
          ),
          vBox(AppDimensions.sizeTen),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                size!.width * 0.2,
                AppDimensions.sizeFifty,
              ),
            ),
            onPressed: () {
              //validate inputs and call login api-
            },
            child: const Text(
              "Register",
              style: AppTextStyle.mediumText,
            ),
          ),
          vBox(AppDimensions.sizeThirty),
        ],
      ),
    );
  }
}
