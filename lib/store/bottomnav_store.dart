import '../utils/export.dart';

part 'bottomnav_store.g.dart';

class BottomNavStore = BottomNavStoreBase with _$BottomNavStore;

abstract class BottomNavStoreBase with Store {
  @observable
  int selectedIndex = 0;

  void updateIndex(int index) => selectedIndex = index;
}
