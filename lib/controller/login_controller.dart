

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../model/user_model.dart';

class LoginController extends ChangeNotifier {

  AccessToken? accessToken;
  UserModel? currentUser;

  Future<void> signIn() async {
     await FacebookAuth.i.login().then((value) async {
      if (value.status == LoginStatus.success) {
        accessToken = value.accessToken;

        await FacebookAuth.i.getUserData().then((value) {

          UserModel model = UserModel.fromJson(value);

          currentUser = model;
          notifyListeners();
        }).catchError((onError){
          print(onError);
        });

        notifyListeners();
      }
    }).catchError((onError){
      print(onError);
      notifyListeners();
    });



  }

  Future<void> signOut() async {
    await FacebookAuth.i.logOut();
    currentUser = null;
    accessToken = null;
 notifyListeners();
  }

  }