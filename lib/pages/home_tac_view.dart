import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/pages/widgets/button_refresh_widegts.dart';
import 'package:tictactoe/pages/widgets/gridview_builder_pages.dart';
import 'package:tictactoe/pages/widgets/rich_text_widget.dart';
import 'package:tictactoe/pages/widgets/snack_bar.dart';
import '../controller/cubit/cubit_cubit.dart';
import '../controller/cubit/cubit_state.dart';

class HomeTacView extends StatelessWidget {
  const HomeTacView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeSuccessWinnerState) {
          snackBarItem(context, state.winnerString, Colors.green);
        }
        if (state is HomeSuccessDrawState) {
          snackBarItem(context, state.drawString, Colors.brown);
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RichTextWidget(),
                builderTurn(cubit),
                GridViewWidget(cubit: cubit),
                const SizedBox(
                  height: 20,
                ),
                ButtonRefresh(cubit: cubit),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget builderTurn(HomeCubit cubit) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10.0),
      child: Text(
        cubit.draw ? 'draw Turn' : '${cubit.currentPlayer} Turn',
        style: const TextStyle(color: Colors.white, fontSize: 25.0),
      ),
    );
  }
}
