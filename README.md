# mvpNews

## key point 
1. MVP design pattern
2. presenter unit test
3. WKWebView
4. using open source library 
5. bitrise and CI_CD

### MVP design pattern?
- 사용자의 action => view 는 데이터 요청 => presenter 요청 => model
- model 데이터 => presenter => view 
- presenter는 view, model의 인스턴스를 갖는다. => model과 view 사이의 의존성 해결

#### MVC와 무엇이 다른가?
controller:view = 1:n 관계
presenter:view = 1:1 관계

#### MVVM과 무엇이 다른가?
MVVM
- command pattern: view => viewmodel
- data binding pattern: viewmodel => view
- 독립적이고 view와 viewmodel 사이에 의존성이 없다. 
- viewmodel은 view에 데이터를 전달할 뿐 view를 변화시키지 않는다.
  - 반면 presenter는 특정 view를 만들도록 protocol의 함수로 제어하여 view에 영향을 준다.
- viewmodel: view = 1:n 관계

### open source lib 모음
```
https://ios.libhunt.com/
```
### Webview

#### 1. UIWebView
> deprecated
- UIKit에서 UIView 상속하는 class
- 메모리 관리 방식이 다르고 성능이 좋지 않음

#### 2.  SFSafariView
- safari 앱과 동일한 기능을 가진 ViewController
- safari의 동일한 쿠키, 웹사이트 데이터 공유
- 웹브라우저가 필요하거나 로그인 정보가 필요한 경우 사용 고려

#### 3. WKWebView
- 일반적으로 사용되는 웹뷰
- Webkit 프레임워크 class
- 메모리가 앱과 별도의 스레드로 관리된다
- 웹 페이지에 메모리가 많이 할당되더라도 앱은 죽지 않음
