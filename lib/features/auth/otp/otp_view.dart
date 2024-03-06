import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'otp_cubit.dart';
import 'otp_state.dart';

class OtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OtpCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<OtpCubit>(context);

    return Container();
  }
}


