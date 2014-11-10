<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Author     : Mario Torrez
--%>

<%@page import="com.emergentes.modelo.Tarea"%>
<%@page import="com.emergentes.modelo.GestorTareas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - Tareas</title>
    </head>
    <body>
        <%
            if (session.getAttribute("agenda") == null){
                GestorTareas objeto1 = new GestorTareas();
                
                objeto1.insertarTarea(new Tarea(1, "Reunion con estudiantes de la carrera", "Alta"));
                objeto1.insertarTarea(new Tarea(2, "Estudiar para el examen de estadística", "Alta"));
                objeto1.insertarTarea(new Tarea(3, "Partido de futsal","Baja"));
                
                session.setAttribute("agenda", objeto1);
            }
        %>
        <h1>Lista de tareas</h1>
        <a href="Controller?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Tarea</th>
                <th>Prioridad</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
             <tr>
                <td>${item.id}</td>
                <td>${item.tarea}</td>
                <td>${item.prioridad}</td>
                <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a> </td>
            </tr>               
            </c:forEach> 
        </table>
            
    </body>
</html>
