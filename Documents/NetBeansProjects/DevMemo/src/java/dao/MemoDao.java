/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import bean.Memo;
import bean.User;
import java.sql.*;
import java.util.*;
/**
 *
 * @author esic
 */
public class MemoDao {
    public static List<Memo> getAll() throws SQLException{
        List<Memo> result = new ArrayList();
        
        Connection connexion = testBd.getConnection();
        
        String sql = "SELECT m.idmemo, m.priorite, m.contenue, m.datecreation, u.mail FROM memo m INNER JOIN user u ON m.iduser = u.iduser ORDER BY m.idmemo";
        
        Statement req = connexion.createStatement();
        
        ResultSet rs = req.executeQuery(sql);
        
        while (rs.next()){
            User u = new User();
            u.setMail(rs.getString("mail"));
            Memo m = new Memo(rs.getInt("idmemo"), rs.getString("priorite"),  rs.getString("contenue"), rs.getDate("datecreation"), u);
            result.add(m);
        }
        return result;
    }


    public static void insert(Memo m) throws SQLException{
        String sql = "INSERT INTO memo (priorite, contenue, iduser) VALUES(?, ?, ?)";
        Connection connexion = testBd.getConnection();
        PreparedStatement req = connexion.prepareStatement (sql);
        req.setString(1, m.getPriorite());
        req.setString(2, m.getContenue());
        req.setInt(3, m.getUser().getId());

        req.execute();
    }

    // ajout de liste de MemoByUser 
        public static List<Memo> getAllMemoByUser(User us) throws SQLException{
        String sql = "SELECT m.idmemo, m.contenue, m.datecreation, u.mail FROM memo m INNER JOIN user u ON m.iduser = u.iduser WHERE u.mail =?";

        List<Memo> result = new ArrayList();
        
        Connection connexion = testBd.getConnection();
        PreparedStatement req = connexion.prepareStatement(sql);
        req.setString(1, us.getMail());
        req.execute();
        
        ResultSet rs = req.executeQuery();
        
        while (rs.next()){
            User u = new User();
            u.setMail(rs.getString("mail"));
            Memo m = new Memo(rs.getInt("idmemo"), rs.getString("contenue"), rs.getDate("datecreation"), u);
            result.add(m);
        }
        return result;
    }

}
