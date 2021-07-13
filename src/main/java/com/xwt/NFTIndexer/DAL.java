package com.xwt.NFTIndexer;

import java.sql.*;

public class DAL {
    //private Logger logger = Logger.getLogger(DAL.class.getName());
    private final String userName = System.getenv("dbUsername");
    private final String password = System.getenv("dbPassword");
    private final String endpoint = System.getenv("dbEndpoint");

    private Connection getConnection() throws SQLException, SQLException {
        DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
        Connection connection = DriverManager.getConnection(endpoint, userName, password);
        return connection;
    }

    public ResultSet getData() throws SQLException {
        Connection connection = getConnection();
        String SQLQuery = "SELECT * FROM indexer.caIndexed ORDER BY indexer.caIndexed.id DESC;";
        PreparedStatement stmt = connection.prepareStatement(SQLQuery);
        return stmt.executeQuery();
    }
}
