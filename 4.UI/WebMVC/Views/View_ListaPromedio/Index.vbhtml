@ModelType IEnumerable(Of WebMVC.WebMVC.View_ListaPromedio)
@Code
ViewData("Title") = "Index"
End Code

<h2>Notas Acumuladas y Promedio</h2>
<table class="table">
    <tr>
        <th>
            @Html.DisplayNameFor(Function(model) model.Identificacion)
        </th>
        <th>
            @Html.DisplayNameFor(Function(model) model.Alumno)
        </th>
        <th>
            @Html.DisplayNameFor(Function(model) model.Carrera)
        </th>
        <th>
            @Html.DisplayNameFor(Function(model) model.Materia)
        </th>
        <th>
            @Html.DisplayNameFor(Function(model) model.Nota)
        </th>
        <th>
            @Html.DisplayNameFor(Function(model) model.Promedio)
        </th>
        <th></th>
    </tr>

    @For Each item In Model
        @<tr>
    <td>
        @Html.DisplayFor(Function(modelItem) item.Identificacion)
    </td>
    <td>
        @Html.DisplayFor(Function(modelItem) item.Alumno)
    </td>
    <td>
        @Html.DisplayFor(Function(modelItem) item.Carrera)
    </td>
    <td>
        @Html.DisplayFor(Function(modelItem) item.Materia)
    </td>
    <td>
        @Html.DisplayFor(Function(modelItem) item.Nota)
    </td>
    <td>
        @Html.DisplayFor(Function(modelItem) item.Promedio)
    </td>

</tr>
    Next

</table>
