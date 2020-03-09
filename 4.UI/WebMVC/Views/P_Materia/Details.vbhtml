@ModelType WebMVC.WebMVC.P_Materia
@Code
    ViewData("Title") = "Details"
End Code

<h2>Detalle Materia</h2>

<div>
   
    <hr />
    <dl class="dl-horizontal">
        <dt>
            @Html.DisplayNameFor(Function(model) model.Nombre)
        </dt>

        <dd>
            @Html.DisplayFor(Function(model) model.Nombre)
        </dd>

    </dl>
</div>
<p>
    @Html.ActionLink("Editar", "Edit", New With {.id = Model.IdMateria}) |
    @Html.ActionLink("Volver a la Lista", "Index")
</p>
