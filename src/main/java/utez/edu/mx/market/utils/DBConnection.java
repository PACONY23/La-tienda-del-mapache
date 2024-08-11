package utez.edu.mx.market.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/market", "root", "root");
        } catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
