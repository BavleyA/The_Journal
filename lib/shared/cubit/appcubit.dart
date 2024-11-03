import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thejournal/shared/network/local/cache_helper.dart';
import 'appcubitstates.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void ChangeAppMode()
  {
      isDark = !isDark;
      emit(AppChangeModeState());

  }

}