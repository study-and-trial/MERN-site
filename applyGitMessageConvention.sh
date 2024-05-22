git config commit.template .commitMessageTemplate

echo -e "(1) 커밋 메시지 템플릿이 설정 되었습니다.(아래 명령으로 git 환경설정을 확인하세요.)

   git config -l | grep commit.template
"

echo -e "(2) PR message template은 .github/PULL_REQUEST_TEMPLATE.md 에서 확인하세요.
   (gh cli를 사용하여, gh pr create 할 경우 템플릿 선택이 가능합니다.)
"
# GitHub CLI api
# https://docs.github.com/ko/rest/repos/repos?apiVersion=2022-11-28#create-an-organization-repository

NAME_WITH_OWNER=$(gh repo view --json nameWithOwner | jq -r .nameWithOwner)

# 반드시 title, message를 함꼐 지정해야한다.
gh api \
  --method PATCH \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/$NAME_WITH_OWNER \
  -f "squash_merge_commit_title=PR_TITLE" \
  -f "squash_merge_commit_message=PR_BODY" > /dev/null

echo -e "(3) squash merge 템플릿이 설정 되었습니다.

   - title: PR_TITLE
   - body: PR_BODY
"
