<%@ include file= "menu.jsp" %>

<head>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    
</head>

<form class="contenue" action="creatmemo" method="POST">
   
  <div class="form-group">
    <label for="contenueMemo">Mémo:</label>
     <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" name="priorite" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Priorité
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Minimale</a>
    <a class="dropdown-item" href="#">Basse</a>
    <a class="dropdown-item" href="#">Normale</a>
    <a class="dropdown-item" href="#">Haute</a>
    <a class="dropdown-item" href="#">Maximale</a>
  </div>
</div>
    <textarea type="text" class="form-control" name="contenue" id="contenueMemo" placeholder="Entrer le mémo"></textarea>
    <small class="form-text text-muted">S'il vous plait rentrer le contenu de votre nouveau mémo.</small>
  </div>
    
  <button type="submit" class="btn btn-primary">Ajouter</button>
</form>