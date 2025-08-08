# Documentação sobre como usar Nix para configurar seu ambiente IDX:
# https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Canal do nixpkgs a ser usado. "stable-23.11" é geralmente uma boa escolha,
  # mas você pode usar "unstable" para pacotes mais recentes.
  channel = "stable-23.11"; # ou "unstable"

  # Use https://search.nixos.org/packages para encontrar pacotes Nix
  packages = [
    # --- Node.js ---
    pkgs.nodejs_20              # Node.js runtime
    pkgs.nodePackages.npm       # NPM package manager
    pkgs.nodePackages.yarn      # Yarn package manager (alternativa ao npm)
    pkgs.nodePackages.nodemon   # Live reload para aplicações Node.js
    pkgs.nodePackages.pm2       # Process manager para Node.js

    # --- PHP e Laravel ---
    pkgs.php83                  # PHP 8.3 (ou use php82, php81)
    pkgs.php83Packages.composer # Composer - gerenciador de dependências PHP
    pkgs.php83Extensions.pdo    # Extensão PDO para bancos de dados
    pkgs.php83Extensions.pdo_mysql # PDO MySQL
    pkgs.php83Extensions.pdo_pgsql # PDO PostgreSQL
    pkgs.php83Extensions.mbstring   # Extensão mbstring
    pkgs.php83Extensions.xml        # Extensão XML
    pkgs.php83Extensions.curl       # Extensão cURL
    pkgs.php83Extensions.gd         # Extensão GD para imagens
    pkgs.php83Extensions.zip        # Extensão ZIP
    pkgs.php83Extensions.bcmath     # Extensão BCMath
    pkgs.php83Extensions.intl       # Extensão Intl
    pkgs.php83Extensions.redis      # Extensão Redis (opcional)

    # --- Docker ---
    pkgs.docker                 # Daemon e CLI do Docker
    pkgs.docker-compose         # Docker Compose

    # --- Ferramentas de Desenvolvimento ---
    pkgs.gnumake               # GNU Make
    pkgs.git                   # Git (se não estiver incluído por padrão)
    pkgs.curl                  # cURL para requisições HTTP
    pkgs.wget                  # Wget para downloads
    pkgs.unzip                 # Utilitário para descompactar arquivos

    # --- Bancos de Dados (Opcional - para desenvolvimento local) ---
    # pkgs.mysql80             # MySQL 8.0
    # pkgs.postgresql_15       # PostgreSQL 15
    # pkgs.redis               # Redis server

    # --- Ferramentas PHP Adicionais (Opcional) ---
    # pkgs.php83Packages.phpunit      # PHPUnit para testes
    # pkgs.php83Packages.psalm        # Analisador estático de código PHP
    # pkgs.php83Packages.phpstan      # PHPStan - analisador estático
  ];

  # Habilita o serviço Docker e adiciona o usuário 'idx' ao grupo 'docker'
  services.docker = {
    enable = true;
  };

  # Define variáveis de ambiente no workspace
  env = {
    # --- PHP/Laravel ---
    # APP_ENV = "local";
    # APP_DEBUG = "true";
    # DB_CONNECTION = "mysql";
    # DB_HOST = "127.0.0.1";
    # DB_PORT = "3306";
    
    # --- Node.js ---
    # NODE_ENV = "development";
    
    # --- Composer ---
    COMPOSER_ALLOW_SUPERUSER = "1"; # Permite rodar composer como superuser (útil em containers)
  };

  # Configurações específicas do IDX
  idx = {
    # Procure extensões em https://open-vsx.org/ e use "publisher.id"
    extensions = [
      # --- PHP/Laravel ---
      "bmewburn.vscode-intelephense-client"  # IntelliSense para PHP
      "onecentlin.laravel-blade"             # Sintaxe Blade do Laravel
      "ryannaddy.laravel-artisan"            # Comandos Artisan do Laravel
      "codingyu.laravel-goto-view"           # Navegação rápida para views

      # --- Node.js ---
      "ms-vscode.vscode-typescript-next"     # TypeScript/JavaScript
      "christian-kohler.npm-intellisense"    # IntelliSense para NPM
      "ms-vscode.vscode-eslint"              # ESLint

      # --- Docker ---
      "ms-azuretools.vscode-docker"          # Extensão Docker da Microsoft

      # --- Geral ---
      "ms-vscode.vscode-json"                # JSON
      "redhat.vscode-yaml"                   # YAML
      "ms-vscode.live-server"                # Live Server
      
      # --- Úteis ---
      "usernamehw.errorlens"                 # Destaca erros inline
      "bradlc.vscode-tailwindcss"            # TailwindCSS IntelliSense
    ];

    # Habilita e configura pré-visualizações (previews) no IDX
    previews = {
      enable = true;
      previews = {
        # Laravel Development Server
        laravel-dev = {
          command = ["php" "artisan" "serve" "--host=0.0.0.0" "--port=$PORT"];
          manager = "web";
          env = {
            PORT = "$PORT";
            APP_ENV = "local";
            APP_DEBUG = "true";
          };
        };

        # Node.js/Express Server
        # node-server = {
        #   command = ["npm" "start"];
        #   manager = "web";
        #   env = {
        #     PORT = "$PORT";
        #     NODE_ENV = "development";
        #   };
        # };

        # Para aplicações com Vite (React/Vue)
        # vite-dev = {
        #   command = ["npm" "run" "dev" "--" "--host" "0.0.0.0" "--port" "$PORT"];
        #   manager = "web";
        #   env = {
        #     PORT = "$PORT";
        #   };
        # };
      };
    };

    # Ganchos (hooks) do ciclo de vida do workspace
    workspace = {
      # Executa quando um workspace é criado pela primeira vez
      onCreate = {
        # Instalar dependências Node.js
        npm-install = "npm install";

        # Instalar dependências PHP com Composer
        composer-install = "composer install";

        # Copiar arquivo de ambiente Laravel (se existir)
        # copy-env = "cp .env.example .env";

        # Gerar chave da aplicação Laravel
        # generate-key = "php artisan key:generate";

        # Abre arquivos específicos por padrão
        default.openFiles = [
          ".idx/dev.nix"
          "README.md"
          "package.json"          # Node.js
          "composer.json"         # PHP
          ".env.example"          # Laravel
          "routes/web.php"        # Laravel routes
          "docker-compose.yml"    # Docker Compose
          "Dockerfile"            # Dockerfile
          "artisan"              # Laravel Artisan
        ];
      };

      # Executa sempre que o workspace é (re)iniciado
      onStart = {
        # Mensagem de boas-vindas
        welcome = ''
          echo "🚀 Ambiente Node.js + PHP/Laravel + Docker pronto!"
          echo "📦 Node.js: $(node --version)"
          echo "🐘 PHP: $(php --version | head -1)"
          echo "🎼 Composer: $(composer --version)"
          echo "🐳 Docker: $(docker --version)"
          echo ""
          echo "Comandos úteis:"
          echo "  • npm run dev          - Iniciar servidor Node.js"
          echo "  • php artisan serve    - Iniciar servidor Laravel"
          echo "  • php artisan migrate  - Rodar migrações"
          echo "  • composer install     - Instalar deps PHP"
          echo "  • docker-compose up    - Subir containers"
        '';
      };
    };
  };
}