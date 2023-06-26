
abstract class HomeState {

}

class HomeInitialState extends HomeState {

}

class HomeSuccessState extends HomeState {

}

class HomeSuccessWinnerState extends HomeState {
  String winnerString;
  HomeSuccessWinnerState({required this.winnerString});
}

class HomeSuccessDrawState extends HomeState {
String drawString;
HomeSuccessDrawState({required this.drawString});
}
class InitialGameState extends HomeState {

}

class ChangeColorState extends HomeState {

}



