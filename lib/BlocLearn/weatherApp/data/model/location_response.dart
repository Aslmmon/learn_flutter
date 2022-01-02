/// consolidated_weather : [{"id":6690452808925184,"weather_state_name":"Heavy Rain","weather_state_abbr":"hr","wind_direction_compass":"SW","created":"2022-01-02T12:59:01.759392Z","applicable_date":"2022-01-02","min_temp":9.325,"max_temp":13,"the_temp":12.135,"wind_speed":9.383270961369602,"wind_direction":231.33648456423006,"air_pressure":1011.5,"humidity":80,"visibility":9.674128091943052,"predictability":77},{"id":5293960525250560,"weather_state_name":"Showers","weather_state_abbr":"s","wind_direction_compass":"WSW","created":"2022-01-02T12:59:01.557657Z","applicable_date":"2022-01-03","min_temp":8.350000000000001,"max_temp":10.635,"the_temp":10.31,"wind_speed":8.960022086754686,"wind_direction":237.6920527101961,"air_pressure":1010.5,"humidity":77,"visibility":12.110835222301757,"predictability":73},{"id":5650689872101376,"weather_state_name":"Heavy Rain","weather_state_abbr":"hr","wind_direction_compass":"NNW","created":"2022-01-02T12:59:01.666216Z","applicable_date":"2022-01-04","min_temp":2.535,"max_temp":8.58,"the_temp":5.35,"wind_speed":7.7083034735995115,"wind_direction":348.3592886897377,"air_pressure":1002.5,"humidity":81,"visibility":11.557504175614412,"predictability":77},{"id":5497070375927808,"weather_state_name":"Light Cloud","weather_state_abbr":"lc","wind_direction_compass":"W","created":"2022-01-02T12:59:01.880096Z","applicable_date":"2022-01-05","min_temp":1.145,"max_temp":5.275,"the_temp":5.935,"wind_speed":7.339340663710597,"wind_direction":276.33455141203405,"air_pressure":1013.5,"humidity":70,"visibility":14.95857939632546,"predictability":70},{"id":5440157588127744,"weather_state_name":"Heavy Rain","weather_state_abbr":"hr","wind_direction_compass":"SSW","created":"2022-01-02T12:59:01.858691Z","applicable_date":"2022-01-06","min_temp":0.375,"max_temp":7.545,"the_temp":7.215,"wind_speed":9.369994302250856,"wind_direction":202.83331687887446,"air_pressure":1012.5,"humidity":79,"visibility":7.724265290702299,"predictability":77},{"id":5321896334721024,"weather_state_name":"Showers","weather_state_abbr":"s","wind_direction_compass":"W","created":"2022-01-02T12:59:04.288202Z","applicable_date":"2022-01-07","min_temp":2.3,"max_temp":6.12,"the_temp":5.34,"wind_speed":6.815617593255388,"wind_direction":264.5,"air_pressure":1011,"humidity":70,"visibility":9.999726596675416,"predictability":73}]
/// time : "2022-01-02T15:11:15.089434Z"
/// sun_rise : "2022-01-02T08:06:01.603041Z"
/// sun_set : "2022-01-02T16:03:15.328071Z"
/// timezone_name : "LMT"
/// parent : {"title":"England","location_type":"Region / State / Province","woeid":24554868,"latt_long":"52.883560,-1.974060"}
/// sources : [{"title":"BBC","slug":"bbc","url":"http://www.bbc.co.uk/weather/","crawl_rate":360},{"title":"Forecast.io","slug":"forecast-io","url":"http://forecast.io/","crawl_rate":480},{"title":"HAMweather","slug":"hamweather","url":"http://www.hamweather.com/","crawl_rate":360},{"title":"Met Office","slug":"met-office","url":"http://www.metoffice.gov.uk/","crawl_rate":180},{"title":"OpenWeatherMap","slug":"openweathermap","url":"http://openweathermap.org/","crawl_rate":360},{"title":"Weather Underground","slug":"wunderground","url":"https://www.wunderground.com/?apiref=fc30dc3cd224e19b","crawl_rate":720},{"title":"World Weather Online","slug":"world-weather-online","url":"http://www.worldweatheronline.com/","crawl_rate":360}]
/// title : "London"
/// location_type : "City"
/// woeid : 44418
/// latt_long : "51.506321,-0.12714"
/// timezone : "Europe/London"


class LocationResponse {
  LocationResponse({
      List<Consolidated_weather>? consolidatedWeather, 
      String? time, 
      String? sunRise, 
      String? sunSet, 
      String? timezoneName, 
      Parent? parent, 
      List<Sources>? sources, 
      String? title, 
      String? locationType, 
      int? woeid, 
      String? lattLong, 
      String? timezone,}){
    _consolidatedWeather = consolidatedWeather;
    _time = time;
    _sunRise = sunRise;
    _sunSet = sunSet;
    _timezoneName = timezoneName;
    _parent = parent;
    _sources = sources;
    _title = title;
    _locationType = locationType;
    _woeid = woeid;
    _lattLong = lattLong;
    _timezone = timezone;
}

  LocationResponse.fromJson(dynamic json) {
    if (json['consolidated_weather'] != null) {
      _consolidatedWeather = [];
      json['consolidated_weather'].forEach((v) {
        _consolidatedWeather?.add(Consolidated_weather.fromJson(v));
      });
    }
    _time = json['time'];
    _sunRise = json['sun_rise'];
    _sunSet = json['sun_set'];
    _timezoneName = json['timezone_name'];
    _parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    if (json['sources'] != null) {
      _sources = [];
      json['sources'].forEach((v) {
        _sources?.add(Sources.fromJson(v));
      });
    }
    _title = json['title'];
    _locationType = json['location_type'];
    _woeid = json['woeid'];
    _lattLong = json['latt_long'];
    _timezone = json['timezone'];
  }
  List<Consolidated_weather>? _consolidatedWeather;
  String? _time;
  String? _sunRise;
  String? _sunSet;
  String? _timezoneName;
  Parent? _parent;
  List<Sources>? _sources;
  String? _title;
  String? _locationType;
  int? _woeid;
  String? _lattLong;
  String? _timezone;

  List<Consolidated_weather>? get consolidatedWeather => _consolidatedWeather;
  String? get time => _time;
  String? get sunRise => _sunRise;
  String? get sunSet => _sunSet;
  String? get timezoneName => _timezoneName;
  Parent? get parent => _parent;
  List<Sources>? get sources => _sources;
  String? get title => _title;
  String? get locationType => _locationType;
  int? get woeid => _woeid;
  String? get lattLong => _lattLong;
  String? get timezone => _timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_consolidatedWeather != null) {
      map['consolidated_weather'] = _consolidatedWeather?.map((v) => v.toJson()).toList();
    }
    map['time'] = _time;
    map['sun_rise'] = _sunRise;
    map['sun_set'] = _sunSet;
    map['timezone_name'] = _timezoneName;
    if (_parent != null) {
      map['parent'] = _parent?.toJson();
    }
    if (_sources != null) {
      map['sources'] = _sources?.map((v) => v.toJson()).toList();
    }
    map['title'] = _title;
    map['location_type'] = _locationType;
    map['woeid'] = _woeid;
    map['latt_long'] = _lattLong;
    map['timezone'] = _timezone;
    return map;
  }

}

/// title : "BBC"
/// slug : "bbc"
/// url : "http://www.bbc.co.uk/weather/"
/// crawl_rate : 360

class Sources {
  Sources({
      String? title, 
      String? slug, 
      String? url, 
      int? crawlRate,}){
    _title = title;
    _slug = slug;
    _url = url;
    _crawlRate = crawlRate;
}

  Sources.fromJson(dynamic json) {
    _title = json['title'];
    _slug = json['slug'];
    _url = json['url'];
    _crawlRate = json['crawl_rate'];
  }
  String? _title;
  String? _slug;
  String? _url;
  int? _crawlRate;

  String? get title => _title;
  String? get slug => _slug;
  String? get url => _url;
  int? get crawlRate => _crawlRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['slug'] = _slug;
    map['url'] = _url;
    map['crawl_rate'] = _crawlRate;
    return map;
  }

}

/// title : "England"
/// location_type : "Region / State / Province"
/// woeid : 24554868
/// latt_long : "52.883560,-1.974060"

class Parent {
  Parent({
      String? title, 
      String? locationType, 
      int? woeid, 
      String? lattLong,}){
    _title = title;
    _locationType = locationType;
    _woeid = woeid;
    _lattLong = lattLong;
}

  Parent.fromJson(dynamic json) {
    _title = json['title'];
    _locationType = json['location_type'];
    _woeid = json['woeid'];
    _lattLong = json['latt_long'];
  }
  String? _title;
  String? _locationType;
  int? _woeid;
  String? _lattLong;

  String? get title => _title;
  String? get locationType => _locationType;
  int? get woeid => _woeid;
  String? get lattLong => _lattLong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['location_type'] = _locationType;
    map['woeid'] = _woeid;
    map['latt_long'] = _lattLong;
    return map;
  }

}

/// id : 6690452808925184
/// weather_state_name : "Heavy Rain"
/// weather_state_abbr : "hr"
/// wind_direction_compass : "SW"
/// created : "2022-01-02T12:59:01.759392Z"
/// applicable_date : "2022-01-02"
/// min_temp : 9.325
/// max_temp : 13
/// the_temp : 12.135
/// wind_speed : 9.383270961369602
/// wind_direction : 231.33648456423006
/// air_pressure : 1011.5
/// humidity : 80
/// visibility : 9.674128091943052
/// predictability : 77

class Consolidated_weather {
  Consolidated_weather({
      int? id, 
      String? weatherStateName, 
      String? weatherStateAbbr, 
      String? windDirectionCompass, 
      String? created, 
      String? applicableDate, 
      double? minTemp, 
      int? maxTemp, 
      double? theTemp, 
      double? windSpeed, 
      double? windDirection, 
      double? airPressure, 
      int? humidity, 
      double? visibility, 
      int? predictability,}){
    _id = id;
    _weatherStateName = weatherStateName;
    _weatherStateAbbr = weatherStateAbbr;
    _windDirectionCompass = windDirectionCompass;
    _created = created;
    _applicableDate = applicableDate;
    _minTemp = minTemp;
    _maxTemp = maxTemp;
    _theTemp = theTemp;
    _windSpeed = windSpeed;
    _windDirection = windDirection;
    _airPressure = airPressure;
    _humidity = humidity;
    _visibility = visibility;
    _predictability = predictability;
}

  Consolidated_weather.fromJson(dynamic json) {
    _id = json['id'];
    _weatherStateName = json['weather_state_name'];
    _weatherStateAbbr = json['weather_state_abbr'];
    _windDirectionCompass = json['wind_direction_compass'];
    _created = json['created'];
    _applicableDate = json['applicable_date'];
    _minTemp = json['min_temp'];
    _maxTemp = json['max_temp'];
    _theTemp = json['the_temp'];
    _windSpeed = json['wind_speed'];
    _windDirection = json['wind_direction'];
    _airPressure = json['air_pressure'];
    _humidity = json['humidity'];
    _visibility = json['visibility'];
    _predictability = json['predictability'];
  }
  int? _id;
  String? _weatherStateName;
  String? _weatherStateAbbr;
  String? _windDirectionCompass;
  String? _created;
  String? _applicableDate;
  double? _minTemp;
  int? _maxTemp;
  double? _theTemp;
  double? _windSpeed;
  double? _windDirection;
  double? _airPressure;
  int? _humidity;
  double? _visibility;
  int? _predictability;

  int? get id => _id;
  String? get weatherStateName => _weatherStateName;
  String? get weatherStateAbbr => _weatherStateAbbr;
  String? get windDirectionCompass => _windDirectionCompass;
  String? get created => _created;
  String? get applicableDate => _applicableDate;
  double? get minTemp => _minTemp;
  int? get maxTemp => _maxTemp;
  double? get theTemp => _theTemp;
  double? get windSpeed => _windSpeed;
  double? get windDirection => _windDirection;
  double? get airPressure => _airPressure;
  int? get humidity => _humidity;
  double? get visibility => _visibility;
  int? get predictability => _predictability;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['weather_state_name'] = _weatherStateName;
    map['weather_state_abbr'] = _weatherStateAbbr;
    map['wind_direction_compass'] = _windDirectionCompass;
    map['created'] = _created;
    map['applicable_date'] = _applicableDate;
    map['min_temp'] = _minTemp;
    map['max_temp'] = _maxTemp;
    map['the_temp'] = _theTemp;
    map['wind_speed'] = _windSpeed;
    map['wind_direction'] = _windDirection;
    map['air_pressure'] = _airPressure;
    map['humidity'] = _humidity;
    map['visibility'] = _visibility;
    map['predictability'] = _predictability;
    return map;
  }

}