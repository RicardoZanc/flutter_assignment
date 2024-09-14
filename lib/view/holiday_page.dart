import 'package:appadsgp1/controller/holiday_controller.dart';
import 'package:appadsgp1/model/holiday_model.dart';
import 'package:appadsgp1/view/menu.dart';
import 'package:flutter/material.dart';

class HolidayPage extends StatefulWidget {
  const HolidayPage({super.key});

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {

  HolidayController controller = HolidayController();

  late Future<List<HolidayEntity>> _futureHolidays;

  Future<List<HolidayEntity>> getHolidays() async {
    return await controller.getHolidayList();
  }

  @override
  void initState() {
    super.initState();
    _futureHolidays = getHolidays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text("Lista de feriados"),
      ),
      body: FutureBuilder(
        future: _futureHolidays,
        builder: (context, AsyncSnapshot<List<HolidayEntity>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                      child: ListTile(
                        title:
                            Text(snapshot.data![index].name ?? 'Não informado'),
                          subtitle: Row(
                            children: [
                            Text(snapshot.data![index].date ?? 'Não informado'),
                            Text(snapshot.data![index].type ?? 'Não informado'),
                            ]
                          ),
                      )
                    );
                  }
                )
              );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      )
    );
  }
}