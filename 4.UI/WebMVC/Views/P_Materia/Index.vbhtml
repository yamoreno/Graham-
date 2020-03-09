@ModelType IEnumerable(Of WebMVC.WebMVC.P_Materia)
@Code
ViewData("Title") = "Index"
End Code

<h2>Listado de Materias</h2>

<p>
    @Html.ActionLink("Crear Materia", "Create")
</p>
<table class="table">
    <tr>
        <th>
            @Html.DisplayNameFor(Function(model) model.Nombre)
        </th>
        <th></th>
    </tr>

@For Each item In Model
    @<tr>
        <td>
            @Html.DisplayFor(Function(modelItem) item.Nombre)
        </td>
        <td>
            @Html.ActionLink("Editar", "Edit", New With {.id = item.IdMateria}) |
            @Html.ActionLink("Ver Detalle", "Details", New With {.id = item.IdMateria}) |
            @Html.ActionLink("Eliminar", "Delete", New With {.id = item.IdMateria})
        </td>
    </tr>
Next

</table>
