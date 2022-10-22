import 'package:app_ecom_buidlagga/shared/shared_methods.dart';
import 'package:app_ecom_buidlagga/ui/pages/tranfer_amout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/tip/tip_bloc.dart';
import '../../blocs/transacsions/transacsion_bloc.dart';
import '../../blocs/user/user_bloc.dart';
import '../../models/tranfer_from_model.dart';
import '../../shared/theme.dart';
import '../widgets/home_sevicer.dart';
import '../widgets/home_tips_item.dart';
import '../widgets/home_transion.dart';
import '../widgets/home_user_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          backgroundColor: whiteColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle:
              blueTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          unselectedLabelStyle:
              blueTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_overview.png',
                color: blueColor,
                width: 15,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_history.png',
                width: 20,
              ),
              label: 'history',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_statistic.png',
                width: 20,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_reward.png',
                width: 20,
              ),
              label: 'Overview',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {},
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          buidlprofile(context),
          buidwalletCard(),
          buidlevel(),
          buildSevces(context),
          buidTransion(),
          buildSendAgain(),
          buildFrenly(),
        ],
      ),
    );
  }

  Widget buidlprofile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSucces) {
          return Container(
            margin: const EdgeInsets.only(top: 42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.user.username.toString(),
                      style: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: regular),
                    ),
                    Text(
                      state.user.name.toString(),
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profil-page');
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: state.user.profilePicture == null
                              ? const AssetImage(
                                  'assets/img_profile.png',
                                )
                              : NetworkImage(
                                  state.user.profilePicture!,
                                ) as ImageProvider,
                        ),
                      ),
                      child: state.user.verified == 1
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: whiteColor),
                                child: Icon(
                                  Icons.check_circle,
                                  size: 14,
                                  color: greenColor,
                                ),
                              ),
                            )
                          : null,
                    ))
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buidwalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSucces) {
          return Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            height: 220,
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              // ignore: prefer_const_constructors
              image: DecorationImage(
                image: const AssetImage('assets/img_bg_card.png'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.user.name.toString(),
                  style:
                      whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),
                Text(
                  '*** *** *** ${state.user.cardNumber!.substring(12, 16)}',
                  style: whiteTextStyle.copyWith(
                      fontWeight: medium, fontSize: 18, letterSpacing: 8),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Balance',
                  style: whiteTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 14,
                  ),
                ),
                Text(
                  formatCurrency(
                    state.user.balance ?? 0,
                  ),
                  style: whiteTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buidlevel() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(22),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),
              ),
              const Spacer(),
              Text(
                '55%',
                style:
                    greenTextStyle.copyWith(fontWeight: semiBold, fontSize: 14),
              ),
              Text(
                ' Of ${formatCurrency(20000)}',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.60,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBackgroundColor,
            ),
          )
        ],
      ),
    );
  }

  Widget buildSevces(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeSevices(
                iconUrl: 'assets/ic_topup.png',
                title: 'Top UP',
                onTap: () {
                  Navigator.pushNamed(context, '/top-up');
                },
              ),
              HomeSevices(
                iconUrl: 'assets/ic_send.png',
                title: 'Send',
                onTap: () {
                  Navigator.pushNamed(context, '/tranfer-page');
                },
              ),
              HomeSevices(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeSevices(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const MoreDialog(),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buidTransion() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 14,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: BlocProvider(
              create: (context) => TransacsionBloc()
                ..add(
                  TransacsionGet(),
                ),
              child: BlocBuilder<TransacsionBloc, TransacsionState>(
                builder: (context, state) {
                  if (state is TransacsionSuccess) {
                    return Column(
                        children: state.transacsions.map((transacsion) {
                      return HomeTransions(transacsions: transacsion);
                    }).toList());
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => UserBloc()..add(UserGetRecent()),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: state.users.map((user) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TranferAmount(
                                    data: TransferFormModel(
                                      sendTo: user.username,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: HomeUser(user: user));
                      }).toList(),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildFrenly() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 14,
          ),
          // ignore: prefer_const_constructors
          BlocProvider(
            create: (context) => TipBloc()..add(TipGet()),
            child: BlocBuilder<TipBloc, TipState>(
              builder: (context, state) {
                if (state is TipSuccess) {
                  return Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: const [
                      HomeTips(
                        imgUrl: 'assets/img_tips1.png',
                        title: 'Best tips for using a credit card',
                        url: 'https://www.bogorloker.com/',
                      ),
                      HomeTips(
                        imgUrl: 'assets/img_tips2.png',
                        title: 'Spot the good pie of finance model',
                        url: 'https://www.bogorloker.com/',
                      ),
                      HomeTips(
                        imgUrl: 'assets/img_tips3.png',
                        title: 'Great hack to get better advices',
                        url: 'https://www.bogorloker.com/',
                      ),
                      HomeTips(
                        imgUrl: 'assets/img_tips4.png',
                        title: 'Save more penny buy this instead',
                        url: 'https://www.bogorloker.com/',
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        height: 326,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: lightBackgroundColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
            ),
            const SizedBox(
              height: 13,
            ),
            Wrap(
              runSpacing: 25,
              spacing: 25,
              children: [
                HomeSevices(
                  iconUrl: 'assets/ic_product_data.png',
                  title: 'Data',
                  onTap: () {
                    Navigator.pushNamed(context, '/data-provider');
                  },
                ),
                HomeSevices(
                  iconUrl: 'assets/ic_product_water.png',
                  title: 'Water',
                  onTap: () {},
                ),
                HomeSevices(
                  iconUrl: 'assets/ic_product_stream.png',
                  title: 'Stream',
                  onTap: () {},
                ),
                HomeSevices(
                  iconUrl: 'assets/ic_product_movie.png',
                  title: 'Movie',
                  onTap: () {},
                ),
                HomeSevices(
                  iconUrl: 'assets/ic_product_food.png',
                  title: 'Food',
                  onTap: () {},
                ),
                HomeSevices(
                  iconUrl: 'assets/ic_product_travel.png',
                  title: 'Travel',
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
