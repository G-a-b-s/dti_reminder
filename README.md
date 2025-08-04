# Sistema de Lembretes - DTI Test

Um aplicativo Flutter para criação e gerenciamento de lembretes.

## Como Executar o Sistema

### Pré-requisitos
- Flutter SDK (versão 3.0 ou superior)
- Dart SDK
- Android Studio ou VS Code com extensões Flutter
- Emulador Android ou dispositivo físico
''
### Passos para Execução
1. Clone o repositório:
   ```bash
   git clone https://github.com/G-a-b-s/dti_reminder.git
   cd dti_reminder
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:
   ```bash
   flutter run
   ```

## Premissas

- **Validação de Data**: Lembretes só podem ser criados para datas futuras
- **Agrupamento**: Lembretes são agrupados automaticamente por data
- **Ordenação**: As datas são exibidas em ordem cronológica crescente
- **Persistência**: Os dados são mantidos apenas em memória durante a execução
- **Confirmação**: Deleção de lembretes requer confirmação do usuário

## Decisões de Projeto

### Arquitetura
- **Separação de Responsabilidades**: Dividido em `models`, `screens`, `widgets` e `utils`
- **Stateful Widgets**: Uso de `setState` para gerenciamento de estado simples
- **Componentização**: Widgets reutilizáveis para formulário e listagem

### Validação
- **Centralizada**: Funções de validação isoladas em `utils/validators.dart`
- **Feedback Visual**: Mensagens de erro claras para o usuário

### Funcionalidades
- **Modal de Confirmação**: Dialog customizado para confirmar deleções
- **Agrupamento por Data**: Lembretes organizados por dia de forma automática
- **Validação em Tempo Real**: Feedback imediato sobre erros de preenchimento

## Estrutura do Projeto

```
lib/
├── models/
│   └── reminder.dart          # Modelo de dados do lembrete
├── screens/
│   └── reminder_screen.dart   # Tela principal do aplicativo
├── widgets/
│   ├── reminder_form.dart     # Formulário de criação
│   └── reminder_list.dart     # Lista de lembretes
├── utils/
│   ├── validators.dart        # Funções de validação
│   └── dialogs.dart          # Modais reutilizáveis
└── main.dart                 # Ponto de entrada do app
```

## Funcionalidades Implementadas

✅ **Criação de Lembretes**
- Campos obrigatórios: nome e data
- Validação de data futura
- Interface intuitiva com seletor de data

✅ **Listagem de Lembretes**
- Agrupados por data
- Ordenação cronológica

✅ **Deleção de Lembretes**
- Confirmação via modal
- Feedback visual claro

✅ **Validações**
- Nome obrigatório
- Data obrigatória e futura
- Mensagens de erro claras

## Tecnologias Utilizadas

- **Flutter**: Framework principal
- **Dart**: Linguagem de programação
- **Material Design**: Sistema de design
- **DateTime**: Manipulação de datas nativa
