2023년 1월 25일 유튜브 Flutter 공식 채널에서 Flutter forward 2023이 진행되었다. ***Flutter는 3.7.0로, Dart는 3.0으로 업데이트***가 되었다.

## ****Element Embedding의 개념****

> Flutter 콘텐츠를 모든 표준 웹에 추가할 수 있습니다. 이러한 방식으로 통합하면 Flutter는 단순히 웹 구성 요소로 전환되어 웹 DOM과 원활하게 통합되고 CSS 선택기 및 변환을 사용하여 부모 Flutter 개체의 스타일을 지정할 수도 있습니다.
> 

→ 플러터에서 제공한 웹을 보았을 때, **웹에서 플러터앱을 사용할 수 있는 기능**을 말한다. 

## ****Element Embedding을 사용할 수 있는 웹****

💫 https://flutter-forward-demos.web.app/#/

위의 사이트는 flutter forward에서 element embedding을 선보인 사이트이다. 이를 통해 HTML기반 웹 페이지에 포함된 간단한 flutter앱을 만질 수 있다. 또한, JavaScript 이벤트 핸들러와 HTML 버튼을 사용하여 Flutter 상태를 변경하는 방법도 보여주고 있다.
![image](https://user-images.githubusercontent.com/90121929/230700802-10e66294-444d-4bdf-8b8a-22ddb20fa439.png)

## ****Element Embedding 활용하기****

### 전제조건

1. flutter channel 중 master 채널을 사용해야 한다.
2. Dart 버전은 `3.0.0`이상이어야 한다. 

### master 채널로 변경하기

```cpp
flutter channel
```

### Dart 3.0.0버전으로 변경하기

```cpp
flutter --version 
```

## 프로젝트 생성하기

💫 내가 할 프로젝트는 카운터 상태를 조정했을 때 js에 있는 카운터 상태도 조정되게 웹을 만들 것이다.


```cpp
flutter create web_embedding --platforms web
```

→ 여기서 flutter 프로젝트를 생성하는 것을 말하면, `—platforms`은 flutter앱을 어디서 여는 것을 지정한다. 

- ***—platforms web*** : 웹에서 flutter 앱을 여는 것을 말한다.

### js 패키지 추가

```cpp
flutter pub add js
```

→ Dart 코드에서 JavaScript API를 호출하거나 그 반대로 호출하려는 경우에 js 패키지를 사용한다. 또한, js 패키지의 두 번째 라이브러리인 `js_util`가정적 주석 API로 JavaScript를 래핑할 수 없을 때 사용할 수 있는 저수준 유틸리티를 제공한다.

## 실행화면

<img src="https://file.notion.so/f/s/94570c19-7d49-47f8-9453-5da3dcdf0cc3/Flutter_Demo_-_Chrome_2023-03-07_23-17-23_AdobeExpress_AdobeExpress.gif?id=8aaae20a-e9d9-40c6-a442-24f31ce5487a&table=block&spaceId=b12b0ef5-36af-4713-8130-4c2d165ea402&expirationTimestamp=1681008312879&signature=ye3JlKWXIl8TZXcFIPoTjLKJ_38G19cm8mBbH1YoHGo">
