class BitcoinDataModel {
  String bitcoinName;
  String bitcoinImage;
  double bitcoinCurrentPrice;

  BitcoinDataModel({
    required this.bitcoinName,
    required this.bitcoinImage,
    required this.bitcoinCurrentPrice,
  });

  factory BitcoinDataModel.fromJSON({required Map map}) {
    return BitcoinDataModel(
      bitcoinName: map["name"],
      bitcoinImage: map["image"],
      bitcoinCurrentPrice: double.parse(map["current_price"].toString()),
    );
  }
}
