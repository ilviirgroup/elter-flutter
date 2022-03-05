import 'package:elter/entity/repos/visited_repository.dart';
import 'package:elter/presenter/cubit/visited/visited_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'data/network_service.dart';
import 'entity/repos.dart';
import 'entity/models/ads.dart';
import 'presenter/bloc.dart';
import 'presenter/cubit.dart';

import 'presenter/provider.dart';
import 'router/app_on_generate_route.dart';
import 'utils/app_bloc_observer.dart';
import 'utils/app_theme.dart';

final NetworkService networkservice = NetworkService();

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
              networkservice,
            ),
          )
          ..add(AdsFetchEvent()),
        ),
        BlocProvider(
          create: (context) => AdsProductCubit(
            ProductRepository(
              networkservice,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(
            userRepository: UserRepository(
              networkservice,
            ),
          ),
        ),
        BlocProvider(
            create: (context) => CategoryCubit(
                  CategoryRepository(
                    networkservice,
                  ),
                )),
        BlocProvider(
          create: (context) => ChangeBottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeCatalogScreensCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeHomeScreensCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeTabsLengthCubit(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => MyOrdersBloc(
            OrderRepository(
              networkservice,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            ProductRepository(
              networkservice,
            ),
          )
          ..add(
              ProductFetchedEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => SearchTappedCubit(),
        ),
        BlocProvider(
          create: (context) => SubCategoryCubit(
            SubCategoryRepository(
              networkservice,
            ),
          )
          ..fetchSubCategories(),
        ),
        BlocProvider(
          create: (context) => SuperCategoryCubit(
            SuperCategoryRepository(
              networkservice,
            ),
          )
          ..fetchSuperCategories(),
        ),
        BlocProvider(
          create: (context) => TemporaryAdsObjectCubit()
            ..temporaryAdsObject(Ads(
                pk: 0,
                description: '',
                name: '',
                photo: '',
                superCategory: '')
                ),
        ),
        BlocProvider(
          create: (context) => TogglePasswordCubit(),
        ),
        BlocProvider(
          create: (context) => VisitedCubit(
            VisitedRepository(
              networkservice,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => UpdateAvailableCubit(
            UpdateRepository(
              networkservice,
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
