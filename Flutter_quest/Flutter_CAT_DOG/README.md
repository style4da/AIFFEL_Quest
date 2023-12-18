 *회고
        
          1. 화면을 셋팅하고 구성하는 것은 금방하였으나 사진을 300*300으로 맞추는 것에서 조금 헤맸지만 찾아보고 완성하였습니다.
        
          2. 전 퀘스트에서 살짝씩 업그레이드하고 추가하는 느낌으로서 많이 배웠습니다.
          
          3. 이혁희 그루님께 많이 배우면서 코딩을 하는 시간이었습니다. 감사합니다.

# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 이혁희 & 김대선
- 리뷰어 :  강임구


# PRT(Peer Review Template)
- [v]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 코드를 캡쳐해 근거로 첨부

1. 페이지 간 이동을 구현합니다

```
second에서 first로
            ElevatedButton(
              onPressed: () {
                print("is_cat: ${args['arg1'].toString()}");
                Navigator.pop(context);
              },
              child: const Text('Back')
```

2. 페이지 간 데이터 이동을 구현합니다.

```
                Navigator.pushNamed(context, '/dog',
                    arguments: {"arg1": is_cat});

```


    
- [v]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```
                // is_cat = false로 변경하고, /dog로 이동한다.
                //
                print("is_cat: $is_cat");
                is_cat = false;
                //final result = await Navigator.pushNamed(context, '/two',
                Navigator.pushNamed(context, '/dog',
                    arguments: {"arg1": is_cat});
                //print('result:${(result as User).name}');
                is_cat = true;
```
      
- [v]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```
에러 없이 작동하였다.
```
     
- [v]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 기록되어 있는지 확인
    - 전체 코드 실행 플로우를 그래프로 그려서 이해를 돕고 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```
본문 상단에 회고가 첨부되어 있음
```
    
- [v]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 하드코딩을 하지않고 함수화, 모듈화가 가능한 부분은 함수를 만들거나 클래스로 짰는지
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 함수화했는지
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/cat',
      routes: {
        '/cat': (context) => CatScreen(),
        '/dog': (context) => DogScreen(),
      },
    );
  }
}

고양이 화면과 개 화면의 이동을 보여줌
```


# 참고 링크 및 코드 개선
```
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```
<img width="360" alt="스크린샷 2023-12-18 오후 5 11 52" src="https://github.com/style4da/AIFFEL_Quest/assets/144193737/a114be32-c9bb-4e50-abfb-9b921e26683f">
<img width="350" alt="스크린샷 2023-12-18 오후 5 10 34" src="https://github.com/style4da/AIFFEL_Quest/assets/144193737/8b35cf36-c2f1-4d78-bf15-d301c53739d0">


