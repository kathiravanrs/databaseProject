import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:login_example/database_connection.dart';
import 'package:login_example/display_page.dart';
import 'package:login_example/userpass.dart';
import 'package:login_example/widgets/registration_screen.dart';

import 'constants.dart';
import 'custom_route.dart';
import 'dashboard_screen.dart';
// import 'users.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';
  var userData;

  Future<dynamic> store() {
    return getData("Select * from userpass");
  }

  LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 200);

  Future<String?> _loginUser(LoginData data, BuildContext context) {
    return Future.delayed(loginTime).then((_) {
      var name = data.name;
      var pass = data.password;

      if (name == "admin@admin.com" && pass == "admin") {
        Navigator.pushNamed(context, DisplayPage.routeName);
      }

      bool exists = false;
      for (var js in userData) {
        if (js["username"] == name) {
          exists = true;
          if (js["password"] == encode(pass)) {
            return null;
          } else {
            return ("Wwrong Password");
          }
        }
      }
      if (!exists) return ("No user found with the given email");
      return "null";
    });
  }

  Future<String?> _signupUser(SignupData data) {
    // Navigator.of(context).pushNamed(context, RegistrationScreen.routeName);
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      // if (!mockUsers.containsKey(name)) {
      //   return 'User not exists';
      // }
      return null;
    });
  }

  Future<String?> _signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   getData("Select * from userpass").then((value) {
  //     print(userData.toString());
  //     return FlutterLogin(
  //       title: Constants.appName,
  //       logo: const AssetImage('assets/images/ecorp.png'),
  //       logoTag: Constants.logoTag,
  //       titleTag: Constants.titleTag,
  //       navigateBackAfterRecovery: true,
  //       onConfirmRecover: _signupConfirm,
  //       onConfirmSignup: _signupConfirm,
  //       loginAfterSignUp: false,
  //       // termsOfService: [
  //       //   TermOfService(
  //       //       id: 'general-term',
  //       //       mandatory: true,
  //       //       text: 'Term of services',
  //       //       linkUrl: 'https://github.com/NearHuscarl/flutter_login'),
  //       // ],
  //       // additionalSignupFields: [
  //       //   const UserFormField(
  //       //       keyName: 'Username', icon: Icon(FontAwesomeIcons.userAlt)),
  //       //   const UserFormField(keyName: 'Name'),
  //       //   const UserFormField(keyName: 'Surname'),
  //       //   const UserFormField(keyName: 'Birthdate'),
  //       //   const UserFormField(keyName: 'Country'),
  //       //   // const UserFormField(keyName: 'Gender'),
  //       //   // const UserFormField(keyName: 'Passport Number'),
  //       //   // const UserFormField(keyName: 'Passport Expiry Date'),
  //       //   UserFormField(
  //       //     keyName: 'phone_number',
  //       //     displayName: 'Phone Number',
  //       //     userType: LoginUserType.phone,
  //       //     fieldValidator: (value) {
  //       //       var phoneRegExp = RegExp(
  //       //           '^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}\$');
  //       //       if (value != null &&
  //       //           value.length < 7 &&
  //       //           !phoneRegExp.hasMatch(value)) {
  //       //         return "This isn't a valid phone number";
  //       //       }
  //       //       return null;
  //       //     },
  //       //   ),
  //       // ],
  //       initialAuthMode: AuthMode.login,
  //       // hideProvidersTitle: false,
  //       hideForgotPasswordButton: true,
  //       // disableCustomPageTransformer: true,
  //       // messages: LoginMessages(
  //       //   userHint: 'User',
  //       //   passwordHint: 'Pass',
  //       //   confirmPasswordHint: 'Confirm',
  //       //   loginButton: 'LOG IN',
  //       //   signupButton: 'REGISTER',
  //       //   forgotPasswordButton: 'Forgot huh?',
  //       //   recoverPasswordButton: 'HELP ME',
  //       //   goBackButton: 'GO BACK',
  //       //   confirmPasswordError: 'Not match!',
  //       //   recoverPasswordIntro: 'Don\'t feel bad. Happens all the time.',
  //       //   recoverPasswordDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  //       //   recoverPasswordSuccess: 'Password rescued successfully',
  //       //   flushbarTitleError: 'Oh no!',
  //       //   flushbarTitleSuccess: 'Succes!',
  //       //   providersTitle: 'login with'
  //       // ),
  //       theme: LoginTheme(
  //         primaryColor: Colors.teal,
  //         accentColor: Colors.white60,
  //         errorColor: Colors.deepOrange,
  //         pageColorLight: Colors.white60,
  //         pageColorDark: Colors.white60,
  //         logoWidth: 0.80,
  //         titleStyle: const TextStyle(
  //           color: Colors.redAccent,
  //           fontFamily: 'Quicksand',
  //           letterSpacing: 4,
  //         ),
  //         // beforeHeroFontSize: 50,
  //         // afterHeroFontSize: 20,
  //         bodyStyle: const TextStyle(
  //           fontStyle: FontStyle.italic,
  //           decoration: TextDecoration.underline,
  //         ),
  //         textFieldStyle: const TextStyle(
  //           color: Colors.orange,
  //           shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
  //         ),
  //         buttonStyle: const TextStyle(
  //           fontWeight: FontWeight.w800,
  //           color: Colors.black,
  //         ),
  //         cardTheme: CardTheme(
  //           color: Colors.white38,
  //           elevation: 5,
  //           margin: const EdgeInsets.only(top: 15),
  //           shape: ContinuousRectangleBorder(
  //               borderRadius: BorderRadius.circular(100.0)),
  //         ),
  //         inputTheme: InputDecorationTheme(
  //           filled: true,
  //           fillColor: Colors.purple.withOpacity(.1),
  //           contentPadding: EdgeInsets.zero,
  //           errorStyle: const TextStyle(
  //             backgroundColor: Colors.orange,
  //             color: Colors.white,
  //           ),
  //           labelStyle: const TextStyle(fontSize: 12),
  //         ),
  //         buttonTheme: LoginButtonTheme(
  //           splashColor: Colors.white,
  //           backgroundColor: Colors.greenAccent,
  //           highlightColor: Colors.lightGreen,
  //           elevation: 9.0,
  //           highlightElevation: 6.0,
  //           shape: BeveledRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  //           // shape: CircleBorder(side: BorderSide(color: Colors.green)),
  //           // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
  //         ),
  //       ),
  //       userValidator: (value) {
  //         if (!value!.contains('@') || !value.endsWith('.com')) {
  //           return "Email must contain '@' and end with '.com'";
  //         }
  //         return null;
  //       },
  //       passwordValidator: (value) {
  //         if (value!.isEmpty) {
  //           return 'Password is empty';
  //         }
  //         return null;
  //       },
  //       onLogin: (loginData) {
  //         debugPrint('Login info');
  //         debugPrint('Name: ${loginData.name}');
  //         debugPrint('Password: ${loginData.password}');
  //         return _loginUser(loginData);
  //       },
  //       onSignup: (signupData) {
  //         String user = '"' + signupData.name.toString() + '"';
  //         String pass = '"' + encode(signupData.password.toString()) + '"';
  //
  //         Navigator.pushNamed(context, RegistrationScreen.routeName,
  //             arguments: UsernamePass(signupData.name, signupData.password));
  //
  //         postData("userpass", ["username", "password"], [user, pass]);
  //         debugPrint('Signup info');
  //         debugPrint('Name: ${signupData.name}');
  //         debugPrint('Password: ${signupData.password}');
  //
  //         signupData.additionalSignupData?.forEach((key, value) {
  //           debugPrint('$key: $value');
  //         });
  //         if (signupData.termsOfService.isNotEmpty) {
  //           debugPrint('Terms of service: ');
  //           for (var element in signupData.termsOfService) {
  //             debugPrint(
  //                 ' - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
  //           }
  //         }
  //         return _signupUser(signupData);
  //       },
  //       onSubmitAnimationCompleted: () {
  //         Navigator.of(context).pushReplacement(FadePageRoute(
  //           builder: (context) => const DashboardScreen(),
  //         ));
  //       },
  //       onRecoverPassword: (name) {
  //         debugPrint('Recover password info');
  //         debugPrint('Name: $name');
  //         return _recoverPassword(name);
  //         // Show new password dialog
  //       },
  //       // showDebugButtons: true,
  //     );
  //   }).catchError((e) {
  //     return Container();
  //   });

  @override
  Widget build(BuildContext context) {
    // print(userData.toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
          leading: const Icon(
            Icons.home,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getData("Select * from userpass"),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                userData = snapshot.data;

                return FlutterLogin(
                  title: Constants.appName,
                  logo: const AssetImage('assets/images/ecorp.png'),
                  logoTag: Constants.logoTag,
                  titleTag: Constants.titleTag,
                  navigateBackAfterRecovery: true,
                  onConfirmRecover: _signupConfirm,
                  onConfirmSignup: _signupConfirm,
                  loginAfterSignUp: false,
                  initialAuthMode: AuthMode.login,
                  hideForgotPasswordButton: true,
                  messages:
                      LoginMessages(signupButton: "Register as a new user"),

                  theme: LoginTheme(
                    primaryColor: Colors.teal,
                    accentColor: Colors.white60,
                    errorColor: Colors.deepOrange,
                    pageColorLight: Colors.white60,
                    pageColorDark: Colors.white60,
                    logoWidth: 0.80,
                    titleStyle: const TextStyle(
                      color: Colors.redAccent,
                      fontFamily: 'Quicksand',
                      letterSpacing: 4,
                    ),
                    // beforeHeroFontSize: 50,
                    // afterHeroFontSize: 20,
                    bodyStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                    textFieldStyle: const TextStyle(
                      color: Colors.orange,
                      shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
                    ),
                    buttonStyle: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    cardTheme: CardTheme(
                      color: Colors.white38,
                      elevation: 5,
                      margin: const EdgeInsets.only(top: 15),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                    ),
                    inputTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: Colors.purple.withOpacity(.1),
                      contentPadding: EdgeInsets.zero,
                      errorStyle: const TextStyle(
                        backgroundColor: Colors.orange,
                        color: Colors.white,
                      ),
                      labelStyle: const TextStyle(fontSize: 12),
                    ),
                    buttonTheme: LoginButtonTheme(
                      splashColor: Colors.white,
                      backgroundColor: Colors.greenAccent,
                      highlightColor: Colors.lightGreen,
                      elevation: 9.0,
                      highlightElevation: 6.0,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      // shape: CircleBorder(side: BorderSide(color: Colors.green)),
                      // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
                    ),
                  ),

                  userValidator: (value) {
                    if (!value!.contains('@') || !value.contains('.')) {
                      return "Email must contain '@' and a domain";
                    }
                    return null;
                  },

                  passwordValidator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is empty';
                    }
                    return null;
                  },

                  onLogin: (loginData) {
                    debugPrint('Login info');
                    debugPrint('Name: ${loginData.name}');
                    debugPrint('Password: ${loginData.password}');
                    return _loginUser(loginData, context);
                  },

                  onSignup: (signupData) {
                    String user = '"' + signupData.name.toString() + '"';
                    String pass =
                        '"' + encode(signupData.password.toString()) + '"';

                    Navigator.pushNamed(context, RegistrationScreen.routeName,
                        arguments:
                            UsernamePass(signupData.name, signupData.password));

                    postData(
                        "userpass", ["username", "password"], [user, pass]);
                    debugPrint('Signup info');
                    debugPrint('Name: ${signupData.name}');
                    debugPrint('Password: ${signupData.password}');

                    signupData.additionalSignupData?.forEach((key, value) {
                      debugPrint('$key: $value');
                    });
                    if (signupData.termsOfService.isNotEmpty) {
                      debugPrint('Terms of service: ');
                      for (var element in signupData.termsOfService) {
                        debugPrint(
                            ' - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
                      }
                    }
                    return _signupUser(signupData);
                  },

                  onSubmitAnimationCompleted: () {
                    Navigator.of(context).pushReplacement(FadePageRoute(
                      builder: (context) => const DashboardScreen(),
                    ));
                  },

                  onRecoverPassword: (name) {
                    debugPrint('Recover password info');
                    debugPrint('Name: $name');
                    return _recoverPassword(name);
                    // Show new password dialog
                  },
                  // showDebugButtons: true,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
