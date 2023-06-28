// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'package:bitcoin_app/model/bitcoin_model.dart';
import 'package:bitcoin_app/service/api_service.dart';
import 'package:mobx/mobx.dart';

import '../utils/export.dart';
part 'bitcoin_store.g.dart';

class BitcoinStore = _BitcoinStore with _$BitcoinStore;

abstract class _BitcoinStore with Store {
  ObservableFuture<List<BitcoinDataModel>> bitcoinList =
      ObservableFuture.value([]);
  ObservableList<BitcoinDataModel> selectedList = ObservableList.of([]);
  @observable
  List<BitcoinDataModel> searchedList = [];
  _BitcoinStore() {
    fetchApi();
  }

  void fetchApi() {
    bitcoinList = ObservableFuture(ApiService().getBitcoinApi());
  }

  void addFavouriteItems(BitcoinDataModel model) => selectedList
    ..add(model)
    ..sort(
      (a, b) => a.bitcoinName.compareTo(b.bitcoinName),
    );

  void removeFavouriteItem(BitcoinDataModel model) => selectedList
      .removeWhere((element) => element.bitcoinName == model.bitcoinName);

  bool checkItemExistInFavourite(BitcoinDataModel model) {
    return selectedList
        .where((element) => element.bitcoinName == model.bitcoinName)
        .isNotEmpty;
  }

  void searchBitcoinItem({required String searchValue}) {
    if (searchValue.isNotEmpty) {
      searchedList = bitcoinList.value!
          .where(
            (element) =>
                element.bitcoinName.toLowerCase().trim().contains(searchValue),
          )
          .toList();
    } else {
      searchedList = bitcoinList.value!;
    }
  }

  int getCurrentBitcoinLength() {
    return searchedList.isNotEmpty
        ? searchedList.length
        : bitcoinList.value!.length;
  }
}
