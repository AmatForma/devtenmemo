<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <title>Inscription</title>
    </head>
    <body><div>
<h1>Inscription</h1>
        
        <div style="margin: auto; width: 40%">
            <form action = "inscription" method = "POST">
                <div class="form-group">
                    <input type="text" name="email" placeholder="email" required="" class="form-control">
                </div><div class="form-group">
                    <input type="password" name="mdp" placeholder="password" required="" class="form-control">
                </div><div class="form-group">
                    <input type="nom" name="nom" placeholder="nom" required="" class="form-control">
                </div><div class="form-group">
                    <input type="prenom" name="prenom" placeholder="prenom" required="" class="form-control">
                </div>
                <p style="color:red; text-align: center">${msg}</p>
                    <input type="submit" class="btn btn-primary btn-block">                    
            </form>
        </div>
</div>
                    
                       </body>
</html>
