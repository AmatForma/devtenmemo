<%@ include file= "menu.jsp" %>

<form class="contenue" action="creatmemo" method="POST">
  <div class="form-group">
    <label for="contenueMemo">M�mo:</label>
    <textarea type="text" class="form-control" name="contenue" id="contenueMemo" placeholder="Entrer le m�mo"></textarea>
    <small class="form-text text-muted">S'il vous plait rentrer le contenu de votre nouveau m�mo.</small>
  </div>
  <button type="submit" class="btn btn-primary">Ajouter</button>
</form>