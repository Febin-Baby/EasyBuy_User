import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/model/user_model.dart';
import 'package:easybuy_user_app/view/screens/auth/sign_in_page.dart';
import 'package:easybuy_user_app/view/screens/navbar/navbarscreen/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  //Create instances

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore database = FirebaseFirestore.instance;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  var loading = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController textEditingController = TextEditingController();

  // Google Sign-In
  googleSignIn() async {
    loading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await auth.signInWithCredential(credential);

        // Check if the user already exists in the database
        DocumentSnapshot userSnapshot = await database
            .collection('users')
            .doc(auth.currentUser?.email)
            .collection('logincredential')
            .doc(auth.currentUser?.email)
            .get();
        if (!userSnapshot.exists) {
          // Add the user's data to the database if it doesn't exist
          await adduserdata(
            UserModel(
              email: auth.currentUser?.email ?? '',
              name: auth.currentUser?.displayName ?? '',
              id: auth.currentUser?.uid ?? '',
            ),
          );
        }
        loading.value = false;
        Get.offAll(const CustomNavigationBar());
        Get.snackbar(
          'Sign In Success',
          'Welcome to i Store',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kgrey,
        );
      } else {
        loading.value = false;
        Get.snackbar(
          'Google Sign In Error',
          'Sign in process was canceled',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kgrey,
        );
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar(
        'Google Sign In Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kgrey,
      );
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Password reset email sent successfully
      Get.snackbar(
        'Reset password email sent successfully',
        'Enjoy your Freedom',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kgrey,
      );
      Get.back();
    } catch (e) {
      // Handle any errors that occurred during the process
      Get.snackbar(
        'Something went wrong',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kgrey,
      );
    }
  }

  // Example usage in your "Forgot Password" screen
  void resetPasswordd() {
    String email = textEditingController.text; // Get the email from the input field
    resetPassword(email);
  }

  // Function to fetch user details
  Future<Map<String, dynamic>?> getUserDetails() async {
    final auth = FirebaseAuth.instance;
    final database = FirebaseFirestore.instance;

    try {
      DocumentSnapshot userSnapshot = await database
          .collection('users')
          .doc(auth.currentUser?.email)
          .collection('logincredential')
          .doc(auth.currentUser?.email)
          .get();
          
      if (userSnapshot.exists) {
        return userSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user details: $e');
      }
    }
    return null; // Return null if no user details found
  }

  signuUp() async {
    loading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await adduserdata(UserModel(
        email: email.text,
        name: name.text,
        id: auth.currentUser?.uid,
      ));
      loading.value = false;
      Get.snackbar(
        'Successfully Sign up',
        'Enjoy your freedom',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kgrey,
      );
      Get.offAll(const CustomNavigationBar());
    } catch (e) {
      loading.value = false;
      Get.snackbar(
        'Something went wrong',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kgrey,
      );
    }
  }

  logout() async {
    try {
      await auth.signOut();
      Get.snackbar(
        'Successfully Log out',
        '',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kgrey,
      );
      Get.offAll(SignInPage());
    } catch (e) {
      Get.snackbar('Something went wrong', '$e');
    }
  }

  //Sign in user
  signIn() async {
    loading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: loginemail.text.trim(),
        password: loginpassword.text.trim(),
      );
      loginemail.clear();
      loginpassword.clear();
      Get.offAll(const CustomNavigationBar());
      Get.snackbar(
        'Successfully Login',
        'Enjoy your freedom',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
      loading.value = false;
    } catch (e) {
      loading.value = false;
      Get.snackbar(
        'Something went wrong',
        'Cross check Entered Fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kgrey,
      );
      debugPrint('Something issue when login tym $e');
    }
  }

  //Add user to firabase
  adduserdata(UserModel userModel) async {
    try {
      await database
          .collection('users')
          .doc(auth.currentUser?.email)
          .collection('logincredential')
          .add(userModel.toMap());
    } catch (e) {
      Get.snackbar('Something went wrong', '$e');
    }
  }
}
