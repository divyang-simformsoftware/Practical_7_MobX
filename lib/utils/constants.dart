import 'package:bitcoin_app/pages/favourite_page.dart';
import 'package:bitcoin_app/utils/export.dart';
import 'package:bitcoin_app/widgets/dashboard_module.dart';

class AppConst {
  static const String bitcoinAPIURL =
      "https://mocki.io/v1/dca0bf7a-937b-4267-a1d9-6a7aeb9d9ca9";
  static const String authLoginURL = "https://reqres.in/api/login";
  static const String imageURL =
      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";

  static List<BottomNavigationBarItem> bottomAppList = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: "Dashboard",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outlined),
      label: "Favourites",
    )
  ];

  static List<Widget> appBodyList = [
    const DashboardModule(),
    const FavouritePage()
  ];
}
