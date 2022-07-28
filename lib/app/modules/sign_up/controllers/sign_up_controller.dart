import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:xyz/app/modules/otp/controllers/otp_controller.dart';
import 'package:xyz/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:xyz/app/routes/app_pages.dart';
import 'package:xyz/services/storage.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  static SignUpController get to =>Get.find();
  final textEditingController = TextEditingController().obs;
  final textEditingControllerotp = TextEditingController().obs;
  final veryficationId = "".obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    //  mobileVeryFication();
    print("called mobile verification");
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  var mytoken = ''.obs;

  Future<void> validateCreatetoken(User user) async {
    bool hasExpired = true;

    while (hasExpired) {
      mytoken.value = await user.getIdToken();
      // generate token
      await Future.delayed(Duration(milliseconds: 200));
      hasExpired = JwtDecoder.isExpired(mytoken.value);
     print("jwt ${mytoken.value}");

     Get.find<GetStorageService>().jwToken = mytoken.value;
      Get.find<GetStorageService>().setisLoggedIn=true;
      log("${Get.find<GetStorageService>().jwToken}");


      // Get.find<GetStorageService>().uid = user.uid;
    }
  }

/*Future<void> genrateToken() async {
  final user = await FirebaseAuth.instance.currentUser;
  final idToken = await user!.getIdToken();
  //final token = idToken.;
}*/
  Future<void> signInWithGoogle() async {
    await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final authResult = await _auth.signInWithCredential(credential);
      final _user = authResult.user;
      final currentUser = await _auth.currentUser;
      // assert(_user!.uid == currentUser!.uid);
      print("User Name: ${_user!.displayName}");
      print("User Email ${_user.email}");
      Get.toNamed(Routes.WELCOME);
    } catch (e) {
      Get.snackbar("Message", "Authentication Fail");
    }
  }
Rx<bool> loader=false.obs;
  Future<void> mobileVeryFication(String mobileNumber) async {
  loader.value=true;
    await Firebase.initializeApp();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: mobileNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        print("verificationCompleted");
      },
      verificationFailed: (FirebaseAuthException e) {
        print("verificationFailed");
      },
      codeSent: (String verificationId, int? resendToken) async {
        veryficationId.value = verificationId;
        // print("codeSent");
        Get.snackbar("Message", "OTP sent to ${mobileNumber}");

      //  await Get.find<WelcomeController>().fetchCategories();
loader.value=false;
        Get.offNamed(Routes.OTP);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("codeAutoRetrievalTimeout");
      },
    );
  }
Rx<bool> loaderOtp=false.obs;
  Future<void> OtpVerification() async {
    loaderOtp.value=true;
    String smsCode = Get.find<OtpController>().textControllerOne.value.text +
        Get.find<OtpController>().textControllerTwo.value.text +
        Get.find<OtpController>().textControllerThree.value.text +
        Get.find<OtpController>().textControllerFour.value.text +
        Get.find<OtpController>().textControllerFive.value.text +
        Get.find<OtpController>().textControllerSix.value.text;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: veryficationId.value, smsCode: smsCode.trim());

      // Sign the user in (or link) with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Successful otp verification");
      loaderOtp.value=false;
      Get.offAllNamed(Routes.WELCOME);
    } catch (e) {
      print("error while verification");
    }
  }
}
