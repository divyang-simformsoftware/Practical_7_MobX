// ignore_for_file: library_private_types_in_public_api

import 'package:bitcoin_app/service/login_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  ObservableFuture<int>? loginStatus;

  TextEditingController emailController =
      TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passController =
      TextEditingController(text: "cityslicka");

  Future<void> sendReq({required Map map}) async {
    loginStatus =
        ObservableFuture(LoginApiService().getLoginApiService(map: map));
  }
}
