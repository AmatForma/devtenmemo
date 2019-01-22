<%@ include file= "menu.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head><script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script></head>
<form class="contenue" action="creatmemo" method="POST">
   
  <div class="form-group">
    <label for="contenueMemo">Mémo:</label>
     <div class="dropdown">
  
</div>
    <textarea type="text" class="form-control" name="contenue" id="contenueMemo" placeholder="Entrer le mémo"></textarea>
    <small class="form-text text-muted">S'il vous plait rentrer le contenu de votre nouveau mémo.</small>
    
   
 <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Niveau de priorité du mémo</label>
     <select name="priorite" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
    <option selected>Choisir...</option>
    <option value="Minimale">Minimale</option>
    <option value="Basse">Basse</option>
    <option value="Normale">Normale</option>
    <option value="Haute">Haute</option>
    <option value="Maximale">Maximale</option>
  </select>
  </div>
  <div class="dropdown" style="margin-bottom: 15px">
      <label for="exampleFormControlSelect1">Destinataire</label>
    <select name="desti" class="form-control" id="selectdestinataire">
      <option value="destinatairenull">personne</option>
      <c:forEach items="${destinataire}" var="destinataire">
        <option value="${destinataire.id}" href="#">${destinataire.mail}</option>
      </c:forEach>
    </select>
  </div>
    
  <button type="submit" class="btn btn-primary">Ajouter</button>
</form>
