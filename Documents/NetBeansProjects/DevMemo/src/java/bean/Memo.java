/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Date;

/**
 *
 * @author esic
 */
public class Memo {
    private int id;
    private String contenue;
    private Date datecreation;
    private User user;
    private User destinataire;

    public Memo(int id, String contenue, Date datecreation, User user, User destinataire) {
        this.id = id;
        this.contenue = contenue;
        this.datecreation = datecreation;
        this.user = user;
        this.destinataire = destinataire;
    }

    public User getDestinataire() {
        return destinataire;
    }

    public void setDestinataire(User destinataire) {
        this.destinataire = destinataire;
    }

    public Memo(String contenue, User user, User destinataire) {
        this.contenue = contenue;
        this.user = user;
        this.destinataire = destinataire;
    }

    public Memo(int id, String contenue, Date datecreation, User user) {
        this.id = id;
        this.contenue = contenue;
        this.datecreation = datecreation;
        this.user = user;
    }

    public Memo(String contenue, User user) {
        this.contenue = contenue;
        this.user = user;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContenue() {
        return contenue;
    }

    public void setContenue(String contenue) {
        this.contenue = contenue;
    }

    public Date getDatecreation() {
        return datecreation;
    }

    public void setDatecreation(Date datecreation) {
        this.datecreation = datecreation;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
}
