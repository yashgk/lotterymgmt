import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lotto_mgmt/core/constants/shared_prefs.dart';
import '../../core/constants/constants.dart';
import '../pages/home_page.dart';

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
                          final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                          if (val.isEmpty || val.characters.every((element) => element == " ")) {
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
                        errorBorder: standardBorder.copyWith(borderSide: const BorderSide(color: AppColors.redAccent)),
                        focusedBorder: standardBorder.copyWith(borderSide: const BorderSide(color: AppColors.greyColor)),
                        enabledBorder: standardBorder,
                        disabledBorder: standardBorder.copyWith(borderSide: const BorderSide(color: AppColors.greyColor)),
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
                          if (val.isEmpty || val.characters.every((element) => element == " ")) {
                            return "Password Must not be null";
                          }
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.key_outlined),
                        border: standardBorder,
                        errorBorder: standardBorder.copyWith(borderSide: const BorderSide(color: AppColors.redAccent)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: Icon(hidePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                        ),
                        focusedBorder: standardBorder.copyWith(borderSide: const BorderSide(color: AppColors.greyColor)),
                        enabledBorder: standardBorder,
                        disabledBorder: standardBorder.copyWith(borderSide: const BorderSide(color: AppColors.greyColor)),
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
                  GraphQLConsumer(
                    builder: (client) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          size!.width * 0.2,
                          AppDimensions.sizeFifty,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await login(client);
                        }
                      },
                      child: const Text(
                        "Login",
                        style: AppTextStyle.mediumText,
                      ),
                    ),
                  ),
                  vBox(AppDimensions.sizeThirty),
                ],
              ),
            ),
    );
  }

  Future<void> login(GraphQLClient client) async {
    setState(() {
      isLoading = true;
    });
    //check if user exist
    String checkUserExist = '''
        query CheckUserExists {
          checkUserExists(email: "${emailController.text.toLowerCase()}")
        }    
      ''';

    QueryOptions options = QueryOptions(
      document: gql(checkUserExist),
    );

    final QueryResult existingUserRes = await client.query(options);

    if (existingUserRes.hasException) {
      debugPrint(existingUserRes.exception.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(existingUserRes.exception.toString()),
          backgroundColor: AppColors.errorColor,
        ),
      );
      setState(() {
        isLoading = false;
      });
    } else if (existingUserRes.isLoading) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Loading"),
          backgroundColor: AppColors.primaryColor,
        ),
      );
    } else {
      debugPrint(existingUserRes.data!.toString());
      if (existingUserRes.data!['checkUserExists'].toString() == "User not Exist!") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User not Exist!"),
            backgroundColor: AppColors.errorColor,
          ),
        );
        setState(() {
          isLoading = false;
        });
      } else {
        String loginMut = '''
          mutation LoginUser {
            loginUser(input: {
              email:"${emailController.text.toLowerCase()}"
              password:"${passwordController.text}"
            }) {
              token
              id
            }
          }
        ''';
        options = QueryOptions(
          document: gql(loginMut),
        );
        final QueryResult loginMutation = await client.query(options);
        if (loginMutation.hasException) {
          debugPrint(loginMutation.exception.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(loginMutation.exception.toString()),
              backgroundColor: AppColors.errorColor,
            ),
          );
          setState(() {
            isLoading = false;
          });
        } else if (loginMutation.isLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Loading"),
              backgroundColor: AppColors.primaryColor,
            ),
          );
        } else {
          debugPrint(loginMutation.data!.toString());
          if (loginMutation.data!['loginUser']['id'] == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Invalid Password"),
                backgroundColor: AppColors.errorColor,
              ),
            );
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Logged in Successfully"),
                backgroundColor: AppColors.successColor,
              ),
            );
            SharedPreference.set(SharedPreference.kToken, loginMutation.data!['loginUser']['token']);
            SharedPreference.setInt(SharedPreference.kId, loginMutation.data!['loginUser']['id']);
            goToHome();
          }
        }
      }
    }
  }

  goToHome() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
  }
}
