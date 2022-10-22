import 'package:app_ecom_buidlagga/blocs/data_plan/data_plan_bloc.dart';
import 'package:app_ecom_buidlagga/models/data_palan_model.dart';
import 'package:app_ecom_buidlagga/models/data_plan_from_model.dart';
import 'package:app_ecom_buidlagga/models/oprator_card_model.dart';
import 'package:app_ecom_buidlagga/ui/widgets/data_paket.dart';
import 'package:flutter/material.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../shared/shared_methods.dart';
import '../../shared/theme.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataProviderPage extends StatefulWidget {
  final OpratorCardModel operatorCard;
  const DataProviderPage({super.key, required this.operatorCard});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is DataPlanSuccess) {
            context.read<AuthBloc>().add(
                  AuthUpdateBelance(
                    selectedDataPlan!.price! * -1,
                  ),
                );

            Navigator.pushNamedAndRemoveUntil(
                context, '/data-sukses', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            // ignore: prefer_const_constructors
            return Scaffold(
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Paket Data',
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Phone Number',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomFormField(
                  title: '+628',
                  isShowTitle: false,
                  controller: phoneController,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Selected Paket',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                Wrap(
                    spacing: 17,
                    runSpacing: 17,
                    children: widget.operatorCard.dataPlans!.map((dataPlan) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDataPlan = dataPlan;
                          });
                        },
                        child: DataPaket(
                          dataPlan: dataPlan,
                          isSelected: dataPlan.id == selectedDataPlan?.id,
                        ),
                      );
                    }).toList()),

                const SizedBox(
                  height: 50,
                ),
              ],
            ),
            floatingActionButton: (selectedDataPlan != null &&
                    phoneController.text.isNotEmpty)
                ? Container(
                    margin: const EdgeInsets.all(25),
                    child: CustomFilledButton(
                      title: 'Continue',
                      onPressed: () async {
                        if (await Navigator.pushNamed(context, '/pin-page') ==
                            true) {
                          final authState = context.read<AuthBloc>().state;

                          String pin = '';
                          if (authState is AuthSucces) {
                            pin = authState.user.pin!;
                          }

                          context.read<DataPlanBloc>().add(
                                DataPlanPost(DataPlanFormModel(
                                  dataPlasnId: selectedDataPlan!.id,
                                  phoneNumber: phoneController.text,
                                  pin: pin,
                                )),
                              );
                          // ignore: use_build_context_synchronously
                        }
                      },
                    ),
                  )
                : Container(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
