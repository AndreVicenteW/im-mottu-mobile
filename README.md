
# Mottu Mobile — Teste prático Flutter com PokeAPI

Etapa teste para Mottu.\
Utilizando a PokeAPI, foram criadas as 3 etapas propostas no teste.

✅ Nível 1\
✅ Nível 2\
✅ Nível 3

Os pontos extras também foram adicionados:

✅ Utilizar **GetX**\
✅ Configurar **Firebase Crashlytics**\
✅ Criar **channel nativo (Kotlin)** para detectar mudanças de conexão e exibir mensagem de status offline no app\
✅ Utilizar uma arquitetura (a escolhida foi **MVVM**)

---

## Como rodar o projeto

Intalar as dependencias do projeto

```
flutter pub get
```

Rodar o gerador de código

```
flutter pub run build_runner build
```

## Estrutura de pastas do projeto

- lib
    - core (helpers e classes de configuração do projeto)
    - data (camada de data contendo dtos, data sources e implementação dos repositories)
    - domain (camada de dominio contento entities, use cases e classes abstratas dos repositories)
    - ui (camada de ui contento toda parte visual do app e também os controllers)
