// import 'package:elter/view/pages/base/page_base.dart';
// import 'package:elter/view/pages/catalog/category_list_view.dart';
// import 'package:elter/view/screens/welcome_screen.dart';
// import 'package:flutter/material.dart';

// class PageContainer extends PageContainerBase {
//   final PageType pageType;
//   const PageContainer({Key? key, required this.pageType}) : super(key: key);

//   @override
//   String get pageTitle {
//     switch (pageType) {
//       case PageType.home:
//         return "Home";
//       case PageType.categories:
//         return "Categories";
//       case PageType.shoppingCart:
//         return "My Cart";
//       case PageType.profile:
//         return "My Profile";
//       case PageType.season:
//       default:
//         return "Season";
//     }
//   }

//   @override
//   AppBar get appBar {
//     switch (pageType) {
//       case PageType.home:
//         return AppBar();
//       case PageType.categories:
//         return AppBar();
//       case PageType.shoppingCart:
//         return AppBar();
//       case PageType.profile:
//         return AppBar();
//       case PageType.season:
//       default:
//         return AppBar();
//     }
//   }

//   @override
//   Widget get background {
//     switch (pageType) {
//       case PageType.home:
//         return Container();
//       case PageType.categories:
//         return Container();
//       case PageType.shoppingCart:
//         return Container();
//       case PageType.profile:
//         return Container();
//       case PageType.season:
//       default:
//         return Container();
//     }
//   }

//   @override
//   Widget get body {
//     switch (pageType) {
//       case PageType.welcome:
//         return const WelcomeScreen();
//       case PageType.categories:
//         return const CategoryListView();
//       case PageType.shoppingCart:
//         return Container();
//       case PageType.profile:
//         return Container();
//       case PageType.season:
//       default:
//         return Container();
//       // case PageType.home:
//       // return const MyHomePage();
//     }
//   }
// }
