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
        
        String sql1 = "SELECT m.idmemo, m.contenue, m.datecreation, u.mail, v.mail FROM memo m INNER JOIN user u ON m.iduser = u.iduser INNER JOIN user v ON m.idusercible = v.iduser ORDER BY m.idmemo";
        String sql2 = "SELECT m.idmemo, m.contenue, m.datecreation, u.mail, null FROM memo m INNER JOIN user u ON m.iduser = u.iduser WHERE m.idusercible is null ORDER BY m.idmemo";
        Statement req = connexion.createStatement();
        
        ResultSet rs1 = req.executeQuery(sql1);
        
        
        while (rs1.next()){
            User u = new User();
            User v = new User();
            u.setMail(rs1.getString("u.mail"));
            v.setMail(rs1.getString("v.mail"));
            Memo m = new Memo(rs1.getInt("idmemo"), rs1.getString("contenue"), rs1.getDate("datecreation"), u, v);
            result.add(m);
        }
        
        ResultSet rs2 = req.executeQuery(sql2);
        while (rs2.next()){
            User u = new User();
            User v = new User();
            u.setMail(rs2.getString("mail"));
            v.setMail(rs2.getString("null"));
            Memo m = new Memo(rs2.getInt("idmemo"), rs2.getString("contenue"), rs2.getDate("datecreation"), u, v);
            result.add(m);
        }
        
        return result;
    }


    public static void insert(Memo m) throws SQLException{
        String sql = "INSERT INTO memo (contenue, iduser) VALUES(?, ?)";
        Connection connexion = testBd.getConnection();
        PreparedStatement req = connexion.prepareStatement (sql);

        req.setString(1, m.getContenue());
        req.setInt(2, m.getUser().getId());

        req.execute();
    }
    
    public static void insertAvecDestinataire(Memo m) throws SQLException{
        String sql = "INSERT INTO memo (contenue, iduser, idusercible) VALUES(?, ?, ?)";
        Connection connexion = testBd.getConnection();
        PreparedStatement req = connexion.prepareStatement (sql);

        req.setString(1, m.getContenue());
        req.setInt(2, m.getUser().getId());
        req.setInt(3, m.getDestinataire().getId());

        req.execute();
    }

}