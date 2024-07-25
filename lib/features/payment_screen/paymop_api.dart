import 'package:dio/dio.dart';

Future getData() async {
  Dio dio = Dio();

  var response = await dio.post(
      'https://0236-197-43-246-177.ngrok-free.app/api/paymob-mobile-wallet/frame',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 2|4lWzc4iOqsAUUYWrkxGZzft4IndYHKW7XOcICxltde37881c',
        },
      ),
      data: {
        "phone_number": "01010101010",
        "items": [
          {
            "name": "Smart Watch",
            "price": "2900",
            "description": "Smart Watch Description",
            "quantity": "1"
          },
          {
            "name": "Power Bank",
            "price": "2200",
            "description": "Power Bank Description",
            "quantity": "2"
          }
        ]
      });
  print(response.data);
  return response.data;
}
