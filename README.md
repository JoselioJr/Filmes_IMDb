# Filmes IMDb

App Flutter para busca de filmes usando a API do IMDb com sistema de autenticação e favoritos.

## Funcionalidades

- **Autenticação de Usuário**: Login e cadastro com persistência local usando Hive
- **Busca de Filmes**: Integração com API pública do IMDb
- **Sistema de Favoritos**: Marcar/desmarcar filmes como favoritos com feedback visual
- **Detalhes do Filme**: Tela completa com informações detalhadas ao clicar no filme
- **Perfil do Usuário**: Tela de perfil com informações do usuário
- **Tema Escuro/Claro**: Alternância entre temas com persistência
- **Gerenciamento de Estado**: Implementado com GetX
- **Persistência Local**: Dados armazenados com Hive

## Telas

1. **Tela de Login**: Autenticação do usuário
2. **Tela de Cadastro**: Registro de novos usuários
3. **Tela Principal**: Busca e listagem de filmes
4. **Tela de Detalhes**: Informações completas do filme selecionado
5. **Tela de Favoritos**: Visualização dos filmes favoritos
6. **Tela de Perfil**: Informações do usuário e configurações de tema

## Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento
- **GetX**: Gerenciamento de estado e navegação
- **Hive**: Banco de dados local NoSQL
- **HTTP**: Requisições para API
- **API**: https://imdb.iamidiotareyoutoo.com

## Como Executar

1. Clone o repositório
2. Navegue até a pasta `filmes_imdb`
3. Execute `flutter pub get` para instalar as dependências
4. Execute `flutter packages pub run build_runner build` para gerar os arquivos do Hive
5. Execute `flutter run` para iniciar o app

## Estrutura do Projeto

```
lib/
├── controllers/          # Controllers GetX
│   ├── auth_controller.dart
│   ├── movie_controller.dart
│   └── theme_controller.dart
├── models/              # Modelos de dados
│   ├── user_model.dart
│   └── film_model.dart
├── screens/             # Telas do app
│   ├── login_screen.dart
│   ├── cadaster_screen.dart
│   ├── main_screen.dart
│   ├── movie_detail_screen.dart
│   ├── favorite_screen.dart
│   └── user_screen.dart
├── services/            # Serviços
│   ├── api_service.dart
│   └── hive_service.dart
├── widgets/             # Widgets reutilizáveis
│   └── movie_card.dart
└── main.dart           # Ponto de entrada
```

## Funcionalidades Implementadas

✅ Sistema de autenticação local
✅ Cadastro de usuários
✅ Busca de filmes via API
✅ Sistema de favoritos com feedback visual
✅ Tela de detalhes do filme com navegação
✅ Tela de perfil do usuário
✅ Tema escuro/claro com persistência
✅ Persistência de dados
✅ Interface responsiva
✅ Gerenciamento de estado com GetX