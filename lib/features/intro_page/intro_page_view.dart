import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'intro_page_cubit.dart';
import 'intro_page_state.dart';

class Intro_pagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Intro_pageCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Intro_pageCubit>(context);

    return Container();
  }
}


