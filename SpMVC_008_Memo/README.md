# 메모장 프로젝트
* 가장 간단하게 CRUD를 구현하기 위한 프로젝트
* mySQL, mybatis를 연동
* 한 개의 파일을 업로드 할 수 있게

## dependency
* spring-jdbc
* mybatis
* mybatis-spring
* mysql-connector
* commons-dbcp
* commons-io
* commons-fileupload

## 추가 사항
* 버킷리스트 추가하는 부분 만들기
### 6월 27일
* 로그아웃 누르면 진짜 로그아웃 할거야? 하는 자바스크립트 추가하기
* 메모장에서 시간, 날짜 flex해서 째그맣게 나오도록 하기


# 부산광역시_부산맛집정보 서비스 OpenAPI 연동
## 부산광역시_부산맛집정보 서비스 API 의 문제점 발견
* json type으로 데이터를 요청하고 RestTemplate를 사용하여 데이터를 변환 mapping하려고 한느데, 데이터는 분명 JSON type인데 MIME type의 text/plain으로 수신되고 있다.
* RestTemplate는 application/json MIME type으로 데이터가 수신되어야 VO, List<VO> type으로 자동변환, mapping할 수 있는데, text/plain의 실제 데이터는 JSON 모양이지만, 일반 String type의 문자열과 같이 때문에 변환할 수 없다.
* JavaScript를 사용한다면 JSON.parse("JSON type의 문자열") 함수를 사용하여 쉽게 JSON객체로 변환할 수 있다. 하지만 JAVA에서는 안된다.
* RestTemplate 클래스에는 수신된 데이터를 중간에 가로채서 사용자(개발자)가 임의로 데이터를 변경할 수 있도록 통로를 만들어 줬다.

* RestTemplate.intercepter 기능을 활용하면 수신된 데이터를 임의로 조작 가능하다.

## RestTemplate의 interceptor 설정하기

### 클래스를 선언하여 실행하기
* ```ClientHttpRequestInterceptor``` 인터페이스틀 implement하여 클래스를 선언하고, intercept() method를 재 정의하여 강제로 APPLICATION_JSON형태로 ContentType을 변환하기
* ```HttpRequestInterceptorV1``` class를 정의하고, ```intercept``` method 재정의하기
* 이 방법은 가장 고전적인 Plane Of Java Object 방식의 코드이다.
* 한 개의 method를 간단하게 정의하기 위해 굳이 새로운 클래스를 만드는 것이 왠지 낭비스러운 생각이 든다.

### 인터페이스를 사용하여 객체 생성하기
* 방법 1
* 인터페이스를 사용하여 객체 생성하기
* 한번만 사용하고 버릴 클래스, 인스턴스 만들기
```
		ClientHttpRequestInterceptor httpIntercept = new ClientHttpRequestInterceptor() {
			@Override
			public ClientHttpResponse intercept(HttpRequest request, byte[] body, ClientHttpRequestExecution execution)
					throws IOException {
				
				return null;
			}
		};
```

### 익명 클래스를 사용하여 직접 객체 주입하기
* 방법 2
* 일회용 객체를 인터페이스를 직접 사용하여 만들고, 직접 주입하기
* 인스턴스 변수를 생성하지 않는다.
* 딱 한번만 사용하고 더이상 사용할 필요가 없을 때 활용하는 방법이다.
* 실제 안드로이드 App 제작에서 이벤트 핸들러를 만드는 가장 대표적인 방법이다.
```
		restTemp.getInterceptors().add(new ClientHttpRequestInterceptor() {
			@Override
			public ClientHttpResponse intercept(HttpRequest request, byte[] body, ClientHttpRequestExecution execution)
					throws IOException {
				ClientHttpResponse response = execution.execute(request, body);
				response.getHeaders().setContentType(MediaType.APPLICATION_JSON);
				return response;
			}
		}); //변수 없음(익명 클래스): 일회용 클래스이다.
```

### java1.8 이상에서 사용하는 Lamda 코드, 무명 클래스
* 방법 3
* 인터페이스를 사용하여 Lamda 코드로 주입하기.
* Lamda를 사용하여 무명 클래스 방식으로 주입하면 클래스, 객체, 메서드 이름 이 모든 것을 생략할 수 있다.
```

		restTemp.getInterceptors().add((request,body,execution) -> {
			ClientHttpResponse response = execution.execute(request, body);
			response.getHeaders().setContentType(MediaType.APPLICATION_JSON);
			return response;	
		});
```


### Lambda
* 인터페이스에 method가 1개만 있을 때 Lamda를 사용하여 객체를 만들 수 있다.
* interface를 class에서 implement하지 않고 사용하는 것을 말한다.