import 'package:e47en/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

double felos = 0.0;
double rased = 0.0;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());

  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  TextEditingController felosController = TextEditingController();
  TextEditingController rasedController = TextEditingController();

  void calculateRased(String felosy) {
    if (felosController.text.isEmpty) {
      rasedController.clear();
    }
    rased = double.parse(felosy) * 0.7;
    rasedController.text = rased.toStringAsFixed(2);
    emit(RasedChangedState());
  }

  void calculateFelos(String rasedy) {
    if (rasedController.text.isEmpty) {
      felosController.clear();
    }
    felos = double.parse(rasedy) * (10 / 7);
    felosController.text = felos.toStringAsFixed(2);
    emit(FelosChangedState());
  }
}
