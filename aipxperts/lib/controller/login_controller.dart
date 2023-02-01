import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: camel_case_types
class loginController extends GetxController {
  // ignore: prefer_final_fields
  var _googlesignin = GoogleSignIn();
  var googleaccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    googleaccount.value = await _googlesignin.signIn();
  }
}
