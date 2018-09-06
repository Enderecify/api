### API enderecify.com

Use este repositório para requisitar funcionalidades, informar bugs ou apenas dar um oi.

### Como acessar a API

Bem simples, é só mandar um POST pra https://enderecify.com/ contendo um param `query` com a consulta a ser feita.

```sh
$ curl https://enderecify.com -X POST -d "query={ regioes { nome } }"
```

Mais em http://enderecify.com/api

### JavaScript libs que você pode usar

Pode ser o próprio comando `fetch` do próprio JS.

Libs, eu recomendo as diversas versões do Apollo: https://github.com/apollographql

### Você também pode contribuir

1. Clone repo.
2. 
```sh
$ mix deps.get
$ mix phx.server
```
3. Have fun.

### Using this package

```ex
# mix.exs
{:enderecify_api,  "~> 1.0"}
```


```ex
# config/config.exs
config :enderecify_api,
  repo: MyApp.Repo
```

```
$ mix deps.get
```

