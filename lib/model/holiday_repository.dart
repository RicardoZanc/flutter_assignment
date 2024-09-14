import 'dart:convert';

import 'package:appadsgp1/model/holiday_model.dart';
import 'package:http/http.dart' as http;

class HolidayRepository {

  String getCurrentYear(){
    DateTime now = DateTime.now();
    DateTime nowYear = DateTime(now.year);
    String year = nowYear.toString();
    return year;

  }



  Future<List<HolidayEntity>> getAll() async {

    DateTime now = DateTime.now();
    
    String year = (now.year).toString();
    Uri url = Uri.parse('https://brasilapi.com.br/api/feriados/v1/$year');

    List<HolidayEntity> holidayList = [];

    final response = await http.get(url);
    if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        for (var holiday in json) {
            holidayList.add(HolidayEntity.fromJson(holiday));
        }
    }
    return holidayList;
  }
}