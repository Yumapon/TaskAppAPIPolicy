#今回のOPA利用フローはOption 2: Overload inputで提示されているケースを想定
#参考：https://www.openpolicyagent.org/docs/latest/external-data/
package httpapi.authz

permission["admin"] = [
    { "actions": ["read", "write"] }
]
permission["guest"] = [
    { "actions": ["read"]}
]

#どの権限で何ができるのか確認する
user_permission = perm {
    perm := permission[input.user]
}

#APIを呼び出す際の権限チェック用
default allow = false

allow {
    permission[input.user][i].actions[_] == input.action
}	