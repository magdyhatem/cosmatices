// import 'package:dio/dio.dart';
//
//
//
// import 'package:cosmetics/api1.dart';
// import 'package:dio/dio.dart';
//
// class WeatherService{
//    final Dio dio;
//    final String baseurl = 'api.weatherapi.com/v1';
//   WeatherService(this.dio);
//
//   Future<WeatherModel> getCurrentindex({required String CityName})async{
//     Response response = await dio.get('https://$baseurl/forecast.json?key=5e6ed2285b65436a9f813120231408&q=$CityName&days=1');
//     WeatherModel weatherModel = WeatherModel.fromejson(response.data);
//     return weatherModel;
//   }
//    Future<WeatherModel?> getForecast({required String CityName})async{
//      try{
//        Response response = await dio.get('https://$baseurl/v1/forecast.json?key=5e6ed2285b65436a9f813120231408&q=$CityName&days=1');
//        WeatherModel weatherModel = WeatherModel.fromejson(response.data);
//        return weatherModel;
//      }catch(ex){
//        return null;
//      }
//    }
// }
