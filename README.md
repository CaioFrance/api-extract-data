# Api de dados extraídos

## Requisitos
    
- <a>Ruby 3.0.0</a> 
- <a>Rails</a>
- <a>Bundler</a>

## Sobre o projeto

<p>
    Esta API foi construída para mostrar os dados extraídos da API 
    <a href="http://challenge.dienekes.com.br/api/numbers?page=1">http://challenge.dienekes.com.br/api/numbers?page=1</a>.
    <br>
    Está API mostra todos os dados de forma paginada (a mesma quantidade de páginas da API que foi consumida).
    Este projeto só mostra os dados, a forma de extração foi feita por um <a href="">Script</a> que eu mesmo criei.
</p>

## Configuração do Ambiente

<p>
    Pois bem, vamos fazer esse projeto rodar na sua máquina, primeiramente é necessário que você atenda a todos os
    requisitos. Para começar vamos instalar as dependências do do projeto executando o comando abaixo.
</p>

```
    bundler install
```

<p>
    Após ter executado esse comando, vamos executar outro comando para setar as variáveis de ambiente.
</p>

```
    bundler exec figaro install
```

<p>
    Esse comando irá criar um arquivo <strong>aplication.yml"</strong> dentro da pasta <strong>./config"</strong>
    , nele será onde vamos colocar as variáveis ambiente do projeto, você
    pode seguir a seguinte estrutura para preencher o arquivo.
</p>

```
    db_password: 'sua senha do banco de dados'
    db_host: 'localhost'
    db_port: '5432'
```

## Banco de Dados
<p>
    Após ter feito todas as etapas anteriores, vamos criar o banco de dados utilizando um comando do rails e rodar as
    migrações para criar as tabelas.
</p>

```
    ./bin/rails db:create db:migrate
```

<p>
    Como eu disse antes, utilizei um script para extrair os dados da API e após a extração
    exportei todos os dados para um arquivo .csv que está disponível no caminho <strong>./public/static</strong>. <br>
    Após ter criado o banco de dados e executado as migrações, vamos ler esse arquivo .csv e salvar todos os dados no 
    seu banco local, basta executar a task para importar os dados.
</p>

```
   ./bin/rails import_data:import 
```

## Iniciando Aplicação

<p>
    Agora você está pronto para executar a aplicação, rode o comando de inicialização do rails e veja todos os dados de
    forma paginada (10000 páginas).
</p>

```
    ./bin/rails s
```

<p>
    Se você quiser expor em número de porta específica do seu computador basta acrescentar o argumento <strong>-p</strong>
    e passar o número da porta.
</p>

## Agradecimentos

<p>Foi um baita desafio, quero agradecer a todos que leram até aqui e a oportunidade de resolver esse desafio, Obrigado! :).</p>