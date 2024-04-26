package atu.Class;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class ConnectionDB {
    private static final String URL = "jdbc:mysql://localhost/atu";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static ArrayList<Map<String, Object>> getQuery(String query, Object[] parameters) {
        Connection connection = null;
        ArrayList<Map<String, Object>> results = new ArrayList<>();
        try {
            connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            // Asignar valores a los parámetros
            for (int i = 0; i < parameters.length; i++) {
                preparedStatement.setObject(i + 1, parameters[i]);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            int columnCount = resultSet.getMetaData().getColumnCount();
            
            // Process the result set
            while (resultSet.next()) {
                Map<String, Object> resultMap = new HashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = resultSet.getMetaData().getColumnLabel(i);
                    Object columnValue = resultSet.getObject(i);
                    resultMap.put(columnName, columnValue);
                }
                results.add(resultMap);
            }
               
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return results;
    }
    public static ArrayList<Map<String, Object>> getQuery(String query) {
        Connection connection = null;
        ArrayList<Map<String, Object>> results = new ArrayList<>();
        try {
            connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            ResultSet resultSet = preparedStatement.executeQuery();
            int columnCount = resultSet.getMetaData().getColumnCount();
            
            // Process the result set
            while (resultSet.next()) {
                Map<String, Object> resultMap = new HashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = resultSet.getMetaData().getColumnLabel(i);
                    Object columnValue = resultSet.getObject(i);
                    resultMap.put(columnName, columnValue);
                }
                results.add(resultMap);
            }
               
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return results;
    }
    

    public static int insertQueryParameters(String query, Object[] parameters) {
        Connection connection = null;
        int isInserted = 0;
        try {
            connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            // Asignar valores a los parámetros
            for (int i = 0; i < parameters.length; i++) {
                preparedStatement.setObject(i + 1, parameters[i]);
            }
           
            isInserted = preparedStatement.executeUpdate();
            
               
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return isInserted;
    }
    
    public static int updateInsertDeleteQuery(String query) {
        Connection connection = null;
        int filasAfectadas = 0;
        try {
            connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            filasAfectadas = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return filasAfectadas;
    }
    
    public static int UpdateDeleteQueryParameters(String query, Object[] parameters) {
        Connection connection = null;
        int rowAfecteds = 0;
        try {
            connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            
            for (int i = 0; i < parameters.length; i++) {
                statement.setObject(i + 1, parameters[i]);
            }
            
            rowAfecteds = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return rowAfecteds;
    }
    
    
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
