import 'package:bitcoin_app/store/bitcoin_store.dart';

import '../model/bitcoin_model.dart';
import '../utils/export.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bitcoinStore = context.read<BitcoinStore>();
    final theme = Theme.of(context).textTheme.displayMedium;
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (bitcoinStore.selectedList.isEmpty) {
            return const Center(
              child: Text('No Favourites'),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            itemCount: bitcoinStore.selectedList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 25,
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              BitcoinDataModel model =
                  bitcoinStore.selectedList.elementAt(index);
              return Card(
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -25,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.indigo.withOpacity(0.2),
                        backgroundImage: NetworkImage(model.bitcoinImage),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        model.bitcoinName,
                        style: theme!.copyWith(fontSize: 18),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          bitcoinStore.selectedList.removeAt(index);
                        },
                        icon: const Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          model.bitcoinCurrentPrice.toString(),
                          style: theme.copyWith(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
