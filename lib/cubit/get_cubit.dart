import 'package:cosmetics/cubit/state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCubit extends Cubit<WeatherState> {
  GetCubit():super(WeatherState());
}