import 'package:app_ecom_buidlagga/blocs/auth/auth_bloc.dart';
import 'package:app_ecom_buidlagga/ui/pages/data_pakage_page.dart';
import 'package:app_ecom_buidlagga/ui/pages/data_provider_page.dart';
import 'package:app_ecom_buidlagga/ui/pages/data_sukses_page.dart';
import 'package:app_ecom_buidlagga/ui/pages/tranfer_page.dart';
import 'package:app_ecom_buidlagga/ui/pages/profil__edit_susses.dart';
import 'package:app_ecom_buidlagga/ui/pages/sign_in_page.dart';
import 'package:app_ecom_buidlagga/ui/pages/sign_up_page.dart';

import 'package:app_ecom_buidlagga/ui/pages/top_up_amout.dart';
import 'package:app_ecom_buidlagga/ui/pages/top_up_page.dart';
import 'package:app_ecom_buidlagga/ui/pages/top_up_succses.dart';
import 'package:app_ecom_buidlagga/ui/pages/tranfer_amout_page.dart';
import 'package:app_ecom_buidlagga/ui/pages/tranfer_sukses_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/theme.dart';
import 'ui/pages/home_page.dart';
import 'ui/pages/on_boarding_page.dart';
import 'ui/pages/pin_page.dart';
import 'ui/pages/profile_edit_pin.dart';
import 'ui/pages/profile_edit_profile.dart';
import 'ui/pages/profile_page.dart';
import 'ui/pages/sign_up_succes_page.dart';
import 'ui/pages/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()
            ..add(
              AuthGetCurrentUser(),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: lightBackgroundColor,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(color: blackColor),
              titleTextStyle: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 20,
              ),
            )),
        routes: {
          '/': (context) => const SplashScreenPage(),
          '/onboarding': (context) => const OnBoardingPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up-succes': (context) => const SignUpSucces(),
          '/home-page': (context) => const HomePage(),
          '/profil-page': (context) => const ProfilePage(),
          '/pin-page': (context) => const PinPage(),
          '/edit-profil-page': (context) => const EditProfilePage(),
          '/edit-profil-pin': (context) => const ProfilEditPin(),
          '/edit-profil-sukses': (context) => const EditProfileSukses(),
          '/top-up': (context) => const TopUpPage(),
          '/top-up-amount': (context) => const TopUpAmount(),
          '/top-up-sukses': (context) => const TopUpSuccses(),
          '/tranfer-page': (context) => const TranferPage(),
          '/tranfer-amount': (context) => const TranferAmount(),
          '/tranfer-sukses': (context) => const TranferSukses(),
          '/data-provider': (context) => const DataProvider(),
          '/data-pakage': (context) => const DataProviderPage(),
          '/data-sukses': (context) => const DataSuksesPage(),
        },
      ),
    );
  }
}
