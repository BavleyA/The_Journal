import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thejournal/modules/buisness/business_screen.dart';
import 'package:thejournal/modules/science/science_screen.dart';
import 'package:thejournal/modules/settings/settings_screen.dart';
import 'package:thejournal/modules/sports/sports_screen.dart';
import 'package:thejournal/shared/cubit/states.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),

  ];


  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar (int index){
    currentIndex = index;
    if(index == 1){
      getSports();
    }
    if(index == 2){
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business =[];

  void getBusiness(){
    emit(NewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'us',
        'category':'business',
        'apiKey':'3b40aa901cce462595a85ff003e978d9',
      },
    ).then((value) {

      print(value.data.toString());
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports =[];

  void getSports(){
    emit(NewsGetSportsLoadingState());
    if(sports.length == 0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'sports',
          'apiKey':'3b40aa901cce462595a85ff003e978d9',
        },
      ).then((value) {

        print(value.data.toString());
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());

      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }
    else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science =[];

  void getScience(){
    emit(NewsGetScienceLoadingState());

    if(science.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'3b40aa901cce462595a85ff003e978d9',
        },
      ).then((value) {

        print(value.data.toString());
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());

      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }
    else{
      emit(NewsGetScienceSuccessState());
    }

  }

  bool isDark = false;

  void changeAppMode(){

    isDark = !isDark;

    emit(NewsChangeModeState());
  }


}
