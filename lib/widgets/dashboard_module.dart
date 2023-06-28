import 'package:bitcoin_app/utils/export.dart';
import '../model/bitcoin_model.dart';
import '../store/bitcoin_store.dart';

class DashboardModule extends StatelessWidget {
  const DashboardModule({super.key});

  @override
  Widget build(BuildContext context) {
    final bitcoinStore = context.read<BitcoinStore>();
    return Observer(
      builder: (context) {
        if (bitcoinStore.bitcoinList.status == FutureStatus.pending) {
          return const Center(child: CircularProgressIndicator());
        } else if (bitcoinStore.bitcoinList.error != null) {
          return Center(
            child: Chip(
              label: Text(
                bitcoinStore.bitcoinList.error.toString(),
              ),
              backgroundColor: Colors.red,
              labelStyle: const TextStyle(color: Colors.white),
            ),
          );
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                textInputAction: TextInputAction.search,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                onChanged: (value) => bitcoinStore.searchBitcoinItem(
                    searchValue: value.toLowerCase().trim()),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search coins"),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: bitcoinStore.getCurrentBitcoinLength(),
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  BitcoinDataModel model = bitcoinStore.searchedList.isNotEmpty
                      ? bitcoinStore.searchedList.elementAt(index)
                      : bitcoinStore.bitcoinList.value!.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 100,
                            margin: const EdgeInsets.only(top: 50),
                            child: ListTile(
                              leading: Image.network(
                                model.bitcoinImage,
                                frameBuilder: (_, child, frame, __) {
                                  if (frame == null) {
                                    return CircleAvatar(
                                      backgroundColor:
                                          Colors.indigo.withOpacity(0.1),
                                    );
                                  }
                                  return child;
                                },
                              ),
                              title: Text(model.bitcoinName),
                              subtitle: Text(
                                  "₹ ${model.bitcoinCurrentPrice.toString()}"),
                              trailing: Observer(
                                builder: (context) {
                                  return IconButton(
                                    onPressed: () {
                                      if (bitcoinStore
                                          .checkItemExistInFavourite(model)) {
                                        bitcoinStore.removeFavouriteItem(model);
                                      } else {
                                        bitcoinStore.addFavouriteItems(model);
                                      }
                                    },
                                    icon: Icon(
                                      bitcoinStore
                                              .checkItemExistInFavourite(model)
                                          ? Icons.favorite_rounded
                                          : Icons.favorite_border_rounded,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.network(
                            model.bitcoinImage,
                            frameBuilder: (_, child, frame, __) {
                              if (frame == null) {
                                return CircleAvatar(
                                  backgroundColor:
                                      Colors.indigo.withOpacity(0.1),
                                );
                              }
                              return child;
                            },
                          ),
                          title: Text(model.bitcoinName),
                          trailing: Text(
                            "₹ ${model.bitcoinCurrentPrice.toString()}",
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
