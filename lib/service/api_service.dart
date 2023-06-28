import 'dart:convert';
import 'dart:io';
import 'package:bitcoin_app/model/bitcoin_model.dart';
import 'package:bitcoin_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  ApiService._();
  static final ApiService _apiService = ApiService._();
  factory ApiService() => _apiService;
  Future<List<BitcoinDataModel>> getBitcoinApi() async {
    List<BitcoinDataModel> bitcoinList = [];

    Response response = await http.get(Uri.parse(AppConst.bitcoinAPIURL));
    if (response.statusCode == 200) {
      final tempList = jsonDecode(response.body);
      tempList
          .map((e) => bitcoinList.add(BitcoinDataModel.fromJSON(map: e)))
          .toList();
    } else if (response.statusCode == 404) {
      throw HttpException(response.statusCode.toString());
    } else {
      throw const HttpException('Something went wrong');
    }

    return bitcoinList
      ..sort(
        (a, b) => a.bitcoinName.compareTo(b.bitcoinName),
      );
  }
}
