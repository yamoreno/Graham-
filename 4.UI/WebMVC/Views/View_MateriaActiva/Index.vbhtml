@ModelType IEnumerable(Of WebMVC.WebMVC.View_MateriaActiva)
@Code
    ViewData("Title") = "Index"
End Code

    <h2>Lista de alumnos con las materias del semestre en curso</h2>


<table class="table">
    <tr>
        <th>
            @Html.DisplayNameFor(Function(model) model.Alumno)
        </th>
        <th>
            @Html.DisplayNameFor(Function(model) model.Carrera)
        </th>
        <th>
            @Html.DisplayNameFor(Function(model) model.Materia)
        </th>
        <th></th>
    </tr>

    @For Each item In Model
        @<tr>
            <td>
                @Html.DisplayFor(Function(modelItem) item.Alumno)
            </td>
            <td>
                @Html.DisplayFor(Function(modelItem) item.Materia)
            </td>
            <td>
                @Html.DisplayFor(Function(modelItem) item.Carrera)
            </td>

        </tr>
    Next

</table>

