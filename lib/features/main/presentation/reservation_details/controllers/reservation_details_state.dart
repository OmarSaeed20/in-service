import 'dart:io';

import '/index.dart';

class ReservationDetailsState extends Equatable {
  const ReservationDetailsState({
    this.rx = RequestState.none,
    this.selectedValue = 0,
    this.image,
    this.isImageEmpty = false,
  });

  final RequestState rx;
  final int selectedValue;
  final Rx<File?>? image;
  final bool isImageEmpty;

  ReservationDetailsState copyWith({
    RequestState? rx,
    int? selectedValue,
    Rx<File?>? image,
    bool? isImageEmpty,
  }) =>
      ReservationDetailsState(
        selectedValue: selectedValue ?? this.selectedValue,
        rx: rx ?? this.rx,
        image: image ?? this.image,
        isImageEmpty: isImageEmpty ?? this.isImageEmpty,
      );

  @override
  List<Object?> get props => [selectedValue, rx, image, isImageEmpty];
}
