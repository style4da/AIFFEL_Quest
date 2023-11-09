PNEUMONIA Classification Report & memoir(회고)
AIFFEL Online Core 6기 김대선

1. ResNet18 model 구현
Risidual Learning : Skip Connection(identity_block) 기법 활용
Data input size : 180, 180, 3
Classification Class : NORMAL(정상), PNEUMONI(폐렴)

2. 성능 향상을 위한 방법.
Data Augmentation (Flip, ZOOM, Rotation) : 데이터 수가 적습니다.
Shuffle, repeat, batch, prefetch : 학습 성능을 향상
Data balance 처리 : val data가 상대적으로 너무 적습니다.
EarlyStopping : 에폭 수를 늘리면서 설정.
learning_rate_scheduler : Local, global feature 마다 학습률 연관이 있다 하여 추가하였음.
GPU 사용 코드 적용이라는 새로운 것 배웠음.

3. 프로젝트 느낀점
이때까지 아이펠 과정이 다양하게 접목을 해야하는 느낌이 들었으나 아직은 미숙한 부분들이 많아서 걱정이 됐습니다. 부족한 부분들을 빨리 채울 수 있도록 복습들을 해야할 듯 합니다.
