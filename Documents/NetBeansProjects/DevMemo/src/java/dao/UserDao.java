/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Memo;
import bean.User;
import java.sql.Connection;
import java.sql.*;

/**
 *
 * @author esic
 */
public class UserDao {
    public static User getByLoginPass(String login, String mdp)
    throws SQLException{
        User result = null;
        String sql="SELECT * FROM user WHERE mail=? AND mdp=?";
        Connection connexion = testBd.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql);
        requette.setString(1, login);
        requette.setString(2, mdp);
        
        ResultSet rs = requette.executeQuery();
        
        if (rs.next()){
            result = new User(rs.getInt("iduser"),
            rs.getString("nom"),
            rs.getString("prenom"),
            rs.getString("mail"));
        }
        
        return result;
    }
    
    public static void insert(User u) throws SQLException{
        String sql = "INSERT INTO user (nom, prenom, mail, mdp) VALUES(?, ?, ?, ?)";
        Connection connexion = testBd.getConnection();
        PreparedStatement req = connexion.prepareStatement (sql);

        req.setString(1, u.getNom());
        req.setString(2, u.getPrenom());
        req.setString(3, u.getMail());
        req.setString(4, u.getMdp());

        req.execute();
    }
    
}
