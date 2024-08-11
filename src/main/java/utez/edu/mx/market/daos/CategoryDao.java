package utez.edu.mx.market.daos;

import utez.edu.mx.market.entities.Category;
import utez.edu.mx.market.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    private final DBConnection DB_CONNECTION = new DBConnection();
    private Connection con;
    private PreparedStatement pstm;
    private ResultSet rs;
    private final String [] QUERIES = {
            "SELECT * FROM category;",
            "SELECT * FROM category WHERE id =?",
    };

    public List<Category> findAllCategories() {
        List<Category> list = new ArrayList<>();
        try{
            con = DB_CONNECTION.getConnection();
            pstm = con.prepareStatement(QUERIES[0]);
            rs = pstm.executeQuery();
            while(rs.next()){
                Category category = new Category(
                        rs.getInt("id"),
                        rs.getString("name")
                );
                list.add(category);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            closeConnection();
        }
        return list;
    };

    public Category findCategory(int id) {
        Category found = null;
        try{
            con = DB_CONNECTION.getConnection();
            pstm = con.prepareStatement(QUERIES[1]);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            if(rs.next()){
                found = new Category(
                        rs.getInt("id"),
                        rs.getString("name")
                );
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return found;
    };

    private void closeConnection(){
        try{
            if(con != null){
                con.close();
            }
            if(pstm != null){
                pstm.close();
            }
            if(rs != null){
                rs.close();
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
