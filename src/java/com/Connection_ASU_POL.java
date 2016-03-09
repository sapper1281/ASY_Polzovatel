/*
 * Connection_ASU_POL.java
 *
 */

package com;

/**
 *
 * @author  apopovkin
 */

import javax.sql.DataSource;
import java.sql.*;
import javax.naming.*;

/**
 *
 * @author apopovkin
 */
public class Connection_ASU_POL {


 Object lock = new Object(); 

   

    public Connection getConnection() throws Exception {
        synchronized(lock)
       {

 Context    initContext   = null;
 Context    envContext    = null;
 DataSource dataSource    = null;
 Connection conn    = null;
 ResultSet  resultSet     = null;
 ResultSet  resultSet1     = null;
 Statement  statement0     = null;
 Statement  statement1     = null;



 try {


 initContext = new InitialContext();
          dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/dbASY_Polzovatel");


  if (dataSource != null) {
                conn = dataSource.getConnection();}





            // Устанавливаем уровень изоляции транзакции
            conn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);

            // Устанавливаем управление транзакцией вручную
            conn.setAutoCommit(false);
          
            return conn;
        } catch (Exception e) {
            System.err.println("Could not locate datasource!  Reason:");
            e.printStackTrace();
            throw e;
        } }
    }

    /*
     *  возвращаем Connection обратно в пул JDBC соединений
     */
    public void closeConnection(Connection conn) {
      synchronized(lock)
       {   if (conn != null) {
            try {
                conn.commit();
                conn.close();
               
            } catch (SQLException e) {
                System.err.println("Could not close DataBase connection! Reason:");
                e.printStackTrace();
            }
        }
    }}


}
