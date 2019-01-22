<%@ include file= "menu.jsp" %>

<head>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    
</head>

<form class="contenue" action="creatmemo" method="POST">
   
  <div class="form-group">
    <label for="contenueMemo">M�mo:</label>
     <div class="dropdown">
  
</div>
    <textarea type="text" class="form-control" name="contenue" id="contenueMemo" placeholder="Entrer le m�mo"></textarea>
    <small class="form-text text-muted">S'il vous plait rentrer le contenu de votre nouveau m�mo.</small>
    
   
 <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Niveau de priorit� du m�mo</label>
     <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
    <option selected>Choisir...</option>
    <option value="1">Minimale</option>
    <option value="2">Basse</option>
    <option value="3">Normale</option>
    <option value="4">Haute</option>
    <option value="5">Maximale</option>
  </select>
  </div>
    
  <button type="submit" class="btn btn-primary">Ajouter</button>
</form>