import 'mypage_model.dart';

class MyPageController {
  UserProfile getUserProfile() {
    return UserProfile(
      nickname: '무딘',
      email: 'MOODIN@hongik.ac.kr',
      gender: '여자',
      stressTrend: [3, 2, 1, 5, 3.5, 2.5, 2],
      isMeasured: true, // 지금은 측정된 것으로 가정
      moodColor: 'red', // 빨간불로 고정
    );
  }
}
