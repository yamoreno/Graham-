@ModelType IEnumerable(Of WebMVC.WebMVC.P_Alumno)
@Code
    ViewData("Title") = "Mòdulo de Alumnos"
End Code

    <h2>Mòdulo de Alumnos</h2>

<p>
    @Html.ActionLink("Crear Alumno", "Create")
</p>
<table class="table">
    <tr>
        <th>
            @Html.DisplayNameFor(Function(model) model.Identificacion)
        </th>
        <th>
            @Html.DisplayNameFor(Function(model) model.Nombre)
        </th>
        <th>
            @Html.DisplayNameFor(Function(model) model.FechaIngreso)
        </th>
        <th></th>
    </tr>

@For Each item In Model
    @<tr>
        <td>
            @Html.DisplayFor(Function(modelItem) item.Identificacion)
        </td>
        <td>
            @Html.DisplayFor(Function(modelItem) item.Nombre)
        </td>
        <td>
            @Html.DisplayFor(Function(modelItem) item.FechaIngreso)
        </td>
        <td>
            @Html.ActionLink("Editar", "Edit", New With {.id = item.IdAlumno}) |
            @Html.ActionLink("Ver Detalle", "Details", New With {.id = item.IdAlumno}) |
            @Html.ActionLink("Eliminar", "Delete", New With {.id = item.IdAlumno})
        </td>
    </tr>
Next

</table>
