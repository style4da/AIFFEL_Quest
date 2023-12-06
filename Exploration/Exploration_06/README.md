# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 김대선
- 리뷰어 : 김연


# PRT(Peer Review Template)
- [X]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 퀘스트 문제 요구조건 등을 지칭
    - 해당 조건을 만족하는 코드를 캡쳐해 근거로 첨부
    

```
from diffusers import StableDiffusionControlNetPipeline, ControlNetModel, UniPCMultistepScheduler  

# Q. 코드를 작성해 보세요.
# Edge Detection과 Openpose, 2개의 전처리기를 controlnets라는 리스트로 만듭니다. 
edge_detection = ControlNetModel.from_pretrained("lllyasviel/sd-controlnet-canny", torch_dtype=torch.float16)
openpose = ControlNetModel.from_pretrained("lllyasviel/sd-controlnet-openpose", torch_dtype=torch.float16)
controlnets = [edge_detection, openpose]

# 리스트 controlnets를 파이프라인으로 전달합니다. 
pipe = StableDiffusionControlNetPipeline.from_pretrained("runwayml/stable-diffusion-v1-5", controlnet=controlnets, torch_dtype=torch.float16)

pipe.scheduler = UniPCMultistepScheduler.from_config(pipe.scheduler.config)
pipe = pipe.to("cuda")

# 프롬프트를 작성합니다. 
prompt =  'suit man'
negative_prompt =  'black'

# seed를 지정합니다. 
generator = torch.manual_seed(0)

images = [openpose_image, canny_image]

# 이미지를 생성합니다. 
image = pipe(prompt=prompt, negative_prompt=negative_prompt, generator=generator, image=images).images[0]

# 생성된 이미지를 저장합니다.
# image.save("aiffel/multi_controlnet_output.png")

# 생성된 이미지를 출력합니다.  
image
```

>ControlNet의 OpenPose와 Canny를 활용하여 사진을 생성하는 코드를 제출하셨습니다.

- [X]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
    - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.
    
```
# Openpose 검출기를 사용하면 자세만 추출
from controlnet_aux import OpenposeDetector

# 인체의 자세를 검출하는 사전 학습된 ControlNet 불러오기
openpose = OpenposeDetector.from_pretrained("lllyasviel/ControlNet")

# 이미지에서 자세 검출
openpose_image = openpose(openpose_image)
openpose_image
```

>작업하시는 코드 블록, 코드 라인마다 주석을 작성하셔서 전체적인 플로우를 이해하는 것이 아주 수월했습니다.

- []  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” ”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
    - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```
# Q.프롬프트를 작성하고 하이퍼파라미터를 조절하여 이미지를 생성해 보세요. 
canny_image = canny_pipe(
    prompt="disco fox with colorful lights", 
    controlnet_conditioning_scale=3.0,
    num_inference_steps=30, 
    generator=generator, 
    image=canny_image
).images[0]

# 생성된 이미지를 저장합니다. 
canny_image.save("/aiffel/aiffel/canny_image.png")  

# 생성된 이미지를 출력합니다. 
canny_image
```    


> controlnet_conditioning_scale=3.0과 같이 하이퍼파라미터를 삽입, 조정하여 다이나믹한 시도를 하신 것 같습니다. 피어리뷰하는 동안 결과 이미지 생성이 안되는 것과 관련하여 고민하셨고, LMS 로그아웃/로그인을 시도한 후 주피터 파일을 다시 열어서 전체 플로우를 실행했습니다. 안타깝지만 결과 이미지는 확인할 수 없었습니다.
    
- [X]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 기록되어 있는지 확인
    - 전체 코드 실행 플로우를 그래프로 그려서 이해를 돕고 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.
   
```
# 회고

# 1. 이미지 생성과 파이프라인을 통해 이미지 특징을 강화해보았는데 하이퍼파라미터를 수정하면서 기준을 잡아 테스트를 진행하는 것이 어려웠습니다.
# 2. 코드를 확인하고 짜는 과정이 디테일한 부분에서 놓치는 것들을 수정하면서 잡아나갔습니다.이 부분역시 어려움을 느꼈습니다.
```

> 네. 작업하신 파일의 하단에 회고를 작성해 주셨습니다.

- [X]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 하드코딩을 하지않고 함수화, 모듈화가 가능한 부분은 함수를 만들거나 클래스로 짰는지
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 함수화했는지
    - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.
	
```
from diffusers import StableDiffusionControlNetPipeline, ControlNetModel, UniPCMultistepScheduler  

# Q. 코드를 작성해 보세요.
# Edge Detection과 Openpose, 2개의 전처리기를 controlnets라는 리스트로 만듭니다. 
edge_detection = ControlNetModel.from_pretrained("lllyasviel/sd-controlnet-canny", torch_dtype=torch.float16)
openpose = ControlNetModel.from_pretrained("lllyasviel/sd-controlnet-openpose", torch_dtype=torch.float16)
controlnets = [edge_detection, openpose]

# 리스트 controlnets를 파이프라인으로 전달합니다. 
pipe = StableDiffusionControlNetPipeline.from_pretrained("runwayml/stable-diffusion-v1-5", controlnet=controlnets, torch_dtype=torch.float16)

pipe.scheduler = UniPCMultistepScheduler.from_config(pipe.scheduler.config)
pipe = pipe.to("cuda")

# 프롬프트를 작성합니다. 
prompt =  'suit man'
negative_prompt =  'black'

# seed를 지정합니다. 
generator = torch.manual_seed(0)

images = [openpose_image, canny_image]

# 이미지를 생성합니다. 
image = pipe(prompt=prompt, negative_prompt=negative_prompt, generator=generator, image=images).images[0]

# 생성된 이미지를 저장합니다.
# image.save("aiffel/multi_controlnet_output.png")

# 생성된 이미지를 출력합니다.  
image
```


> 어쩌면 이번 프로젝트에서의 미션은 Openpose와 Canny를 믹스해서 이미지를 생성할 수 있도록 코드를 디자인하고 결과물을 확인하는 것이었다고 생각합니다. 위와 같이 이미지를 생성할 수 있도록 코드가 작성되었습니다. 전체적으로 이해하기가 수월한 간결한 코드입니다. 노드에서 가이드된 내용에 따라 플로우를 디자인하셨습니다. 수고하셨습니다!


