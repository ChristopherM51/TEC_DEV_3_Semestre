<?php
$servername = "127.0.0.1";
$username = "root";
$password = ''; // Substitua com sua senha
$dbname = "TODOLIST";

// Cria a conexão
$conexao = new mysqli($servername, $username, $password,$dbname);

// Verifica a conexão
if ($conexao->connect_error) {
    die("Conexão falhou: " . $conexao->connect_error);
}

// Cria a tabela de Tarefas
$sql_produtos = "CREATE TABLE TODOLIST (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tarefa VARCHAR(255) NOT NULL,
    descricao TEXT,
    creado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Em andamento', 'Concluída', 'Pendente') DEFAULT 'Pendente',
    priority ENUM('Baixa', 'Média', 'Alta') DEFAULT 'Média',
    responsavel VARCHAR(100),
    concluido_em DATETIME
)";

if ($conexao->query($sql_produtos) === TRUE) {
    echo "Tabela produtos criada com sucesso";
} else {
    echo "Erro ao criar tabela produtos: " . $conexao->error;
}

// Fecha a conexão
$conexao->close();
