// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'temp_settings_cubit.dart';

enum TempUnit {
  celsius,
  fahrenheit,
}

class TempSettingsState extends Equatable {
  final TempUnit tempUnit;
  TempSettingsState({
    required this.tempUnit,
  });

  @override
  List<Object> get props => [tempUnit];

  factory TempSettingsState.initial() {
    return TempSettingsState(tempUnit: TempUnit.celsius);
  }

  TempSettingsState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingsState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }

  @override
  String toString() => 'TempSettingsState(tempUnit: $tempUnit)';
}
