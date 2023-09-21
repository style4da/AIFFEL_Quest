# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 김대선 & 조세창
- 리뷰어 : 조필선


# PRT(Peer Review Template)
- [Y]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
   -> 네! 주어진 문제를 해결하는 코드가 제출되었습니다.


 ```  # 물고기 움직임 컴프리헨션 함수.
def show_fish_movement_comprehension(fish_list):
    # 리스트 컴프리헨션을 통해 물고기 리스트를 순회하면서 '이름' 과 'speed'에
    # 넣은 f"{fish['이름']} is swimming at {fish['speed']} m/s"를 movement 변수에 할당한다.
    movement = [f"{fish['이름']} is swimming at {fish['speed']} m/s" for fish in fish_list]
    # for문을 통해서 movement 변수를 차례대로 출력한다.
    for move in movement:
        print(move)

# 물고기 움직임 제너레이터 함수
def show_fish_movement_generator(fish_list):
    for fish in fish_list:
        yield f"{fish['이름']} is swimming at {fish['speed']} m/s"

# 물고기 리스트
fish_list = [
    {"이름": "Nemo", "speed": 3},
    {"이름": "Dory", "speed": 5},
]

print("Using Comprehension:")
show_fish_movement_comprehension(fish_list)

print("Using Generator:")
# generator 변수에 반환된 f"{fish['이름']} is swimming at {fish['speed']} m/s"를 할당
generator = show_fish_movement_generator(fish_list)
# for문을 순회하면서 물고기 움직임 출력
for move in generator:
    print(move)

```


- [Y]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
   -> 네, 코드 중에서 가장 핵심이며 복잡해 보이는 코드는 다음과 같습니다.
```
# 물고기 움직임 컴프리헨션 함수.
def show_fish_movement_comprehension(fish_list):
    movement = [f"{fish['이름']} is swimming at {fish['speed']} m/s" for fish in fish_list]
    for move in movement:
        print(move)
```
이 함수는 리스트 컴프리헨션을 사용하여 주어진 'fish_list'에서 각 물고기의 움직임 정보를 추출하고
그 정보를 출력합니다. 코드 주석은 아래와 같이 해당 코드 블록이 어떤 일을 하고 있는지 수행하는 것을 보여줍니다.
movement 리스트는 fish_list를 순회하며 각 물고기의 이름과 속도 정보를 문자열로 포맷팅한 결과를 담고 있습니다.
그리구 그 후에, for 반복문을 사용해서 movement 리스트를 순회하면서 물고기의 움직임 정보를 출력합니다. 
또한 이해하기 쉽게 주석이 작성되었으므로 해당 코드 블록이 이해가 됩니다.

  
        
- [N]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
   -> 추가적인 에러 해결 과정이나 실험 내용은 없는 것으로 보입니다.
      참고로 코드 실행 결과는 아래와 같습니다.
```
  Using Comprehension:
Nemo is swimming at 3 m/s
Dory is swimming at 5 m/s

Using Generator:
Nemo is swimming at 3 m/s
Dory is swimming at 5 m/s
```

        
- [Y]  **4. 회고를 잘 작성했나요?**
    -> 네, 아래와 같이 회고 부분이 잘 작성되어 있습니다.
```
  회고
배운점 : 리스트 컴프리헨션, 제너레이터 함수들이 아직 익숙하지는 않지만 조세창그루님의 도움을 많이 받고 배우면서 완성할 수 있었습니다.

아쉬운점 : 아직 함수들이 익숙하지 않아 이를 적용하고 익숙해지도록 연습이 필요합니다.
5
느낀점 : 실제 코드들을 다양하고 유연하게 접목시키는 것이 역시 가장 중요하다고 느껴집니다.
```
        
- [Y]  **5. 코드가 간결하고 효율적인가요?**
    -> 네, 코드가 간결하고 효율적으로 잘 작성된 것 같습니다.
    코드는 파이썬 스타일 가이드(PEP8)를 준수하고 있으며, 공백, 젼수 및 함수 이름의 명명 규칙등이 지켜져 코드으 가독성을 높이고
    있습니다. 그리고 코드가 함수화 되어 있어, 다음 번에도 재사용이 가능 할 것입니다.
    
```
# 물고기 움직임 컴프리헨션 함수.
def show_fish_movement_comprehension(fish_list):
    movement = [f"{fish['이름']} is swimming at {fish['speed']} m/s" for fish in fish_list]
    for move in movement:
        print(move)

# 물고기 움직임 제너레이터 함수
def show_fish_movement_generator(fish_list):
    for fish in fish_list:
        yield f"{fish['이름']} is swimming at {fish['speed']} m/s"
```             
    


# 참고 링크 및 코드 개선

<리뷰>

코드가 직관적이며 간결하게 작성이 된 부분이 좋았습니다.
그리고 함수명과 간단한 주석을 통해서 각 함수의 목적이 무엇인지를 명확하게 설명해주고 있는 것 같습니다.
컴프리헨션과 제너레이터 함수를 작성하여 Python의 특징을 잘 활용하고 있는 것으로 보입니다.
추가적으로, 함수 호출 시 주석을 통해서 각 함수의 출력 결과나 반환 값에 대한 설명을 더 자세히 기술하는 것이 도움이 될 수 있습니다.


