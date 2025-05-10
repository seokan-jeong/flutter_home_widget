# Flutter Home Widget

Flutter에서 iOS 홈 위젯을 구현한 프로젝트입니다.

![Flutter Home Widget Preview](assets/flutter_home_widget.png)

> 참고: 위젯 스크린샷이 프로젝트 루트에 저장되어 있습니다.

## 기능

- iOS 홈 화면에 Flutter 앱의 데이터를 표시하는 위젯
- 작은 크기의 위젯 지원
- 그라데이션 배경과 깔끔한 디자인
- 제목과 설명 표시 기능

## 구현 사항

- SwiftUI를 사용한 위젯 인터페이스 구현
- WidgetKit을 통한 위젯 데이터 관리
- Flutter에서 위젯으로 데이터 전송
- 위젯 디자인 커스터마이징

## 사용 방법

1. 앱을 설치합니다.
2. 홈 화면에서 길게 눌러 위젯 추가 메뉴를 엽니다.
3. 'Flutter Home Widget'을 선택하고 추가합니다.
4. 앱에서 데이터를 업데이트하면 위젯에 변경사항이 반영됩니다.

## 기술 스택

- Flutter
- Swift / SwiftUI
- WidgetKit

## 개발 환경 설정

이 프로젝트는 Flutter와 iOS 개발 환경이 필요합니다:

```bash
# Flutter 패키지 설치
flutter pub get

# iOS 의존성 설치
cd ios
pod install
```

## 관련 문서

- [Flutter 공식 문서](https://docs.flutter.dev/)
- [WidgetKit 문서](https://developer.apple.com/documentation/widgetkit)
- [SwiftUI 문서](https://developer.apple.com/documentation/swiftui)
