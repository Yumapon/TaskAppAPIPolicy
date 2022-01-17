# メモ

## Docker container

```sh
docker run -it --rm -p 8181:8181 openpolicyagent/opa run --server --addr :8181
```

## DATA API

```sh
#OPAにPolicyを読み込ませる
curl -X PUT -H 'Content-Type: text/plain' --data-binary @httpauthz.rego http://localhost:8181/v1/policies/httpapi_authz

#Policyをしっかりと読み込んだかどうか確認
curl http://localhost:8181/v1/policies/httpapi_authz
```

## TEST

```sh
#動作確認(trueが帰ってくる: adminユーザにwrite権限があるか)
curl -X POST -H 'Content-Type: text/plain' --data-binary @input.json localhost:8181/v1/data/httpapi/authz/allow | jq .

#動作確認(falseが帰ってくる: guestユーザにwrite権限があるか)
curl -X POST -H 'Content-Type: text/plain' --data-binary @input2.json localhost:8181/v1/data/httpapi/authz/allow | jq .

#動作確認(adminユーザに付与されている権限)
curl -X POST -H 'Content-Type: text/plain' --data-binary @input.json localhost:8181/v1/data/httpapi/authz/user_permission | jq .

#動作確認(guestユーザに付与されている権限)
curl -X POST -H 'Content-Type: text/plain' --data-binary @input2.json localhost:8181/v1/data/httpapi/authz/user_permission | jq .
```
