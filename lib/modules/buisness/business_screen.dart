import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thejournal/shared/components/components.dart';
import 'package:thejournal/shared/cubit/cubit.dart';
import 'package:thejournal/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context,state) {

        var list = NewsCubit.get(context).business;

        return articleBuilder(list,context);
      },
    );
  }
}
