import 'dart:convert';


Weather weatherFromMap(String str) => Weather.fromMap(json.decode(str));

String weatherToMap(Weather data) => json.encode(data.toMap());

class Weather {
    Weather({
        this.location,
        this.current,
    });

    final Location location;
    final Current current;

    factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        location: Location.fromMap(json["location"]),
        current: Current.fromMap(json["current"]),
    );

    Map<String, dynamic> toMap() => {
        "location": location.toMap(),
        "current": current.toMap(),
    };
}

class Current {
    Current({
        this.lastUpdatedEpoch,
        this.lastUpdated,
        this.tempC,
        this.tempF,
        this.isDay,
        this.condition,
        this.windMph,
        this.windKph,
        this.windDegree,
        this.windDir,
        this.pressureMb,
        this.pressureIn,
        this.precipMm,
        this.precipIn,
        this.humidity,
        this.cloud,
        this.feelslikeC,
        this.feelslikeF,
        this.visKm,
        this.visMiles,
        this.uv,
        this.gustMph,
        this.gustKph,
    });

    final int lastUpdatedEpoch;
    final String lastUpdated;
    final double tempC;
    final double tempF;
    final int isDay;
    final Condition condition;
    final double windMph;
    final int windKph;
    final int windDegree;
    final String windDir;
    final int pressureMb;
    final double pressureIn;
    final int precipMm;
    final int precipIn;
    final int humidity;
    final int cloud;
    final double feelslikeC;
    final double feelslikeF;
    final int visKm;
    final int visMiles;
    final int uv;
    final double gustMph;
    final double gustKph;

    factory Current.fromMap(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"].toDouble(),
        tempF: json["temp_f"].toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromMap(json["condition"]),
        windMph: json["wind_mph"].toDouble(),
        windKph: json["wind_kph"],
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"].toDouble(),
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"].toDouble(),
        feelslikeF: json["feelslike_f"].toDouble(),
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        uv: json["uv"],
        gustMph: json["gust_mph"].toDouble(),
        gustKph: json["gust_kph"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toMap(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
    };
}

class Condition {
    Condition({
        this.text,
        this.icon,
        this.code,
    });

    final String text;
    final String icon;
    final int code;

    factory Condition.fromMap(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toMap() => {
        "text": text,
        "icon": icon,
        "code": code,
    };
}

class Location {
    Location({
        this.name,
        this.region,
        this.country,
        this.lat,
        this.lon,
        this.tzId,
        this.localtimeEpoch,
        this.localtime,
    });

    final String name;
    final String region;
    final String country;
    final double lat;
    final double lon;
    final String tzId;
    final int localtimeEpoch;
    final String localtime;

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
    };
}
