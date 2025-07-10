class UserProfile {
  final String nickname;
  final String email;
  final String gender;
  final List<double> stressTrend;
  final bool isMeasured; // 추가!
  final String moodColor; // 추가: 'red', 'yellow' 등

  UserProfile({
    required this.nickname,
    required this.email,
    required this.gender,
    required this.stressTrend,
    required this.isMeasured,
    required this.moodColor,
  });
}
