import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_flutter_finedust_app/constract/constract.dart';
import 'package:my_flutter_finedust_app/model/air_visual_data.dart';
import 'package:rxdart/rxdart.dart';

class AirBloc {
  final _airSubject = BehaviorSubject<AirVisualData>();

  AirBloc() {
    fetch();
  }

  static const baseUrl = 'http://api.airvisual.com/v2/nearest_city?key=';

  Future<AirVisualData> getAirVisualData() async {
    final response = await http.get(Uri.parse('$baseUrl$AIR_VISUAL_API_KEY'));
    if (response.statusCode == 200) {
      return AirVisualData.fromJson(jsonDecode(response.body));
    }
    throw Exception();
  }

  void fetch() async {
    var airResult = await getAirVisualData();
    _airSubject.add(airResult);
  }

  void refresh() {
    fetch();
  }

  Stream<AirVisualData> get getAirVisualResultData => _airSubject;
}
