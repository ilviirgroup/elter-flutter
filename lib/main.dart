import 'utils/constants/constants.dart';
import 'view/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/network_service.dart';
import 'entity/models.dart';
import 'entity/repos.dart';
import 'presenter/bloc.dart';
import 'presenter/cubit.dart';

import 'utils/app_bloc_observer.dart';
import 'utils/app_theme.dart';

final NetworkService networkservice = NetworkService();

void main() async {
  await Hive.initFlutter();
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
          create: (context) => CartBloc(
            CartRepository(),
          )..add(CartInitializedEvent()),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(
            userRepository: UserRepository(
              networkservice,
            ),
          )..add(
              AuthenticationInitializedEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => AdsBloc(
            AdsRepository(
              networkservice,
            ),
          )..add(AdsFetchEvent()),
        ),
        BlocProvider(
          create: (context) => AdsProductCubit(
            ProductRepository(
              networkservice,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => BrandBloc(
            BrandRepository(
              networkservice,
            ),
          )..add(
              BrandFetched(),
            ),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(
            CategoryRepository(
              networkservice,
            ),
          )..fetchCategories(),
        ),
        BlocProvider(
          create: (context) => ChangeBottomNavCubit()
            ..changeBottomNavIndex(BottomNavScreen.home),
        ),
        BlocProvider(
          create: (context) => ChangeCatalogScreensCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeTabsLengthCubit(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(
            UserRepository(
              networkservice,
            ),
          )..add(
              AppStartEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => MyOrdersBloc(
            OrderRepository(
              networkservice,
            ),
          )..add(MyOrdersInitializedEvent()),
        ),
        BlocProvider(
          create: (context) => OnProductDetailPageCubit()..onNextPage(() {}),
        ),
        BlocProvider(
          create: (context) => OnSignInPageCubit()..toSignInPage(() {}),
        ),
        BlocProvider(
          create: (context) => OnCartPageCubit()..toCartPage(() {}),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            ProductRepository(
              networkservice,
            ),
          )..add(
              ProductFetchedEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => SearchTappedCubit(),
        ),
        BlocProvider(
          create: (context) => SortByCubit()..sortBy(''),
        ),
        BlocProvider(
          create: (context) => SubCategoryCubit(
            SubCategoryRepository(
              networkservice,
            ),
          )..fetchSubCategories(),
        ),
        BlocProvider(
          create: (context) => SuperCategoryCubit(
            SuperCategoryRepository(
              networkservice,
            ),
          )..fetchSuperCategories(),
        ),
        BlocProvider(
          create: (context) => TemporaryAdsObjectCubit()
            ..temporaryAdsObject(
              Ads(
                  pk: 0,
                  description: '',
                  name: '',
                  photo: '',
                  superCategory: ''),
            ),
        ),
        BlocProvider(
          create: (context) => TemporarySubcategoryObjectCubit()
            ..temporarySubCategoryObject(''
                ),
        ),
        BlocProvider(
          create: ((context) => VendorBloc(
                VendorRepository(
                  networkservice,
                ),
              )..add(
                  VendorFetched(),
                )),
        ),
        BlocProvider(
          create: (context) => TogglePasswordCubit(),
        ),
        BlocProvider(
          create: (context) => VerificationBloc(
            VerificationCodeRepository(
              networkservice,
            ),
          )..add(VerificationCodeFetchedEvent()),
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        home: const WelcomeScreen(),
      ),
    );
  }
}
