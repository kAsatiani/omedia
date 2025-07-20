import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omedia/src/bloc/obligations_bloc.dart';
import 'package:ui_kit/shared/shared.dart';
import 'package:ui_kit/ui_kit.dart';

import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ObligationsBloc>().add(const LoadBothObligations());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocSelector<ObligationsBloc, ObligationsState, ObligationsStatus>(
        selector: (state) {
          return state.status;
        },
        builder: (context, state) {
          switch (state) {
            case ObligationsStatus.initial:
            case ObligationsStatus.loading:
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );

            case ObligationsStatus.success:
              return CustomScrollView(
                slivers: [
                  MyObligations(),
                  20.sliverHeight,
                  TotalBalance(),
                  20.sliverHeight,
                  UpcommingPayments(),
                ],
              );

            case ObligationsStatus.error:
              return const Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
