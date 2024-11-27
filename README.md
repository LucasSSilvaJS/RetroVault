**Documentação do Aplicativo Retro Vault**

**Introdução**

O Retro Vault é uma plataforma especializada na venda de produtos antigos e vintage, oferecendo  uma experiência única para colecionadores e entusiastas de itens retro e nostálgicos. O objetivo do  aplicativo é facilitar o acesso a itens raros e nostálgicos, conectando colecionadores a produtos  vintage cuidadosamente selecionados, em uma experiência personalizada e segura.

**Instalação e Configuração**

**Requisitos do Sistema**

- Flutter SDK versão 3.10.5    Android Studio ou Visual Studio Code

**Passos para Instalação**

1\. Clone o repositório: git clone  https://github.com/LucasSSilvaJS/RetroVault  2. Navegue até o diretório do projeto: cd RetroVault  3. Instale as dependências: flutter pub get

**Arquitetura do Aplicativo**

**Descrição da Arquitetura**

O aplicativo segue a arquitetura MVVM (Model-View-ViewModel) para separar a lógica de negócios  da interface do usuário, garantindo um código mais organizado e fácil de manter.

**Funcionalidades**

**Catálogo de Produtos**

- Exibição de produtos vintage, como discos de vinil raros, quadrinhos clássicos, consoles  de videogame antigos, etc.
- Filtros e categorias para facilitar a busca.

**Detalhes do Produto**

      Descrição   detalhada do produto.  Imagens de alta qualidade.  Informações sobre o vendedor.

**Carrinho de Compras**

    Adição e remoção de produtos.  Visualização do resumo do pedido.

**Pagamento Seguro**

    Integração com gateways de pagamento.  Opções de pagamento variadas.

**Perfil do Usuário**

    Gerenciamento de informações pessoais.  Histórico de compras.

**Interface do Usuário**

**Tela Inicial**

A tela inicial apresenta uma seleção de produtos em destaque e categorias populares.

**Tela de Detalhes do Produto**

Descrição detalhada do produto, com imagens e informações adicionais.

**Tela do Carrinho de Compras**

Resumo dos itens adicionados ao carrinho, com opções para finalizar a compra ou continuar  comprando. **Tela de Comunidade**

Com intuito de recolher feedbacks para melhoramento gradual do aplicativo, tentando atender todas  as necessidades.

**Gerenciamento de Estado**

Utilizamos o Provider para gerenciar o estado do aplicativo, garantindo uma atualização eficiente da  interface do usuário conforme as mudanças de estado ocorrem.

**Testes**

**Testes Unitários**

- Testes para verificar a lógica de negócios.
  - Exemplo: Verificar se o cálculo do preço total no carrinho está correto.  Exemplos de casos de teste.

 

**Testes de Integração**

- Testes para garantir a integração correta entre diferentes partes do aplicativo.
  - Exemplo: Verificar se a adição de um produto ao carrinho atualiza  corretamente a interface do usuário.
- Exemplos de casos de teste.

**Deploy**

**Android**

1\. Configure o arquivo android/app/build.gradle com as informações do seu  aplicativo.

Exemplo de configuração:  android {  ...  defaultConfig {  applicationId "com.lucasssilvajs.retrovault"  minSdkVersion 21  targetSdkVersion 30  versionCode 1  versionName "1.0"  }  ...  }

   2. Execute flutter build apk para gerar o APK.

**iOS**

1\. Configure o arquivo ios/Runner.xcodeproj com as informações do seu aplicativo.

Exemplo de configuração:  <key>CFBundleIdentifier</key>  <string>"com.lucasssilvajs.retrovault"</string>

   2. Execute flutter build ios para gerar o build.

**Manutenção e Atualizações**

Para atualizar o aplicativo, siga as melhores práticas de versionamento e mantenha a  documentação atualizada com as mudanças realizadas.

**Referências**

- Documentação Oficial do Flutter
