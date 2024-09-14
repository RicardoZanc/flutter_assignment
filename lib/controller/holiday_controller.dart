import 'package:appadsgp1/model/holiday_model.dart';
import 'package:appadsgp1/model/holiday_repository.dart';
import 'package:intl/intl.dart';

class HolidayController {
  HolidayRepository repository = HolidayRepository();

  Future<List<HolidayEntity>> getHolidayList() async {
    List<HolidayEntity> list  = await repository.getAll();
    for (HolidayEntity holiday in list) {
      DateTime dateToFormat = fromISOStringToDateTime(holiday.date ?? "0000-00-00");
      String formatedDate = dateTimeFormatToStringPtBR(dateToFormat);
      holiday.date = formatedDate;
    } 
    return list;
  }

  String dateTimeFormatToStringPtBR(DateTime dateInput) {
    DateFormat outputFormat = DateFormat('dd/MM/yyyy');
    return (outputFormat.format(dateInput)).toString();
  }

  fromISOStringToDateTime(String dateInput) {
    // 05/11/2024
    // 2024-11-05 0,4 5,7 8,10 
    // String day = dateSelected.substring(0,2);
    // String month = dateSelected.substring(3,5);
    // String year = dateSelected.substring(6,10);
    int year = int.parse(dateInput.substring(0,4));
    int month = int.parse(dateInput.substring(5,7));
    int day = int.parse(dateInput.substring(8,7));
   DateTime dateTime = DateTime(year, month, day);
    return dateTime;
  }

}