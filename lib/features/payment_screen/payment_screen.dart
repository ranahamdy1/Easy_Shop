import 'package:easy_shop/features/payment_screen/paymop_api.dart';
import 'package:flutter/material.dart';

import 'frame_view.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null) {
              return FrameView(
                url: '${snapshot.data}',
                onPaymetCompleted: (url) {
                  print(url);
                  var m = getParamsFromUrl(url ?? '');
                  if (m['id'] != null && m['success'] == 'true'&& m['pending'] == 'false' && !isDone) {
                    isDone = true;
                    print(m['id']);
                  }
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

Map<String, String> getParamsFromUrl(String url) {
  Uri uri = Uri.parse(Uri.decodeFull(url));
  Map<String, String> params = uri.queryParametersAll.map((key, value) {
    return MapEntry(key, value.length == 1 ? value.first : value.join(','));
  });

  return params;
}
