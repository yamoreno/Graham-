@ModelType WebMVC.WebMVC.P_Alumno
@Code
    ViewData("Title") = "Details"
End Code

<h2>Detalle de Alumnos</h2>

<div>
 
    <hr />
    <dl class="dl-horizontal">
        <dt>
            @Html.DisplayNameFor(Function(model) model.Identificacion)
        </dt>

        <dd>
            @Html.DisplayFor(Function(model) model.Identificacion)
        </dd>

        <dt>
            @Html.DisplayNameFor(Function(model) model.Nombre)
        </dt>

        <dd>
            @Html.DisplayFor(Function(model) model.Nombre)
        </dd>

        <dt>
            @Html.DisplayNameFor(Function(model) model.FechaIngreso)
        </dt>

        <dd>
            @Html.DisplayFor(Function(model) model.FechaIngreso)
        </dd>

    </dl>
</div>
<p>
    @Html.ActionLink("Editar", "Edit", New With {.id = Model.IdAlumno}) |
    @Html.ActionLink("Volver al Listado", "Index")
</p>
