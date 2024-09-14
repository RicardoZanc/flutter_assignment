import 'package:appadsgp1/model/holiday_model.dart';
import 'package:appadsgp1/model/holiday_repository.dart';

class HolidayController {
  HolidayRepository repository = HolidayRepository();

  Future<List<HolidayEntity>> getHolidayList() async {
    List<HolidayEntity> list  = await repository.getAll();
    return list;
  }

  String dateTimeFormatToStringPtBR(String dateInput){
    String year = dateInput.substring(0,4);
    String month = dateInput.substring(5,7);
    String day = dateInput.substring(8,10);
    return "$day/$month/$year";
  }
}