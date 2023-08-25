import 'dart:async';


import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import '../models/user_details_model.dart';
import '../models/user_model.dart';


class UserProvider extends ChangeNotifier {
  //static const apiEndpoint = "https://api.openweathermap.org/data/2.5/weather?lat=17.413828&lon=78.439758&appid=44b5f8bbece2b49404464ee1f7a12651";

  bool isLoading = true;
  String error = '';
  UserModel? userModel;
  List<UserDetailsModel>? userDetailsModel;


  Future<void> getUserLogin(String username, String password) async {
    try {
      var response = await http.get(Uri.parse(
          'https://dev-a1d8qamadu76pps.api.raw-labs.com/mock?str=$username&str2=$password'));
    

      if (response.statusCode == 200) {
        userModel = userModelFromJson(response.body);
       
        debugPrint("printing.. ${userModel!.message.toString()}");
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
 Future<void> getUserDetails() async {
    try {
      var response = await http.get(Uri.parse(
          'https://dev-a1d8qamadu76pps.api.raw-labs.com/country-medals?country=GBR&year=1992'));
    

      if (response.statusCode == 200) {
        userDetailsModel = userDetailsModelFromJson(response.body);
     
        debugPrint("printing.. ${userDetailsModel!.first.group.first.country}");
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

}