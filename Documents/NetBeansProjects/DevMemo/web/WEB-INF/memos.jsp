<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">
          <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
          
          <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
          <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
          <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file= "menu.jsp" %>


<div class="contenue">
    <h2>Vous �tes sur la page des m�mos</h2>
    <h4>Bonjour ${pers.prenom} ${pers.nom}</h4>
    
    <table id="example" class="table table-dark table-striped table-bordered" style="width:100%">
        <thead class="thead-light">
            <tr>
                <th>Id</th>
                <th>Priorit� du message</th>
                <th>Contenue</th>
                <th>Date cr�ation</th>
                <th>mail du cr�ateur</th>
                <th>mail du destinataire</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${memos}" var="memo">
                <tr>
                    <td>${memo.id}</td>
                    <td>${memo.priorite}</td>
                    <td>${memo.contenue}</td>
                    <td>${memo.datecreation}</td>
                    <td>${memo.user.mail}</td>
                    <td>${memo.destinataire.mail}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
