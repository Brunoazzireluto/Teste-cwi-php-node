

Teste Técnico para a empresa Cwi onde o objetivo é criar duas instancias de microserviços, uma em Laravel (PHP) e outra em  Express (Node.js)


## Documentação

Todas as documentações estão na pasta ```Docs/```

### Diagrama ER 
![Diagrama ER](Docs/ER-userService.png)

Esse é um diagrama simples da estrutura do banco de dados. 


### Documentação de rotas

O Arquivo Rotas.md contem os detalhes das rotas e quais paramentos as rotas esperam. 


### Serviços 

    #### userService
        - Serviço feito com Laravel para ser utilizado  como ponto focal dos usuários, criação, edição, e entre outros serão todos utilizados a partir deste Serviço

    #### subscriptionService
        - Serviço em Node que irá retorar as informações de assinatura de um serviço com base no Email do usuário



## Variáveis de Ambiente

Para rodar esse projeto, você vai precisar adicionar as seguintes variáveis de ambiente no seu .env

`API_KEY`

`ANOTHER_API_KEY`



## Deploy

Para fazer o deploy desse projeto rode

```bash
  npm run deploy
```


## Documentação da API subscriptionsService


#### Status da Api

```http
  GET /api/health
```
Retorno:

```json
{
    "status": "ok"
}
```

#### Retorna uma assinatura

```http
  GET /api/subscriptions
```

| header   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `authorization`      | `string` | **Obrigatório**. a Api key do sistema |

retorno: 

```json
{
    "id": 3,
    "email": "nami@email.com",
    "plan": "Basic",
    "status": "active",
    "startedAt": "2022-01-31",
    "renewalDate": "2026-01-31",
    "paymentMethod": "credit_card"
}
```


## Ferramentas Utilizadas

![Node.js](https://img.shields.io/badge/node.js-%235FA04E?style=for-the-badge&logo=node.js&logoColor=white)

![typescript](https://img.shields.io/badge/-typescript-%233178C6?style=for-the-badge&logo=typescript&logoColor=white)

![Express](https://img.shields.io/badge/-express-%23000?style=for-the-badge&logo=express&logoColor=white)

![Mysql](https://img.shields.io/badge/mysql-%234479A1?style=for-the-badge&logo=mysql&logoColor=white)

![Laravel](https://img.shields.io/badge/laravel-%23FF2D20?style=for-the-badge&logo=laravel&logoColor=white)

![JWT](https://img.shields.io/badge/-jwt-%23000?style=for-the-badge&logo=json%20web%20tokens&logoColor=white)


## Autores

- [Bruno Alves](https://github.com/Brunoazzireluto/)

