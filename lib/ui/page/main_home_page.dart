import 'package:flutter/material.dart';
import 'package:my_flutter_finedust_app/data/http.dart';
import 'package:my_flutter_finedust_app/logger/logger.dart';
import 'package:my_flutter_finedust_app/model/air_visual_data.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  AirVisualData _airVisualData = AirVisualData();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getAirData();
  }

  void getAirData() async {
    _isLoading = true;
    logger.info('qwerasdf $_isLoading');
    _airVisualData = await HttpConnection().getAirVisualData();
    setState(() {});
    _isLoading = false;
    logger.info('qwerasdf $_isLoading');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Finedust App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    '현재 위치 미세먼지',
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _getColor(_airVisualData
                                    .data?.current?.pollution?.aqius),
                                borderRadius: BorderRadius.circular(
                                  16.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.face,
                                  ),
                                  Text(
                                    '${_airVisualData.data?.current?.pollution?.aqius}',
                                    style: const TextStyle(
                                      fontSize: 32.0,
                                    ),
                                  ),
                                  Text(
                                    _getTextResult(_airVisualData
                                        .data?.current?.pollution?.aqius),
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.face,
                                  ),
                                  const SizedBox(
                                    width: 16.0,
                                  ),
                                  Text(
                                      '${_airVisualData.data?.current?.weather?.tp} ℃'),
                                ],
                              ),
                              Text(
                                  '습도 ${_airVisualData.data?.current?.weather?.hu} %'),
                              Text(
                                  '풍속 ${_airVisualData.data?.current?.weather?.ws} m/s'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[300],
                    ),
                    onPressed: () {
                      setState(() {
                        getAirData();
                      });
                      logger.info('qwerasdf press button');
                    },
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

String _getTextResult(int? aqius) {
  if (aqius != null) {
    if (aqius > 0 && aqius <= 100) {
      return 'Good';
    } else if (aqius > 100 && aqius <= 200) {
      return 'Normal';
    } else if (aqius > 200 && aqius <= 300) {
      return 'Bad';
    } else if (aqius > 300) {
      return 'Worst';
    }
  }
  return 'none';
}

Color _getColor(int? aqius) {
  if (aqius != null) {
    if (aqius > 0 && aqius <= 100) {
      return Colors.yellow;
    } else if (aqius > 100 && aqius <= 200) {
      return Colors.orange;
    } else if (aqius > 200 && aqius <= 300) {
      return Colors.red;
    } else if (aqius > 300) {
      return Colors.black;
    }
  }
  return Colors.grey;
}
