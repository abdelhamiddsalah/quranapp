class DailyAya {
  final int id;
  final String dailyAya;
  final DateTime time;

  DailyAya({
    required this.id,
    required this.dailyAya,
    required this.time,
  });

  factory DailyAya.fromJson(Map<String, dynamic> json) {
    return DailyAya(
      id: json['id'],
      dailyAya: json['dailyAya'],
      time: DateTime.parse(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dailyAya': dailyAya,
      'time': time.toIso8601String(),
    };
  }
}
