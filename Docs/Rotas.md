## subscriptionService

O serviço de assinaturas tem duas rotas principais, uma verifica o estado do serviço (se ele está no ar) e a outra busca uma assinatura  com base no email enviado 

### Status da Api

```http
  GET /api/health
```
Retorno:

```json
{
    "status": "ok"
}
```

---

### Retorna uma assinatura

```http
  GET /api/subscriptions/:email
```

Retorno: 

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

---

## userService
Esse serviço consiste em um crud básico de usuários, uma rota health para verificar o estado do serviço e uma rota de assinatura.

### Status da Api

```http
  GET /api/health
```
Retorno:

```json
{
    "status": "ok"
}
```

---

### Retorna uma lista de usuários

```http
  GET /api/users
```
Retorno:

```json
[
    {
        "id": 1,
        "name": "luffy",
        "email": "luffy@email.com",
        "created_at": "2025-08-08T02:09:54.000000Z",
        "updated_at": "2025-08-08T02:09:54.000000Z"
    },
    {
        "id": 2,
        "name": "zoro",
        "email": "zoro@email.com",
        "created_at": "2025-08-08T02:09:54.000000Z",
        "updated_at": "2025-08-08T02:09:54.000000Z"
    }
]
```

### Cria um novo Usuário

```http
  POST /api/users
```

body:

```json
{
  "name": "João Silva",
  "email": "joao@example.com",
  "password": "minhasenha123"
}
```


### Atualiza um Usuário

```http
  PUT /api/users/:id
```

body:

```json
{
  "name": "Nami",
  "email": "nami@email.com",
  "password": "N123"
}
```

### Busca um Usuário

```http
  GET /api/users/:id
```

Retorno:

```json
{
    "id": 1,
    "name": "luffy",
    "email": "luffy@email.com",
    "created_at": "2025-08-08T02:09:54.000000Z",
    "updated_at": "2025-08-08T02:09:54.000000Z"
}
```

### Deleta um Usuário

```http
  DELETE /api/users/:id
```

Retorno:

```json
{
    "message": "User deleted successfully"
}
```

---

### Retorna uma assinatura

```http
  GET /api/external/:email
```

Retorno:

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
