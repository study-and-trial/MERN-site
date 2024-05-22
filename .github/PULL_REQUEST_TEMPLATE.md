## Title

SQUASH MERGE PR #<pr_number>, branch <branch_name>

## Body

This merge Resolved #<issue_number>

- 아래 커맨드를 실행한다.(가져오는 내용은 PR 날리려는 branch의 변경 사항을 예쁘게 포메팅한 것이다.)

```bash
git log --pretty=format:"COMMIT : %h%nTITLE : %s%nMESSAGE: %b%n%cd==================================== %ae%n%n" --date=short

#이때 끝에 `<start branch>..<destination branch>`를 해 주면 원하는 만큼의 커밋 log를 가져올 수 있다.
```

ex)

git log --pretty=format:"COMMIT : %h%nTITLE : %s%nMESSAGE: %b%n%cd==================================== %ae%n%n" --date=short main..HEAD
