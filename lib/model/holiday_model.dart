class HolidayEntity {
  String? date;
  String? name;
  String? type;

  HolidayEntity({
    this.date,
    this.name,
    this.type
  });

   static HolidayEntity fromJson(Map<String, dynamic> map) {
    return HolidayEntity(
      date: map['date'], 
      name: map['name'], 
      type: map['type']);
 } 
}