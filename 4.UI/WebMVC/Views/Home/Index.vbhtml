@Code
    ViewData("Title") = "Home Page"
End Code

<div class="jumbotron">
    <h1>Universidad de Graham</h1>

</div>

<div class="row">
    <div class="col-md-4">
    
        <h2>@Html.ActionLink("Lista de alumnos", "Index", "View_ListaAlumnos")</h2>


    </div>
    <div class="col-md-4">
       
        <h2>@Html.ActionLink("Lista de Materias", "Index", "View_MateriaActiva")</h2>
    </div>
    <div class="col-md-4">
     
        <h2>@Html.ActionLink("Acumulado y Promedios", "Index", "View_ListaPromedio")</h2>
    </div>
</div>
