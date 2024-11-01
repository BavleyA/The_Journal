import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thejournal/shared/cubit/cubit.dart';
import 'package:thejournal/shared/cubit/states.dart';

class NewSLayout extends StatelessWidget {
  const NewSLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context , state) {},
        builder: (context , state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
              ),
              actions: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.search,
                    ),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
