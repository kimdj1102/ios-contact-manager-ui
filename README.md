# 📞연락처 관리 앱



## 목차

1. [팀원](#1-팀원)
2. [클래스다이어그램](#2-클래스-다이어그램)
3. [타임라인](#3-타임라인)
4. [실행 화면(기능 설명)](#4-실행화면기능-설명)
5. [트러블 슈팅](#5-트러블-슈팅)
6. [참고 링크](#6-참고-링크)
7. [팀 회고](#7-팀-회고)

<br>

## 1.팀원

| [mireu](https://github.com/mireu930)  | [Loffy](https://github.com/kimdj1102) |
| :--------: | :--------: |
|<img src=https://github.com/mireu79/ios-rock-paper-scissors/assets/125941932/b4a69222-b338-4a7f-984c-be5bd78dc1d8 height="150"/> |<img src=https://github.com/mireu930/ios-contact-manager-ui/assets/148876644/c905222c-ebe3-4d0c-8de4-2a9aa035ecc4 height="150"/> | 

<br>

## 2. 클래스 다이어그램


![UML](https://hackmd.io/_uploads/rkJNvbTuT.png)


<br>

## 3. 타임라인
|날짜|내용|
|------|---|
|24.1.2-3|프로젝트 흐름에 대한 파악 및 공식문서 공부|
|24.1.4|UI를 구성할때 코드베이스로 할지, 스토리보드를 사용할지에 대한 논의를 하다 UI를 한눈에 확인할 수 있는 스토리기반이 아닌 오토레이아웃이 어떻게 흘러가는 파악하기 위해 코드베이스로 구현하기로 협의 |
|24.1.5|JSON데이터형식 파일을 파싱하여 데이터를 불러와 view에 띄우도록 구현|
|24.1.8| AppDelegate, SceneDelegate 필요없는 주석제거, json데이터를 파싱하는 타입을 모델에 분리하고 데이터를 불러오지 못하면 알럿창을 띄우도록 구현 |
|24.1.9|UUID를 통해 데이터에 고유id를 주고, id를 통해 업데이트하도록 메서드 수정, Alert타입이 범용적으로 사용되도록 수정, 메인스토리보드 삭제 |
|24.1.10|파일폴더링 수정, 네비게이션바를 통해 플러스버튼을 누르면 디테일화면에 진입할수 있도록 구현, 디테일화면에 대한 UI구현, Save버튼을 누르면 테이블 Index에 새연락처가 저장되도록 구현, String확장을 통해 phoneTextFiled에 하이폰이 자동으로 들어가도록 구현|
|24.1.11| LocalizedError 프로토콜 사용, CustomCell을 통해 cellSytle이 subtitle이 되도록 구현, 전화번호 입력시 앞에 두자리 숫자가 하이폰이 들어가도 자연스럽게 하이폰이 들어가도록 로직수정|
|24.1.15|오토레이아웃에러(center) 수정, cell이 이용되는 부분은 내부적으로 수행하도록 수정, Model에 contact는 private(set)으로 읽기만 가능하도록 하여 로직수정|
|24.1.16|한글입력이 자음,모음 분리가 안되도록 배포타켓, 시뮬레이터 버전 수정, 서치바를 통해 이름을 검색하면 검색한 이름 나오도록 구현, Dynamic Type 적용, 국제전화 입력 형식 추가, 기존연락처 정보가 UI에 나오도록 구현 |
|24.1.17| 서치바에 검색을 할때 타이틀을 숨기지 않고, 서치바 cancel버튼 없애도록 구현, DynamicType에 따른 텍스트라벨,필드 오토레이아웃 수정, |
|24.1.18|save버튼 메서드에 삼항연산자가 아닌 바인딩을 통해 업데이트하도록 간결하게 수정, 타이틀과 barButton은 DynamicType적용안되도록 수정(barButton의 경우 customView를 통해 사이즈를 고정)|
|24.1.19|save버튼이 비활성화되어 있다가 수정이 이루어질때 활성화될수 있도록 구현|
 
<br>

## 4. 실행화면(기능 설명)


| 새연락처 추가 | 기존연락처 수정 |
| :--------: | :--------: |
| <img src=https://hackmd.io/_uploads/HJCZUsPY6.gif height="400"/> | <img src=https://hackmd.io/_uploads/rJiXIsvYa.gif height="400"/> 
| 연락처 삭제 | 이름검색 |
<img src=https://github.com/kimdj1102/ios-contact-manager-ui/assets/148876644/e42cbff6-3ffb-4858-a9f9-cd8867ca37dd height="400"/>|  <img src=https://hackmd.io/_uploads/Sk7gtsPK6.gif height="400"/>
|


  

<br>

## 5. 트러블 슈팅
#### 1️⃣ 기존연락처에서 정보를 수정해서 업데이트를 하면 수정한 정보가 UI에 띄워지지 않았습니다.
기존의 연락처에서 타고 들어가면 연락처 정보를 바꾸면 바뀌정보가 UI에 띄워져야 하는데 바뀌지 않았었습니다. 확인을 해보니 기존의 연락처의 id정보는 고유의 값인데 let new = Contact(name: name, phoneNumber: phone, age: age)로 id가 추가되는 ContactManager의 update메서드를 타지 못하고, 연락처가 추가가 되었습니다. 그래서 contact 프로퍼티가 nil이면 Contact를 추가하고, nil이 아니면 contact의 기존의 연락처를 받도록 삼항연산자를 써줬습니다.
```swift
//수정전
 do {
        let (name, age, phone) = try makeInfo()
        let new = Contact(name: name, phoneNumber: phone, age: age)
            if contact == nil {
                delegate?.add(contact: new)
            } else {
                delegate?.update(contact: new)
                detailView.contact = contact
            }
 }

//수정후
do {
     var new = contact == nil ? Contact(name: name, phoneNumber: phone, age: age) : contact!

            if contact != nil {
                new.phoneNumber = phone
                new.age = age
                new.name = name
                delegate?.update(contact: new)
              } else {
                 delegate?.add(contact: new)
            }
}
```
 
#### 2️⃣ Cell의 identifier를 코드로 지정해주는 방법에 대하여
storyboard를 사용하지 않고 코드로 구현을 했기 때문에, Custom Cell의 identifier도 코드로 설정을 해주어야 했습니다. 처음에는 static let으로 identifier를 고정해서 사용했지만, Cell이 늘어나면 헷갈릴 수 있기 떄문에 describing을 사용해서 호출하는 class의 이름을 String값으로 identifier에 넣어주었습니다.

```swift
// 변경 전

final class CustomCell: UITableViewCell {
    static let identifier = "cell"
}

let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier , for: indexPath)

// 변경 후

final class CustomCell: UITableViewCell {
    static var identifier: String {
        return String(describing: Self)
   }
}

let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier , for: indexPath)
```

#### 3️⃣ error를 이중으로 던지는 방법에 대하여
`contacts`프로퍼티를 private(set)으로 설정해주었기 때문에, 값을 변경하기 위해서는 내부에서만 변경을 할 수가 있습니다. `contacts`를 빈 배열로 초기화해준 후, contacts에 json파일을 decoding해서 넣어주는 과정에서 문제가 있었습니다. decoding을 할 때 try catch문을 사용하여 에러 처리를 했는데, error가 날 경우 alert창을 띄워야하는 상황이었습니다.

 처음에는 ContactManager의 parse()를 사용해서 ContactViewController에 접근한 후 alert창을 띄우려고 했지만, ContactManager는 ContactViewController를 모르기 때문에 당연히 alert창을 띄울 수 없었습니다. 그래서 ContactManager의 parse()에서 catch구문에서 error만 던진 후, ViewController의 parse()에서 그 error를 처리해주도록 하였습니다. 따라서 해당 ViewController에서 직접 상황에 맞는 error에 따라 alert를 띄울 수 있게 되었습니다.
 
```swift
// contactManger

private(set) var contacts: [Contact] = []

func parse() throws {
    do {
        contacts = try AssetDecoder<[Contact]>().parse(assetName: "MOCK_DATA")
    } catch {
        throw error
    }
}

//ContactViewController

private func parse() {
        do {
            try contactManger.parse()
        } catch {
            let alert = showErrorAlert(title: nil, error.localizedDescription, actions: [UIAlertAction(title: "취소", style: .default)])
            present(alert, animated: true)
        }
    }

```

 

<br>

## 6. 참고 링크
[📖 공식문서 UITableView](https://developer.apple.com/documentation/uikit/uitableview)<br>
[📖 공식문서 UIAlertController](https://developer.apple.com/documentation/uikit/uialertcontroller)<br>
[📖 공식문서 오토레이아웃 가이드](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853-CH7-SW1)<br>
[📖 공식문서 LocalizedError](https://developer.apple.com/documentation/foundation/localizederror)<br>
[📖 공식문서  Dynamic Type](https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically/)<br>
[📖 공식문서 Codable](https://developer.apple.com/documentation/swift/codable)<br>
[📖 공식문서 UIModalPresentationStyle](https://developer.apple.com/documentation/uikit/uimodalpresentationstyle)<br>
[📖 공식문서 UUID](https://developer.apple.com/documentation/foundation/uuid)

<br>

## 7. 팀 회고
- 😄우리팀이 잘한 점:
서로 의견을 존중해주며 짝프로그래밍을 잘 이행하였다.

- 😅우리팀이 개선할 점:
깃헙을 좀 더 잘다룰수 있도록 학습해야겠다..


