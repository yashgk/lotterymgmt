import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotto_mgmt/core/controller/auth_controller.dart';
import '../../core/constants/constants.dart';

class LoginModule extends StatefulWidget {
  const LoginModule({Key? key}) : super(key: key);

  @override
  State<LoginModule> createState() => _LoginModuleState();
}

class _LoginModuleState extends State<LoginModule> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FocusNode fnEmail = FocusNode();

  FocusNode fnPassword = FocusNode();

  bool hidePassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimensions.sizeZero,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
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
                    child: TextFormField(
                      controller: emailController,
                      focusNode: fnEmail,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val != null) {
                          final emailRegExp = RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                          if (val.isEmpty ||
                              val.characters
                                  .every((element) => element == " ")) {
                            return "Email Must not be null";
                          }
                          if (!emailRegExp.hasMatch(val)) {
                            return 'Invalid email format';
                          }
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        prefixIcon: const Icon(Icons.alternate_email_rounded),
                        border: standardBorder,
                        errorBorder: standardBorder.copyWith(
                            borderSide:
                                const BorderSide(color: AppColors.redAccent)),
                        focusedBorder: standardBorder.copyWith(
                            borderSide:
                                const BorderSide(color: AppColors.greyColor)),
                        enabledBorder: standardBorder,
                        disabledBorder: standardBorder.copyWith(
                            borderSide:
                                const BorderSide(color: AppColors.greyColor)),
                      ),
                    ),
                  ),
                  vBox(AppDimensions.sizeTwenty),
                  SizedBox(
                    width: size!.width * 0.2,
                    child: TextFormField(
                      controller: passwordController,
                      focusNode: fnPassword,
                      obscureText: hidePassword,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (val) {
                        if (val != null) {
                          if (val.isEmpty ||
                              val.characters
                                  .every((element) => element == " ")) {
                            return "Password Must not be null";
                          }
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.key_outlined),
                        border: standardBorder,
                        errorBorder: standardBorder.copyWith(
                            borderSide:
                                const BorderSide(color: AppColors.redAccent)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: Icon(hidePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                        focusedBorder: standardBorder.copyWith(
                            borderSide:
                                const BorderSide(color: AppColors.greyColor)),
                        enabledBorder: standardBorder,
                        disabledBorder: standardBorder.copyWith(
                            borderSide:
                                const BorderSide(color: AppColors.greyColor)),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        size!.width * 0.2,
                        AppDimensions.sizeFifty,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await login();
                      }
                    },
                    child: const Text(
                      "Login",
                      style: AppTextStyle.mediumText,
                    ),
                  ),
                  vBox(AppDimensions.sizeThirty),
                ],
              ),
            ),
    );
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });
    try {
      AuthController authController = Get.find();
      await authController.login(
          {"email": emailController.text, "password": passwordController.text});

      if (authController.user != null) {
        goToHome();
      }
    } catch (e) {
      debugPrint("Error while login, error:${e.toString()}");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  goToHome() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Login Successful!")));
    context.beamToNamed('/dashboard');
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const LandingPage()),
    //     (route) => false);
  }
}
