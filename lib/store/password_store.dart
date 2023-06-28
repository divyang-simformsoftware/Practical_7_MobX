import '../utils/export.dart';

part 'password_store.g.dart';

class PasswordStore = PasswordStoreBase with _$PasswordStore;

abstract class PasswordStoreBase with Store {
  @observable
  bool isPassVisible = true;
}
