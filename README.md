```bash
$ make run/server
```

```bash
$ curl -d '{"instances": ["I love pizza", "I hate rainy days"]}' -XPOST http://127.0.0.1:8000/extract-sentiment

[{"label":"POSITIVE","score":0.9997533559799194},{"label":"NEGATIVE","score":0.9895156025886536}]
```