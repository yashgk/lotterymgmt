import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lotto_mgmt/ui/auth/authentication_screen.dart';
import '../../core/constants/constants.dart';

class RegistrationModule extends StatefulWidget {
  const RegistrationModule({Key? key}) : super(key: key);

  @override
  State<RegistrationModule> createState() => _RegistrationModuleState();
}

class _RegistrationModuleState extends State<RegistrationModule> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
  bool isLoading = false;
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
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
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
                          borderRadius: BorderRadius.circular(AppDimensions.standardBorder),
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
                    child: TextFormField(
                      controller: nameController,
                      focusNode: fnName,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      validator: (val) {
                        if (val != null) {
                          if (val.isEmpty || val.characters.every((element) => element == " ")) {
                            return "Name Must not be null";
                          }
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        prefixIcon: const Icon(Icons.account_circle_outlined),
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
                  vBox(AppDimensions.sizeThirty),
                  SizedBox(
                    width: size!.width * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Checkbox(
                        //     value: tncChecked,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         tncChecked = value!;
                        //       });
                        //     }),
                        RichText(
                          text: TextSpan(text: "by clicking on Register you are agree to ", style: AppTextStyle.mediumText.copyWith(color: AppColors.onyxColor), children: [
                            TextSpan(
                              text: "Terms and Condition.",
                              style: AppTextStyle.mediumText.copyWith(color: AppColors.primaryColor),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                  vBox(AppDimensions.sizeTen),
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
                          await registerUser(client);
                        }
                        //validate inputs and call login api-
                      },
                      child: const Text(
                        "Register",
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

  Future<void> registerUser(GraphQLClient client) async {
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
      if (existingUserRes.data!['checkUserExists'].toString() == "User already Exist!") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User already Exist!"),
            backgroundColor: AppColors.errorColor,
          ),
        );
        setState(() {
          isLoading = false;
        });
      } else {
        String regMutation = '''
            mutation RegisterUser {
              registerUser(
                input: {
                  name: "${nameController.text}"
                  email: "${emailController.text.toLowerCase()}"
                  password: "${passwordController.text}"
                  shopType: ${selectedUserType == "Multiple Shop User" ? 0 : 1}
                }
              )
            }
            ''';
        options = QueryOptions(
          document: gql(regMutation),
        );
        final QueryResult registrationMutation = await client.query(options);
        if (registrationMutation.hasException) {
          debugPrint(registrationMutation.exception.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(registrationMutation.exception.toString()),
              backgroundColor: AppColors.errorColor,
            ),
          );
          setState(() {
            isLoading = false;
          });
        } else if (registrationMutation.isLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Loading"),
              backgroundColor: AppColors.primaryColor,
            ),
          );
        } else {
          if (registrationMutation.data!['registerUser'] == "User registration Successful!") {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("User registration Successful!"),
                backgroundColor: AppColors.successColor,
              ),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const AuthenticationScreen()),
              (route) => false,
            );
          }
        }
      }
    }
  }
}
