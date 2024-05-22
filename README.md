# Dynamic Web Applications Continuous Deployment

> front-end, back-end, database 모두 하나의 컨테이너만 사용하는 기본적인 경우를 가정하고 진행한다.

## 기본 구조

```tree
├── .github
│   └── workflows
│       └── deploy.yml
├── docker-compose.dev.yml
├── docker-compose.localBuild.yml
├── docker-compose.serverDeploy.yml
├── backend
│   ├── Dockerfile
│   └── ...
├── db
│   ├── Dockerfile
│   └── ...
└── frontend
    ├── Dockerfile
    └── ...
```

자동화의 경우 deploy.yml에 정의하여 github action(runner)으로 진행한다. 결과적으로 추가 개발 및 배포
자동화는 아래의 과정을 통해 이루어진다.

- _local에서_

1. 소스코드 업데이트
2. main branch로 PR merged (runner trigger로 설정)

- _runner 시작(자동화된 과정)_

3. 소스코드 checkout
4. `docker-compose.localBuild.yml`을 이용하여 back, front, db 이미지 `build / tag / push`
5. (배포용 서버에 ssh로 접속해서)`docker-compose.serverDeploy.yml`파일을 업데이트
6. (배포용 서버에 ssh로 접속해서)`docker-compose.serverDeploy.yml`을 이용하여 이미지 `pull / up`
