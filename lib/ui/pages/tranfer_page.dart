// ignore: file_names
import 'package:app_ecom_buidlagga/blocs/auth/auth_bloc.dart';
import 'package:app_ecom_buidlagga/blocs/user/user_bloc.dart';
import 'package:app_ecom_buidlagga/models/tranfer_from_model.dart';
import 'package:app_ecom_buidlagga/models/user_model.dart';
import 'package:app_ecom_buidlagga/shared/theme.dart';
import 'package:app_ecom_buidlagga/ui/pages/tranfer_amout_page.dart';
import 'package:app_ecom_buidlagga/ui/widgets/tranfer_recent_users.dart';
import 'package:app_ecom_buidlagga/ui/widgets/tranfer_result_user.dart.dart';
import 'package:flutter/material.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranferPage extends StatefulWidget {
  const TranferPage({super.key});

  @override
  State<TranferPage> createState() => _TranferPageState();
}

class _TranferPageState extends State<TranferPage> {
  final usernameController = TextEditingController(text: '');
  UserModel? seletedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();

    userBloc = context.read<UserBloc>()..add(UserGetRecent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tranfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 40,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
            controller: usernameController,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(
                  UserGetByUsername(usernameController.text),
                );
              } else {
                seletedUser = null;
                userBloc.add(UserGetRecent());
              }
              setState(() {});
            },
          ),
          usernameController.text.isEmpty ? buildRecenUsers() : buildResuitl(),

          const SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: seletedUser != null
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TranferAmount(
                        data: TransferFormModel(
                          sendTo: seletedUser!.username,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildRecenUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Users",
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 14,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Column(
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
                        child: TranferRecentUsers(users: user));
                  }).toList(),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget buildResuitl() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Wrap(
                    spacing: 17,
                    runSpacing: 10,
                    children: state.users.map((user) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            seletedUser = user;
                          });
                        },
                        child: ResultUsers(
                          user: user,
                          isSelected: user.id == seletedUser?.id,
                        ),
                      );
                    }).toList());
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
