import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_dimensions.dart';
import '../core/constants/app_text_styles.dart';
import '../core/constants/helpers.dart';
import 'widgets/login_module.dart';
import 'widgets/registration_module.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool alreadyMember = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: size!.height,
          width: size!.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: size!.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size!.height * 0.2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Placeholder(
                            color: AppColors.primaryColor,
                            strokeWidth: 2,
                            fallbackHeight: size!.height * 0.15,
                            fallbackWidth: size!.width * 0.1,
                          ),
                          hBox(AppDimensions.sizeThirty),
                          SizedBox(
                            child: Text(
                              "Lotto \nManagement",
                              style: AppTextStyle.largeText.copyWith(
                                fontSize: AppDimensions.sizeThirty,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                                // height: AppDimensions.sizeTwo
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    alreadyMember
                        ? const LoginModule()
                        : const RegistrationModule(),
                    alreadyMember
                        ? RichText(
                            text: TextSpan(
                                text: "New Here ? ",
                                style: AppTextStyle.mediumText
                                    .copyWith(color: AppColors.onyxColor),
                                children: [
                                  TextSpan(
                                    text: "Create an Account",
                                    style: AppTextStyle.mediumText.copyWith(
                                        color: AppColors.primaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        setState(() {
                                          alreadyMember = !alreadyMember;
                                        });
                                      },
                                  )
                                ]),
                          )
                        : RichText(
                            text: TextSpan(
                                text: "Already Have an Account ? ",
                                style: AppTextStyle.mediumText
                                    .copyWith(color: AppColors.onyxColor),
                                children: [
                                  TextSpan(
                                    text: "Login",
                                    style: AppTextStyle.mediumText.copyWith(
                                        color: AppColors.primaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        setState(() {
                                          alreadyMember = !alreadyMember;
                                        });
                                      },
                                  )
                                ]),
                          ),
                    const Spacer(),
                  ],
                ),
              ),
              Container(
                width: size!.width / 2,
                color: AppColors.secondaryColor,
                child: Image.asset(
                  AppAssets.lotteryStock,
                  height: size!.height * 0.6,
                  width: size!.width * 0.6,
                ),
              ),
            ],
          )),
    );
  }
}
