import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'temp_settings_state.dart';

class TempSettingsCubit extends Cubit<TempSettingsState> {
  TempSettingsCubit() : super(TempSettingsState.initial());

  void toggleTempUnit() {
    if (state.tempUnit == TempUnit.celsius) {
      emit(state.copyWith(tempUnit: TempUnit.fahrenheit));
    } else if (state.tempUnit == TempUnit.fahrenheit) {
      emit(state.copyWith(tempUnit: TempUnit.celsius));
    }
  }
}
