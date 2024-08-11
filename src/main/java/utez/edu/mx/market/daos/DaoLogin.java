package utez.edu.mx.market.daos;

import utez.edu.mx.market.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoLogin {
    private Connection con;
    private PreparedStatement pstm;
    private ResultSet rs;
    private final DBConnection DB_CONNECTION = new DBConnection();
    private String [] QUERIES ={
            "SELECT * FROM user WHERE password = ? AND (username = ? OR email =?);",
    };

    public boolean findUserByUsernameAndPassword(String username, String password) {
        try{
            con = DB_CONNECTION.getConnection();
            pstm = con.prepareStatement(QUERIES[0]);
            pstm.setString(1, password);
            pstm.setString(2, username);
            pstm.setString(3, username);
            rs = pstm.executeQuery();
            return rs.next();
        } catch (SQLException e){
            e.printStackTrace();
            return false;
        } finally {
            CloseConnection();
        }
    };

    public void CloseConnection() {
        try{
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
}
