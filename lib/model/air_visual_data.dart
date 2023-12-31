class AirVisualData {
  String? _status;
  Data? _data;

  AirVisualData({String? status, Data? data}) {
    if (status != null) {
      _status = status;
    }
    if (data != null) {
      _data = data;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  AirVisualData.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = _status;
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    return data;
  }
}

class Data {
  String? _city;
  String? _state;
  String? _country;
  Location? _location;
  Current? _current;

  Data(
      {String? city,
      String? state,
      String? country,
      Location? location,
      Current? current}) {
    if (city != null) {
      _city = city;
    }
    if (state != null) {
      _state = state;
    }
    if (country != null) {
      _country = country;
    }
    if (location != null) {
      _location = location;
    }
    if (current != null) {
      _current = current;
    }
  }

  String? get city => _city;
  set city(String? city) => _city = city;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get country => _country;
  set country(String? country) => _country = country;
  Location? get location => _location;
  set location(Location? location) => _location = location;
  Current? get current => _current;
  set current(Current? current) => _current = current;

  Data.fromJson(Map<String, dynamic> json) {
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    _current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = _city;
    data['state'] = _state;
    data['country'] = _country;
    if (_location != null) {
      data['location'] = _location!.toJson();
    }
    if (_current != null) {
      data['current'] = _current!.toJson();
    }
    return data;
  }
}

class Location {
  String? _type;
  List<double>? _coordinates;

  Location({String? type, List<double>? coordinates}) {
    if (type != null) {
      _type = type;
    }
    if (coordinates != null) {
      _coordinates = coordinates;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  List<double>? get coordinates => _coordinates;
  set coordinates(List<double>? coordinates) => _coordinates = coordinates;

  Location.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['coordinates'] = _coordinates;
    return data;
  }
}

class Current {
  Pollution? _pollution;
  Weather? _weather;

  Current({Pollution? pollution, Weather? weather}) {
    if (pollution != null) {
      _pollution = pollution;
    }
    if (weather != null) {
      _weather = weather;
    }
  }

  Pollution? get pollution => _pollution;
  set pollution(Pollution? pollution) => _pollution = pollution;
  Weather? get weather => _weather;
  set weather(Weather? weather) => _weather = weather;

  Current.fromJson(Map<String, dynamic> json) {
    _pollution = json['pollution'] != null
        ? Pollution.fromJson(json['pollution'])
        : null;
    _weather =
        json['weather'] != null ? Weather.fromJson(json['weather']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_pollution != null) {
      data['pollution'] = _pollution!.toJson();
    }
    if (_weather != null) {
      data['weather'] = _weather!.toJson();
    }
    return data;
  }
}

class Pollution {
  String? _ts;
  int? _aqius;
  String? _mainus;
  int? _aqicn;
  String? _maincn;

  Pollution(
      {String? ts, int? aqius, String? mainus, int? aqicn, String? maincn}) {
    if (ts != null) {
      _ts = ts;
    }
    if (aqius != null) {
      _aqius = aqius;
    }
    if (mainus != null) {
      _mainus = mainus;
    }
    if (aqicn != null) {
      _aqicn = aqicn;
    }
    if (maincn != null) {
      _maincn = maincn;
    }
  }

  String? get ts => _ts;
  set ts(String? ts) => _ts = ts;
  int? get aqius => _aqius;
  set aqius(int? aqius) => _aqius = aqius;
  String? get mainus => _mainus;
  set mainus(String? mainus) => _mainus = mainus;
  int? get aqicn => _aqicn;
  set aqicn(int? aqicn) => _aqicn = aqicn;
  String? get maincn => _maincn;
  set maincn(String? maincn) => _maincn = maincn;

  Pollution.fromJson(Map<String, dynamic> json) {
    _ts = json['ts'];
    _aqius = json['aqius'];
    _mainus = json['mainus'];
    _aqicn = json['aqicn'];
    _maincn = json['maincn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ts'] = _ts;
    data['aqius'] = _aqius;
    data['mainus'] = _mainus;
    data['aqicn'] = _aqicn;
    data['maincn'] = _maincn;
    return data;
  }
}

class Weather {
  String? _ts;
  int? _tp;
  int? _pr;
  int? _hu;
  double? _ws;
  int? _wd;
  String? _ic;

  Weather(
      {String? ts,
      int? tp,
      int? pr,
      int? hu,
      double? ws,
      int? wd,
      String? ic}) {
    if (ts != null) {
      _ts = ts;
    }
    if (tp != null) {
      _tp = tp;
    }
    if (pr != null) {
      _pr = pr;
    }
    if (hu != null) {
      _hu = hu;
    }
    if (ws != null) {
      _ws = ws;
    }
    if (wd != null) {
      _wd = wd;
    }
    if (ic != null) {
      _ic = ic;
    }
  }

  String? get ts => _ts;
  set ts(String? ts) => _ts = ts;
  int? get tp => _tp;
  set tp(int? tp) => _tp = tp;
  int? get pr => _pr;
  set pr(int? pr) => _pr = pr;
  int? get hu => _hu;
  set hu(int? hu) => _hu = hu;
  double? get ws => _ws;
  set ws(double? ws) => _ws = ws;
  int? get wd => _wd;
  set wd(int? wd) => _wd = wd;
  String? get ic => _ic;
  set ic(String? ic) => _ic = ic;

  Weather.fromJson(Map<String, dynamic> json) {
    _ts = json['ts'];
    _tp = json['tp'];
    _pr = json['pr'];
    _hu = json['hu'];
    _ws = json['ws'];
    _wd = json['wd'];
    _ic = json['ic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ts'] = _ts;
    data['tp'] = _tp;
    data['pr'] = _pr;
    data['hu'] = _hu;
    data['ws'] = _ws;
    data['wd'] = _wd;
    data['ic'] = _ic;
    return data;
  }
}
