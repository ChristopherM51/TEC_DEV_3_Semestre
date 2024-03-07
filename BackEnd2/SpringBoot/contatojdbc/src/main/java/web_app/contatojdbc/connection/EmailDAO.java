package web_app.contatojdbc.connection;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmailDAO {
    // Atributos
    private Connection connection;
    // Construtor
    public EmailDAO(){
        this.connection = ConnectionFactory.getConnection();
    }
    // Criar Tabela
    public void criarTabela(){
        String sql = " CREATE TABLE IF NOT EXISTS NEWSLETTER_SPRING (ID SERIAL PRIMARY KEY, EMAIL VARCHAR(255))";
        try (Statement stmt = this.connection.createStatement()) {
            stmt.execute(sql);
            System.out.println("Tabela criada com sucesso.");
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao criar a tabela: " + e.getMessage(), e);
        } finally {
            ConnectionFactory.closeConnection(this.connection);
        }

        }
        public void cadastrar(String email) {
        PreparedStatement stmt = null;
        // Define a instrução SQL parametrizada para cadastrar na tabela
        String sql = "INSERT INTO newsletter_spring (email) VALUES (?)";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.executeUpdate();
            System.out.println("Dados inseridos com sucesso");
           
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao inserir dados no banco de dados.", e);
        } finally {
            ConnectionFactory.closeConnection(connection,stmt);
        }
    }
    }
    