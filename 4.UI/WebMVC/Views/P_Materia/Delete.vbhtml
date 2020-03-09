@ModelType WebMVC.WebMVC.P_Materia
@Code
    ViewData("Title") = "Eliminar"
End Code

<h2>Delete</h2>

<h3>Esta seguro de eliminar la Materia?</h3>
<div>
    <h4>P_Materia</h4>
    <hr />
    <dl class="dl-horizontal">
        <dt>
            @Html.DisplayNameFor(Function(model) model.Nombre)
        </dt>

        <dd>
            @Html.DisplayFor(Function(model) model.Nombre)
        </dd>

    </dl>
    @Using (Html.BeginForm())
        @Html.AntiForgeryToken()

        @<div class="form-actions no-color">
    <input type="submit" value="Delete" class="btn btn-default" /> |
    @Html.ActionLink("Volver a la Lista", "Index")
</div>
    End Using
</div>
