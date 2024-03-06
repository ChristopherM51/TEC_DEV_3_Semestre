<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Tarefas</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th,
        td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        form {
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
    <h1>Lista de Tarefas</h1>

    <form method="post">
        <table>
            <tr>
                <th>Tarefa</th>
                <th>Descrição</th>
                <th>Status</th>
                <th>Prioridade</th>
                <th>Responsável</th>
                <th>Ação</th>
            </tr>
            <tr>
                <td><input type="text" name="tarefa"></td>
                <td><input type="text" name="descricao"></td>
                <td>
                    <select name="status">
                        <option value="Em andamento">Em andamento</option>
                        <option value="Concluída">Concluída</option>
                        <option value="Pendente">Pendente</option>
                    </select>
                </td>
                <td>
                    <select name="prioridade">
                        <option value="Baixa">Baixa</option>
                        <option value="Média">Média</option>
                        <option value="Alta">Alta</option>
                    </select>
                </td>
                <td><input type="text" name="responsavel"></td>
                <td><button type="submit" name="submitAdd">Adicionar</button></td>
            </tr>
        </table>
    </form>

    <!-- Filtro de tarefas -->
    <form method="get">
        <label for="filtro">Filtrar por:</label>
        <select id="filtro" name="filter" onchange="this.form.submit()">
            <option value="all">Todas</option>
            <option value="pending">Pendentes</option>
            <option value="completed">Concluídas</option>
            <option value="in_progress">Em andamento</option>
        </select>
    </form>

    <table>
        <tr>
            <th>Tarefa</th>
            <th>Descrição</th>
            <th>Status</th>
            <th>Prioridade</th>
            <th>Responsável</th>
            <th>Ação</th>
        </tr>
        <?php
        // Configuração do banco de dados
        $servername = "127.0.0.1";
        $username = "root";
        $password = '';
        $dbname = "TODOLIST";

        // Conexão com o banco de dados
        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Erro ao conectar ao banco de dados: " . $conn->connect_error);
        }

        // Filtro selecionado
        $filter = $_GET['filter'] ?? 'all';

        // Consulta SQL baseada no filtro selecionado
        $sql = "SELECT * FROM TODOLIST";
        if ($filter == 'pending') {
            $sql .= " WHERE status = 'Pendente'";
        } elseif ($filter == 'completed') {
            $sql .= " WHERE status = 'Concluída'";
        } elseif ($filter == 'in_progress') {
            $sql .= " WHERE status = 'Em andamento'";
        }

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row['tarefa'] . "</td>";
                echo "<td>" . $row['descricao'] . "</td>";
                echo "<td>" . $row['status'] . "</td>";
                echo "<td>" . $row['priority'] . "</td>";
                echo "<td>" . $row['responsavel'] . "</td>";
                echo "<td>
                        <a class='edit-button' href='editar_tarefa.php?id=" . $row['id'] . "'>Editar</a>
                        <a class='delete-button' href='?delete=" . $row['id'] . "' onclick='return confirm(\"Tem certeza que deseja excluir esta tarefa?\")'>Excluir</a>
                      </td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='6'>Nenhuma tarefa encontrada.</td></tr>";
        }

        // Fecha a conexão com o banco de dados
        $conn->close();
        ?>
    </table>

    <?php
    // Verifica se o botão de exclusão foi clicado
    if (isset($_GET['delete'])) {
        // Configuração do banco de dados
        $servername = "127.0.0.1";
        $username = "root";
        $password = '';
        $dbname = "TODOLIST";

        // Conexão com o banco de dados
        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Erro ao conectar ao banco de dados: " . $conn->connect_error);
        }

        // Obtém o ID da tarefa a ser excluída
        $id = $_GET['delete'];

        // Exclui a tarefa do banco de dados
        $sql = "DELETE FROM TODOLIST WHERE id='$id'";
        if ($conn->query($sql) === TRUE) {
            echo "<script>alert('Tarefa excluída com sucesso!');</script>";
        } else {
            echo "<script>alert('Erro ao excluir a tarefa: " . $conn->error . "');</script>";
        }

        // Fecha a conexão com o banco de dados
        $conn->close();
    }
    ?>

</body>

</html>
