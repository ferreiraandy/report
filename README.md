# Projeto: Report

Pensando no usuário final, foi utilizado para este projeto um layout responsivo.

Com isso, em determinados tamanhos de tela, alguns campos foram ocultados na lista de registros.

# Acessando o projeto.

- Baixe ou faça um fork deste projeto em sua maquina local.

- Acesse a pasta do projeto (report/report).

- Dentro da pasta do projeto, rode o seguinte comando para baixar as dependencias:

``` terminal
$ bundle install
```

- Siga os passos abaixo para executar o projeto.

## Rodar projeto em uma maquina local (modo desenvolvimento)

- Crie o banco de dados rodando o seguinte comando:

``` terminal
$ rake db:migrate
```

- Após criar o banco de dados, inicie o servidor local do rails:

``` terminal
$ rails s
```

- A aplicação estará disponível na seguinte URL:

http://localhost:3000

## Rodar testes unitários

``` terminal
$ rake db:test:prepare
```

``` terminal
$ rake test
```

## Envie um feedback para:

andyferreira92@gmail.com

Obrigado.
