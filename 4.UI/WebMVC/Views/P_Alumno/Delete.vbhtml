@ModelType WebMVC.WebMVC.P_Alumno
@Code
    ViewData("Title") = "Delete"
End Code

<h2>Eliminar Alumno</h2>

<h3>Esta seguro de Eliminar el Alumno?</h3>
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
    @Using (Html.BeginForm())
        @Html.AntiForgeryToken()

        @<div class="form-actions no-color">
            <input type="submit" value="Delete" class="btn btn-default" /> |
            @Html.ActionLink("Volver al Listado", "Index")
        </div>
    End Using
</div>
