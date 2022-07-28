// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:music_coast_artist/Authentication/authConstants.dart';
// import 'package:music_coast_artist/app/modules/login/controllers/login_controller.dart';
// import 'package:music_coast_artist/app/routes/app_pages.dart';
// import 'package:music_coast_artist/hasura/hasura_connect.dart';
// import 'package:music_coast_artist/services/responsiveSize.dart';
// import 'package:music_coast_artist/services/storage.dart';
// import 'package:music_coast_artist/services/textstyles.dart';
// import 'package:music_coast_artist/widget/main_button.dart';
//
// import '../services/colors.dart';
//
// class authController extends GetxController {
//   //late GoogleSignIn googleSign;
//   final errorText = ''.obs;
//   final smsCODE = ''.obs;
//
//   //Loader
//   final LoginLoader = false.obs;
//   final loader = false.obs;
//   final ResetLoader = false.obs;
//   final OTPController = TextEditingController().obs;
//
//
//
//   @override
//   void onInit() async {
//     print("AuthController");
//     super.onInit();
//     // googleSign = GoogleSignIn();
//   }
//
//   var mytoken = ''.obs;
//
//   Future<void> validateCreatetoken(User user) async {
//     bool hasExpired = true;
//     bool hasHasuraClaim = false;
//     while (hasExpired || !hasHasuraClaim) {
//       mytoken.value = await user.getIdToken(); // generate token
//       await Future.delayed(Duration(milliseconds: 200));
//       Map<String, dynamic> decodedToken = JwtDecoder.decode(mytoken.value);
//       hasExpired = JwtDecoder.isExpired(mytoken.value);
//       hasHasuraClaim = decodedToken.containsKey('https://hasura.io/jwt/claims');
//       print("jwt ${mytoken.value}");
//       // Get.find<GetStorageService>().sessionId = decodedToken['auth_time'];
//       Get.find<GetStorageService>().jwToken = mytoken.value;
//       print("${Get.find<GetStorageService>().jwToken}");
//       // Get.find<GetStorageService>().uid = user.uid;
//     }
//
//   }
//
//   //Register User with Email and password
//   Future<User?> registerUsingEmailPassword({
//     //required String name,
//     required String email,
//     required String password,
//   }) async {
//     User? user;
//     try {
//       loader.value = true;
//       UserCredential userCredential =
//       await firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       user = userCredential.user;
//       await validateCreatetoken(user!);
//       loader.value = false;
//       user.sendEmailVerification();
//       if (user != null) {
//         // Get.toNamed(Routes.VERIF_YOTP);
//       }
//     } on FirebaseAuthException catch (e) {
//       loader.value = false;
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//         errorText.value = 'The password provided is too weak.';
//         Get.snackbar("Error", errorText.value,
//             snackPosition: SnackPosition.BOTTOM);
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//         errorText.value = 'The account already exists for that email.';
//         Get.snackbar("Error", errorText.value,
//             snackPosition: SnackPosition.BOTTOM);
//       }
//     } catch (e) {
//       loader.value = false;
//
//       print(e);
//       Get.snackbar("Error", "${e}", snackPosition: SnackPosition.BOTTOM);
//     }
//     loader.value = false;
//
//     return user;
//   }
//
//   LoginController loginController = Get.find<LoginController>();
//
// //login firebase
//   void login(String email, String password) async {
//     try {
//       LoginLoader.value = true;
//       UserCredential userCredential = await firebaseAuth
//           .signInWithEmailAndPassword(email: email, password: password);
//       LoginLoader.value = false;
//       await validateCreatetoken(userCredential.user!);
//       await Get.put(GetStorageService()).initState();
//       await HasuraConnectWithAuth('https://hasura.mogoverse.click/v1/graphql');
//       Get.find<GetStorageService>().isLoggedIn = true;
//       Get.toNamed(Routes.NAVBAR);
//       // loginController.EmailController.clear();
//       loginController.PasswordController.clear();
//     } on FirebaseAuthException catch (e) {
//       LoginLoader.value = false;
//       print(e.code);
//       if (e.code == 'unknown') {
//         Get.snackbar(
//           "Error",
//           "${e.code}",
//         );
//       } else {
//         Get.snackbar(
//           "Error",
//           "${e.code}",
//         );
//       }
//     } catch (e) {
//       print(e.toString());
//       Get.snackbar("Error", "${e}");
//       LoginLoader.value = false;
//     }
//     LoginLoader.value = false;
//   }
//
// //Google Login
// //   void googleLogin() async {
// //     try {
// //       GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();
// //       if (googleSignInAccount == null) {
// //       } else {
// //         GoogleSignInAuthentication googleSignInAuthentication =
// //             await googleSignInAccount.authentication;
// //         OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
// //             accessToken: googleSignInAuthentication.accessToken,
// //             idToken: googleSignInAuthentication.idToken);
// //         print("Token : ${googleSignInAuthentication.accessToken}");
// //         await firebaseAuth.signInWithCredential(oAuthCredential);
// //         print(
// //             "${oAuthCredential} ${googleSignInAccount.displayName.toString()} ${googleSignInAccount.email.toString()} ${googleSignInAccount.photoUrl.toString()}");
// //
// //       Get.offAndToNamed(Routes.NAVBAR);
// //       }
// //     } catch (e) {
// //       print(e);
// //       Get.snackbar("Error", "${e}");
// //     }
// //   }
//
// //Facebook
// //   signInWithFacebook() async {
// //     final LoginResult result =
// //         await FacebookAuth.instance.login(permissions: ['email']);
// //     if (result.status == LoginStatus.success) {
// //       final userData = await FacebookAuth.instance.getUserData();
// //       print("User Data  ===  ${userData}");
// //       // handleGetContact(
// //       //     Id: userData["id"].toString(),
// //       //     fullName: userData["name"].toString(),
// //       //     email: userData["email"].toString(),
// //       //     photoUrl: userData["picture"]['data']['url'].toString(),
// //       //     phoneNumber: "");
// //     } else {
// //       Get.snackbar("Info", result.message.toString());
// //     }
// //     // final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);
// //     //return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// //   }
//
// //Sign Out
//   void signOut() {
//     try {
//       firebaseAuth.signOut();
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
// //Forgot password
//   Future resetPassword(String Email) async {
//     try {
//       ResetLoader.value = true;
//
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: Email);
//       Get.toNamed(Routes.LOGIN);
//       ResetLoader.value = false;
//       Get.snackbar("Message", "Email Sent");
//     } catch (e) {
//       ResetLoader.value = false;
//
//       print(e);
//       "${e}".contains(
//           "[firebase_auth/missing-email] An email address must be provided.")
//           ? Get.snackbar("Error", "An email address must be provided")
//           : Get.snackbar("Error", "${e}");
//     }
//     ResetLoader.value = false;
//   }
//
//   var verificationloader = false.obs;
//
//   void resendVerificationCode(String phoneNumber, String token) {
//     firebaseAuth.verifyPhoneNumber(
//         codeSent: (String verificationId, int? forceResendingToken) {},
//         verificationFailed: (FirebaseAuthException error) {},
//         codeAutoRetrievalTimeout: (String verificationId) {},
//         phoneNumber: '',
//         verificationCompleted: (PhoneAuthCredential
//         phoneAuthCredential) {}); // ForceResendingToken from callbacks
//   }
//
//   RxInt? resendToken = 0.obs;
//
//   Future registerUserPhone(String mobile) async {
//     verificationloader.value = true;
//     await firebaseAuth.verifyPhoneNumber(
//       //forceResendingToken: resendToken?.value,
//       phoneNumber: mobile,
//       timeout: Duration(seconds: 60),
//       verificationCompleted: (AuthCredential authCredential) {
//         verificationloader.value = false;
//         Get.snackbar("Message", "Verified");
//       },
//       verificationFailed: (FirebaseAuthException authException) {
//         verificationloader.value = false;
//         print(authException.message);
//         Get.snackbar("Message", "${authException.message}");
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//       codeSent: (String verificationId, [int? forceResendingToken]) {
//         verificationloader.value = false;
//         print(verificationId);
//         print(forceResendingToken);
//
//       },
//     );
//
//     //verificationloader.value = false;
//   }
//
//   var ResendOTPLoader = false.obs;
//   Future<void> verifyPhone(String phoneNumber) async {
//     ResendOTPLoader.value = true;
//     //await Future.delayed(Duration(milliseconds: 100));
//     try {
//       await firebaseAuth.verifyPhoneNumber(
//           phoneNumber: phoneNumber,
//           codeAutoRetrievalTimeout: (String verId) {
//           },
//           codeSent: (verificationId, forceResendingToken) {
//             ResendOTPLoader.value = false;
//
//             Get.snackbar("Message", "OTP sent to ${phoneNumber}");
//           },
//           timeout: const Duration(seconds: 20),
//           verificationCompleted: (AuthCredential phoneAuthCredential) async {},
//           verificationFailed: (error) async {});
//     } on FirebaseAuthException catch (error) {
//       ResendOTPLoader.value = false;
//
//       Get.snackbar("Message", "${error}");
//
//     } catch (e) {
//       ResendOTPLoader.value = false;
//
//       print(e);
//     }
//   }
// }
