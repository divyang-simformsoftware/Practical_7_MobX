import 'package:bitcoin_app/main.dart';
import 'package:bitcoin_app/store/bottomnav_store.dart';
import 'package:bitcoin_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomStore = context.read<BottomNavStore>();

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Today'),
          actions: [
            IconButton(
              onPressed: themeStore.setDarkLightTheme,
              icon: Observer(
                builder: (context) {
                  return Icon(themeStore.themeToggle
                      ? Icons.light_mode
                      : Icons.dark_mode);
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              child: const Text('Logout'),
            )
          ],
        ),
        body: Observer(
          builder: (_) {
            return AppConst.appBodyList.elementAt(bottomStore.selectedIndex);
          },
        ),
        bottomNavigationBar: Observer(
          builder: (_) {
            return BottomNavigationBar(
              currentIndex: bottomStore.selectedIndex,
              onTap: (value) => bottomStore.updateIndex(value),
              items: List.generate(
                AppConst.bottomAppList.length,
                (index) => AppConst.bottomAppList.elementAt(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
