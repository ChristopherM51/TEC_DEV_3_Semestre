<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Tarefas</title>
    <style>
        body { font-family: Arial, sans-serif; }
        ul { list-style-type: none; padding: 0; }
        li { margin-bottom: 10px; }
    </style>
</head>
<body>
    <h1>Lista de Tarefas</h1>

    <form method="post">
        <input type="text" name="task" placeholder="Nova tarefa" required>
        <button type="submit">Adicionar Tarefa</button>
    </form>

    <h2>Tarefas</h2>
    <ul>
        <?php
        // Configuração do banco de dados
        $host = "localhost";
        $username = "seu_usuario";
        $password = "sua_senha";
        $database = "nome_do_banco";

        // Conexão com o banco de dados
        $conn = new mysqli($host, $username, $password, $database);
        if ($conn->connect_error) {
            die("Erro ao conectar ao banco de dados: " . $conn->connect_error);
        }

        // Adicionar nova tarefa
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['task'])) {
            $task = $_POST['task'];
            $status = "pendente";

            $sql = "INSERT INTO tasks (task, status) VALUES ('$task', '$status')";
            if ($conn->query($sql) === TRUE) {
                echo "<li>$task - $status</li>";
            } else {
                echo "Erro ao adicionar a tarefa: " . $conn->error;
            }
        }

        // Listar tarefas
        $sql = "SELECT * FROM tasks";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<li>{$row['task']} - {$row['status']}</li>";
            }
        } else {
            echo "<li>Nenhuma tarefa encontrada.</li>";
        }

        // Fechar conexão com o banco de dados
        $conn->close();
        ?>
    </ul>
</body>
</html>
