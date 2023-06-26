import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/controller/cubit/cubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  bool enGame = false;
  bool draw = false;
  Color color = Colors.grey;

  static const String playerX = "X";
  static const String playerO = "O";
  String currentPlayer = playerX;
  List<String>? item = ['', '', '', '', '', '', '', '', ''];

  void onTaps(index) {
    if (item![index].isEmpty && !enGame) {
      if (currentPlayer == playerX) {
        item![index] = currentPlayer;
        currentPlayer = playerO;
        emit(HomeSuccessState());
        winner();
      } else {
        item![index] = currentPlayer;
        currentPlayer = playerX;
        emit(HomeSuccessState());
        winner();
      }
    }
    draws();
  }

  void winner() {
    List<List<int>> itemIndex = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [2, 4, 6],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
    ];

    for (var element in itemIndex) {
      String firstItem = item![element[0]];
      String secondItem = item![element[1]];
      String threeItem = item![element[2]];

      if (firstItem.isNotEmpty) {
        if (firstItem == secondItem && secondItem == threeItem) {
          enGame = true;
          currentPlayer = threeItem;
        }
      }
    }
    if (enGame) {
      emit(HomeSuccessWinnerState(winnerString: "Winer $currentPlayer"));
    }
  }

  void draws() {
    if (enGame) {
      return;
    } else {
      draw = true;
      for (var element in item!) {
        if (element.isEmpty) {
          draw = false;
        }
      }
      if (draw) {
        emit(HomeSuccessDrawState(drawString: "Draw"));
      }
    }
  }

  void initialGame() {
    enGame = false;
    draw = false;
    color = Colors.grey;
    currentPlayer = playerX;
    item = ['', '', '', '', '', '', '', '', ''];
    emit(InitialGameState());
  }
}
