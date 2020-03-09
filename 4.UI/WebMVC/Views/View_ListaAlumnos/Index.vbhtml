@ModelType IEnumerable(Of WebMVC.WebMVC.View_ListaAlumnos)
@Code
    ViewData("Title") = "Index"
End Code

    <h2>Lista de alumnos ordenada por fecha de ingreso</h2>



<table class="table">
    <tr>
        <th>
            @Html.DisplayNameFor(Function(model) model.IdAlumno)
        </th>
        <th>
            @Html.DisplayNameFor(Function(model) model.Identificacion)
        </th>
        <th>
            @Html.DisplayNameFor(Function(model) model.FechaIngreso)
        </th>
        <th></th>
    </tr>

    @For Each item In Model
        @<tr>
            <td>
                @Html.DisplayFor(Function(modelItem) item.IdAlumno)
            </td>
            <td>
                @Html.DisplayFor(Function(modelItem) item.Identificacion)
            </td>
            <td>
                @Html.DisplayFor(Function(modelItem) item.FechaIngreso)
            </td>
            
        </tr>
    Next

</table>

