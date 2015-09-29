# ruby on rails tutorial (1)

레일즈는 루비 언어로 작성된 웹 어플리케이션 프레임워크 입니다. 웹 어플리케이션을 만들기 위한 기본적이고 강력한 틀이 미리 준비되어 있기 때문에 다른 언어와 프레임워크에 비해 더 적은 코드로 빠르게 웹 어플리케이션(서비스)을 제작할 수 있습니다.  
이번 수업에서는 스캐폴드Scaffold 스크립트를 활용하여 정말 간단하게 전화번호부를 만드는 실습을 해보면서 레일즈 프레임워크의 전체에 대한 이해를 해봅니다. 단, 다음 수업부터는 절대 스캐폴드를 쓰지 않습니다. 기본 원리부터 차곡차곡 다시 배울 예정입니다.

## 학습 목표

1. Ruby On Rails 를 통해서 정적인static 페이지들을 구성해봅니다.
2. 스캐폴드 스크립트를 이용하여 MVC 패턴을 익힙니다.
3. 이번에 진행할 프로젝트는 **전화번호부 만들기**입니다.

### 프로젝트 시작하기

- c9.io 접속
- Ruby(on Rails) template 으로 프로젝트 생성

※ c9 에서는 ruby 선택시 자동으로 빈 레일즈 프로젝트를 만들어주지만, 본래 프로젝트 생성 명령어는 다음과 같습니다.
`rails new ProjectName(프로젝트명)`

### 서버 구동

 - c9.io 경우 중앙 최상단의 Run Project 녹색 버튼을 누르시면 됩니다. (처음 한번만 놀러주시면 됩니다.)
 - 그 후 터미널에 나오는 주소를 클릭하여 미리보기하시면 됩니다.(약간의 시간이 소모 될 수 있습니다.)
 
※ c9 에서는 버튼 클릭 한 번으로 서버 구동이 가능하지만, 본래 서버 구동 명령어는 다음과 같습니다.
`rails s`

### MVC 패턴(모델, 뷰, 컨트롤러)

Ruby On Rails 를 비롯한 다양한 웹 프로젝트들은 MVC 패턴을 따릅니다.  
MVC 패턴은 Model, View Controller 를 의미하며 각자의 역할은 다음과 같습니다.  
- Model(모델) : 데이타베이스와 그 데이터에 해당되는 다양한 조건을 정의
- View(뷰) : 모델에 있는 데이터를 기반으로 사용자 인터페이스의 생성을 담당
 - Html 파일이라고 생각하셔도 좋습니다.
- Controller : 모델과 뷰의 중계 역할 ➝ 클라이언트로부터 요청을 받아 모델과 상호작용 ➝ 적절한 뷰를 보여줌

## 정적인Static 뷰View를 만들어 보기

### 컨트롤러 생성하기

Ruby On Rails 제대로된 작업을 시작해보도록 합니다. 먼저 MVC 패턴 중 컨트롤러를 생성하도록 하겠습니다. 명령어의 형식은 다음과 같습니다.  
`rails g controller ControllerName(임의의 이름)`

일단 첫 페이지를 만들기위해 컨트롤러 이름을 **Home**이라고 짓겠습니다. 따라서 명령어는 다음과 같습니다.  
`rails g controller home`

### 컨트롤러의 액션 만들기

다음과 같이 컨트롤러 파일이 생겼습니다. `app/controllers/home_controller.rb`  

```ruby
class HomeController < ApplicationController
   def index 
   end       
end
```

위와 같이 코드를 수정합니다. home_controller 에 index 라는 액션을 생성했습니다.  
액션은 클라이언트로부터 요청을 받고 이를 처리하는 하나의 최소 단위라고 생각하시면 됩니다. 여러 개의 액션을 모아 하나의 컨트롤러를 구성합니다. (일반적인 문서정리처럼 컨트롤러를 폴더, 액션을 파일 처럼 생각하셔도 좋겠습니다.)  
보통 자료 정리하듯 의미상 비슷한 액션들을 하나의 컨트롤러에 넣게됩니다.  
예를 들면 유저가 `www.mysite.com(임의의 주소)` 으로 접근했을 때 클라이언트는 해당 경로로 요청을 보내고, 루비온레일즈에서는 이 요청을 받아들이고, 특정 **액션**으로 보내 해당 요청을 처리하게 만듭니다.

### 액션에 대응하는 뷰파일(html.erb) 생성하기
뷰(View)는 클라이언트에 보여지게 되는 웹페이지 입니다. 지금까지 배웠던 html 파일과 거의 동일하다고 생각하시면 됩니다.  
html 이 아닌 html.erb 파일라는 차이점이 있다는 것을 일단은 알아두시면 됩니다.

`app/views/home` 폴더는 home 컨트롤러의 뷰파일들을 관리하는 폴더입니다.  
먼저 해당 폴더에 index.html.erb 파일을 만들어주세요.  
그리고 그 후에 다음과 같이 간단한 html 코드를 입력해봅시다.

**app/views/home/index.html.erb**

```html
<h1> contact 컨트롤러 index 액션의 뷰파일입니다.</h1>
```

`<html>, <title>, <head>, <body>` 같은 태그를 쓰지 않았습니다.  
Ruby On Rails 에서는 layout 파일이 별도로 존재하기 때문에 사용하지 않아도 됩니다.
layout 파일의 위치는 다음과 같습니다. `app/views/layout/application.html.erb`

※ `<%= yield %>` 라는 코드가 있는 곳에 `index.html.erb` 파일의 내용이 삽입되게 됩니다.

### 경로 명시해주기

컨트롤러를 만들고, index 액션을 만들었습니다. 그리고 그에 대응하는 index.html.erb 라는 뷰파일 또한 만들었습니다.  
다음으로 해야할 것은 `config/routes.rb` 파일에 경로를 명시해주는 것입니다.  
Ruby On Rails 에서 routes.rb 파일의 역할은 특정 경로를 컨트롤러의 액션에 매칭시켜서, 그 특정 경로로 클라이언트가 접속했을 때 그 요청을 매칭되어 있는 액션에서 처리하게 됩니다.  
우리는 index 액션에서 요청을 처리하도록 해야겠죠.

```ruby
Rails.application.routes.draw do
  get '/' => 'home#index' 
  ...
  ...
  ...
  (생략...)
```

위와 같이 코드를 수정합니다. '/' 는 일반적으로 사이트의 접근했을 때의 경로를 의미합니다.  
(예시 :  '/' -> www.naver.com, '/abc' -> www.naver.com/abc)

'/' 경로로 요청이 들어왔을 때 contact 컨트롤러 index 액션에서 이를 처리하도록 경로를 지정해주었습니다.
형식은 다음과 같습니다. `HttpType(get, post 등) '경로' => '컨트롤러명#액션명'` 
[HttpType 참고자료](http://blog.outsider.ne.kr/312)

### 확인하기

이제 서버의 URL 로 가서 확인해보면 index.html.erb 파일에 작성했던 `<h1>` 태그의 내용이 보이는 것을 알 수 있습니다.  
우리가 지금까지 했던 작업들에 대해서 정리해보도록 합니다.  

1. 프로젝트 생성
2. 컨트롤러 생성(home)
3. 액션 생성(index)
4. index 액션과 대응하는 뷰파일 생성(index.html.erb)
5. 클라이언트로부터 요청이 왔을 때 index 액션에서 요청을 처리할 수 있도록 경로를 지정(routes.rb 파일에서 작성)
위 과정들을 수정했을 때 자신이 원하는 페이지가 나타나도록 할 수 있다는 걸 알 수 있습니다.

### 수업 중 과제 (1/2)

- about 페이지를 만들어 봅시다. 주소는 `도메인/about` 입니다. 그리고 간단한 내용을 넣어 봅니다.
- 나름의 이름을 정하여 3개의 페이지를 더 만들어 봅시다.
- home#index 페이지와 home#about 페이지, 그리고 나머지 3개의 페이지를 편하게 이동할 수 있도록 `a` 태그를 이용해 메뉴를 만들어 봅시다. (힌트 : layout을 이용해보세요)

## 스캐폴드Scaffold를 이용해 간단히 그룹별 전화번호부 만들어 보기

### 스캐폴드Scaffold ?

스캐폴드는 `발판`이라는 의미로 웹 어플리케이션의 가장 기본이 되는 데이터베이스 CRUD 에 필요한 기본적인 코드를 생성해주는 레일즈의 스크립트 명령어 입니다.  
CRUD 란 Create, Read, Update, Delete 의 약자로 데이터베이스 만들고, 읽고, 수정하고, 삭제하는 행위를 의미합니다.  
스크립트란 일련의 작업들을 미리 정의해 놓고 편하게 쓸 수 있는 명령어라고 보시면 됩니다. 레일즈의 스크립트들 덕분에 개발자들은 손수 파일을 새로 만들고 코드를 일일이 타이핑하는 수고를 덜 수 있습니다. 하지만, 커스터마이징을 힘들게 한다는 단점도 있습니다. 그래서 이번 시간 이후로 스캐폴드 스크립트는 최대한 쓰지 않는 걸로 하겠습니다.  
레일즈에서 자주 사용하는 스크립트로는 앞서 보았던 컨트롤러 생성 스크립트와 모델 생성 스크립트 등이 있습니다.

### 스캐폴드 생성하기

`rails g scaffold Groups title:string writer:string`

처음으로 만들어 볼 것은 그룹별 전화번호부를 만들 수 있도록 `title` 컬럼(열)과 `writer` 컬럼(열)을 CRUD 할 수 있는 스캐폴드를 만들어 보겠습니다.

**데이터베이스 구조 설계**

| id  | title      | writer     |
| --- | ---------- | ---------- |
| 1   | 가족       | 최○○       |
| 2   | 친구       | 최○○       |
| 3   | 수업       | 김○○       |

* 여기서 id는 자동으로 부여 됩니다. 하나의 데이터가 입력 될 때마다 1 씩 증가하면서 고유의 번호가 매겨지게 되며, id 값은 Groups 모델에 있어서 주민등록번호와 같은 존재입니다. 레일즈에서 생성되는 모든 모델에는 기본적으로 id 컬럼이 부여됩니다.  

### 스캐폴드로 생성된 파일들

Groups 모델을 만들면서 생긴 것은 모델 파일(`app/models/groups.rb`) 과 마이그레이션 파일(`db/migrate/dateinfo...create_groups.rb`), 컨트롤러(`app/controllers/groups_controller.rb`), 그리고 뷰(`app/views/groups/index|show|new|edit.html.erb 등등`) 입니다.
또한, `config/routes.rb` 파일에 `resources :groups` 라는 한 줄이 추가되었습니다.  
일반적으로 데이터베이스 CRUD를 수행할 때 필요한 모든 뷰와 라우트, 모델 파일 들을 알아서 만들어주었습니다.  
다음 시간부터 여러분들은 이러한 것들 하나하나의 개념과 원리를 익히셔야 합니다.

### 확인해보기

성공적으로 스캐폴드 스크립트가 수행되었다면 이제 우리의 첫 서비스를 확인해봅시다.  
일단 마이그레이션 파일을 토대로 데이터베이스를 생성해주어야 합니다.

**데이터베이스 생성하기**

`rake db:migrate` 명령어를 통해서 데이터베이스를 생성할 수 있습니다. 마이그레이션 파일이 만들어 진 후 처음 한번만 실행해주시면 됩니다. 이 명령어를 통해 `db/development.sqlite3` 파일이 만들어집니다. (우리의 개발용 데이터베이스입니다)  
`rake db:drop` 명령어를 통해서 데이터베이스를 삭제(`db/development.sqlite3`)할 수 있습니다.  
만약, 마이그레이션 파일을 수정하게 되면 반드시 `rake db:drop`를 수행 후 `rake db:migrate`를 통해 데이터베이스를 다시 생성해주어야 합니다.

**주소 규칙 확인해보기**

터미널에 `rake routes` 명령어를 통해서 경로들을 확인해볼 수 있습니다.

```
       Prefix Verb    URI Pattern            Controller#Action
  groups_index GET    /groups(.:format)          groups#index
               POST   /groups(.:format)          groups#create
    new_groups GET    /groups/new(.:format)      groups#new
   edit_gropus GET    /groups/:id/edit(.:format) groups#edit
        groups GET    /groups/:id(.:format)      groups#show
               PATCH  /groups/:id(.:format)      groups#update
               PUT    /groups/:id(.:format)      groups#update
               DELETE /groups/:id(.:format)      groups#destroy
```

미리보기 주소 창에 `도메인/groups` 를 입력하고 데이터를 쓰고 수정해봅시다.

### Contact 테이블 설계하기

설계할 Contact 테이블은 다음과 같은 요소를 가지고 있어야 합니다.  
이름(name)과 전화번호(phone_numer), 그리고 각 연락처가 속해있는 group의 아이디(group_id) 입니다.  

| id  | group_id  | name      | phone_number   |
| --- | --------- | --------- | -------------- |
| 1   | 1         | 김○○      | 010-1234-5678  |
| 2   | 1         | 이○○      | 010-1111-2222  |
| 3   | 1         | 박○○      | 010-2222-3333  |

### Contact 스캐폴드 생성하기

`rails g scaffold Contacts group_id:integer name:string phone_number:string` 명령어를 통해 스캐폴드를 생성합니다.  
여기서 group_id는 정수(숫자)이기 때문에 integer 타입으로 설정해주었고, 나머지는 255자 이내의 문자열이기 때문에 string 타입을 주었습니다.  
위에서 groups 스캐폴드를 생성했을 때처럼 contacts에 해당하는 뷰, 컨트롤러, 모델 파일들이 생성됩니다.

미리보기에서 `도메인/contacts` 에 들어가 결과물을 확인해봅시다. 이때, 새로 만드는 연락처의 group_id는 숫자 '1'로 입력해봅니다. 


### 수업 중 과제 (2/2)

**db/migrate/날짜...create_contacts.rb**

```ruby
class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :group_id
      t.string :name       
      t.string :phone_number
      
      t.timestamps null: false
    end
  end
end
```

위와 같이 데이터베이스 테이블의 항목을 정의할 수 있습니다. 형식은 다음과 같습니다.  
`t.데이터타입 :항목이름` => 데이터 타입은 string(문자열), integer(숫자), text(많은 문자열) 등이 있습니다.

** 메모 항목(memo:text)을 추가해 봅시다 **

해당 마이그레이션 파일을 수정한 후 반드시 `rake db:drop`을 수행하고 다시 데이터베이스를 생성해주세요. `rake db:migrate`  
또한, 비고 항목을 작성하기 위해 뷰 폴더의 _form.html.erb 파일에 textarea를 추가해주셔야 합니다.  
검색을 통해 한번 해결해보세요!
