import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'data/network_service.dart';
import 'entity/export_repos.dart';
import 'entity/models/ads.dart';
import 'presenter/bloc.dart';
import 'presenter/cubit.dart';
import 'presenter/provider.dart';
import 'router/app_on_generate_route.dart';
import 'utils/app_bloc_observer.dart';
import 'utils/app_theme.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(
      const MyApp(),
    ),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AdsBloc(
            AdsRepository(
              NetworkService(),
            ),
          )..add(AdsFetchEvent()),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(
            userRepository: UserRepository(
              NetworkService(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(
            CategoryRepository(
              NetworkService(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ChangeCatalogScreensCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeHomeScreensCubit()..changeHomeScreen(0),
        ),
        BlocProvider(
          create: (context) => ChangeBottomNavCubit()..changeIndex(0),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => MyOrdersBloc(
            OrderRepository(
              NetworkService(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            ProductRepository(
              NetworkService(),
            ),
          )..add(
              ProductFetchedEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => SearchTappedCubit(),
        ),
        BlocProvider(
          create: (context) => SubCategoryCubit(
            SubCategoryRepository(
              NetworkService(),
            ),
          )..fetchSubCategories(),
        ),
        BlocProvider(
          create: (context) => SuperCategoryCubit(
            SuperCategoryRepository(
              NetworkService(),
            ),
          )..fetchSuperCategories(),
        ),
        BlocProvider(
          create: (context) => TemporaryAdsObjectCubit()
            ..temporaryAdsObject(Ads(
                pk: 0,
                description: '',
                name: '',
                photo: '',
                superCategory: '')),
        ),
        BlocProvider(
          create: (context) => TogglePasswordCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateAvailableCubit(
            UpdateRepository(
              NetworkService(),
            ),
          ),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: DataProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: myTheme,
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }
}
