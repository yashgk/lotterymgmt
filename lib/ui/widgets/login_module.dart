import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/constants/app_colors.dart';
import 'package:lotto_mgmt/core/constants/app_dimensions.dart';
import 'package:lotto_mgmt/core/constants/app_text_styles.dart';
import 'package:lotto_mgmt/core/constants/helpers.dart';
import 'package:lotto_mgmt/home_page.dart';

class LoginModule extends StatefulWidget {
  const LoginModule({Key? key}) : super(key: key);

  @override
  State<LoginModule> createState() => _LoginModuleState();
}

class _LoginModuleState extends State<LoginModule> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FocusNode fnEmail = FocusNode();

  FocusNode fnPassword = FocusNode();

  bool hidePassword = true;

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
            "Login",
            style: AppTextStyle.largeText.copyWith(
              fontSize: AppDimensions.sizeTwentyFive,
              color: AppColors.onyxColor,
              fontWeight: FontWeight.bold,
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
          vBox(AppDimensions.sizeTen),
          TextButton(
              onPressed: () {
                //navigato to forgot password dialog
              },
              child: const Text(
                "Forgot Password ?",
              )),
          vBox(AppDimensions.sizeThirty),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                size!.width * 0.2,
                AppDimensions.sizeFifty,
              ),
            ),
            onPressed: () {
              //validate inputs and call login api
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false);
            },
            child: const Text(
              "Login",
              style: AppTextStyle.mediumText,
            ),
          ),
          vBox(AppDimensions.sizeThirty),
        ],
      ),
    );
  }
}
