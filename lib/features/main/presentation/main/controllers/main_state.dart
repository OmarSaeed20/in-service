import 'package:in_service/features/main/presentation/account/views/account_view.dart';
import 'package:in_service/features/main/presentation/home/views/home_view.dart';
import 'package:in_service/features/main/presentation/reservations/views/reservations_view.dart';
import 'package:in_service/features/main/presentation/search/views/search_view.dart';

import '/index.dart';

class MainState extends Equatable {
  const MainState({
    this.error = "",
    this.rx = RequestState.none,
    this.currentIndex = 0,
    this.currentScreen = const HomeView(),
    this.titl = const [
      Kstrings.call,
      Kstrings.reservations,
      Kstrings.search,
      Kstrings.myAccount,
    ],
    this.pages = const [
      HomeView(),
      ReservationsView(),
      SearchView(),
      AccountView(),
    ],
    this.icons1 = const [
      Kimage.home,
      Kimage.reservations,
      Kimage.search,
      Kimage.myAccount,
    ],
  });
  final String error;
  final RequestState rx;
  final int currentIndex;
  final Widget currentScreen;
  final List<String> titl, icons1;
  final List<Widget> pages;

  MainState copyWith({
    String? error,
    RequestState? rx,
    int? currentIndex,
    // Widget? currentScreen,
    // List<String>? titl,
    // List<Widget>? pages,
    // List<String>? icons1,
    // List<String>? icons2,
  }) =>
      MainState(
        error: error ?? this.error,
        rx: rx ?? this.rx,
        currentIndex: currentIndex ?? this.currentIndex,
        // currentScreen: currentScreen ?? this.currentScreen,
        // titl: titl ?? this.titl,
        // pages: pages ?? this.pages,
        // icons1: icons1 ?? this.icons1,
        // icons2: icons2 ?? this.icons2,
      );

  @override
  List<Object?> get props =>
      [error, rx, currentIndex, currentScreen, titl, pages, icons1];
}
