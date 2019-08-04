## Instalação

Clone o repositório

    clone git

Mudar para a pasta repo

    cd cloudcamp-backend

Instale todas as dependências usando o compositor

    composer install

Copie o arquivo env de exemplo e faça as alterações de configuração necessárias no arquivo .env

    cp .env.example .env

Gerar uma nova chave de aplicativo

     php artisan key:generate

Gere uma nova chave secreta de autenticação JWT

    php artisan jwt:generate

Execute as migrações do banco de dados (** Defina a conexão do banco de dados em .env antes de migrar **)

    php artisan migrate
