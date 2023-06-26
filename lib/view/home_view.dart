import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/pages/widgets/rich_text_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const String playerX = "X";
  static const String playerO = "O";
  var random = Random();

  bool? endGame;

  String? currentPlayer;

  List<String>? item;

  @override
  void initState() {
    initGame();
    wineer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const RichTextWidget(),
              builderCurrent(context),
              if (endGame == true) builderWinner(context),
              builderGrid(),
              builderButton(),
            ],
          ),
        ),
      ),
    );
  }

  void initGame() {
    endGame = false;
    currentPlayer = playerX;
    item = ["", "", "", "", "", "", "", "", ""];
  }

  void onTaps(index) {
    if (endGame == false && item![index].isEmpty) {
      if (currentPlayer == playerX) {
        item![index] = currentPlayer!;
        currentPlayer = playerO;
        wineer();
      } else {
        item![index] = currentPlayer!;
        currentPlayer = playerX;
        wineer();
      }
    }
    draw();
  }

  void draw() {
    if (endGame!) {
      return;
    } else {
      bool draw = true;
      for (var element in item!) {
        if (element.isEmpty) {
          draw = false;
        }
      }

      if (draw) {
        currentPlayer = 'Darw';
        builderMessage(context, !draw);
      }
    }
  }

  void wineer() {
    List<List<int>> winers = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [2, 4, 6],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
    ];

    for (var element in winers) {
      var firstItem = item![element[0]];
      var seaItem = item![element[1]];
      var threeItem = item![element[2]];
      if (firstItem.isNotEmpty &&
          firstItem == seaItem &&
          seaItem == threeItem) {
        currentPlayer = threeItem;
        endGame = true;
      }
    }

    if (endGame!) {
      builderMessage(context, endGame!);
    }
  }

  Widget builderGrid() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              onTaps(index);
            });
          },
          child: Container(
            color: item![index].isNotEmpty && item![index] == playerX
                ? Colors.blue
                : item![index].isNotEmpty && item![index] == playerO
                    ? Colors.yellow
                    : Colors.grey,
            child: Center(
                child: Text(
              item![index],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        );
      },
    );
  }

  Widget builderCurrent(context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10.0),
      child: Text(
        "$currentPlayer Turn",
        style: const TextStyle(
            color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }

  Widget builderWinner(context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10.0),
      child: Text(
        "$currentPlayer winner",
        style: const TextStyle(
            color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }

  Widget builderButton() {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 20.0),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: MaterialButton(
          // color: Colors.blue,
          onPressed: () {
            setState(() {
              initGame();
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.refresh),
              Text('refresh'),
            ],
          ),
        ),
      ),
    );
  }

  void builderMessage(context, bool isBool) {
    if (isBool) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "$currentPlayer Winner Game",
            style: const TextStyle(color: Colors.white, fontSize: 25.0),
          ),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "$currentPlayer Game",
            style: const TextStyle(color: Colors.white, fontSize: 25.0),
          ),
          backgroundColor: Colors.brown,
        ),
      );
    }
  }
}
