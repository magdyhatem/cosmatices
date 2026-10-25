// import 'package:cosmetics/core/api2.dart';
//
// void main() async {
//   await DioHelper.sendData('/api/Auth/logout');
// }
//   void Login() async {
//     await DioHelper.sendData(
//       '/api/Auth/login',
//       data: {
//         "countryCode": "+20",
//         "phoneNumber": "1234567890",
//         "password": "Password123!",
//       },
//     );
//   }
//
//   void Register() async {
//     await DioHelper.sendData(
//       '/api/Auth/register',
//       data: {
//         "username": "testuser",
//         "countryCode": "+20",
//         "phoneNumber": "1234567890",
//         "email": "test@example.com",
//         "password": "Password123!",
//       },
//     );
//   }
//
//   void VerifyOtp() async {
//     await DioHelper.sendData(
//       '/api/Auth/verify-otp',
//       data: {
//         "countryCode": "+20",
//         "phoneNumber": "1234567890",
//         "otpCode": "1111",
//       },
//     );
//   }
//
//
// class WeatherModel {
//   final String cityName;
//   final String date;
//   final String? image;
//   final num? temp;
//   final num? maxTemp;
//   final num? minTemp;
//   final String? weatherCondition;
//
//   WeatherModel({
//     required this.cityName,
//     required this.date,
//     this.image,
//     this.temp,
//     this.maxTemp,
//     this.minTemp,
//     this.weatherCondition,
//   });
//
//
//   factory WeatherModel.fromejson(json){
//     return WeatherModel(
//         image:json ['forecast']['forecastday'][0]['day']['condition'],
//         cityName:json ['location']['name'],
//         date:json['current']['last_updated'],
//     );
//   }
// }
//
//
//
//










