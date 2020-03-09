Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.Entity
Imports System.Linq
Imports System.Net
Imports System.Web
Imports System.Web.Mvc
Imports WebMVC.WebMVC

Namespace Controllers
    Public Class P_MateriaController
        Inherits System.Web.Mvc.Controller

        Private db As New GrahamEntities

        ' GET: P_Materia
        Function Index() As ActionResult
            Return View(db.P_Materia.ToList())
        End Function

        ' GET: P_Materia/Details/5
        Function Details(ByVal id As Integer?) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim p_Materia As P_Materia = db.P_Materia.Find(id)
            If IsNothing(p_Materia) Then
                Return HttpNotFound()
            End If
            Return View(p_Materia)
        End Function

        ' GET: P_Materia/Create
        Function Create() As ActionResult
            Return View()
        End Function

        ' POST: P_Materia/Create
        'Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        'más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        <HttpPost()>
        <ValidateAntiForgeryToken()>
        Function Create(<Bind(Include:="IdMateria,Nombre")> ByVal p_Materia As P_Materia) As ActionResult
            If ModelState.IsValid Then
                db.P_Materia.Add(p_Materia)
                db.SaveChanges()
                Return RedirectToAction("Index")
            End If
            Return View(p_Materia)
        End Function

        ' GET: P_Materia/Edit/5
        Function Edit(ByVal id As Integer?) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim p_Materia As P_Materia = db.P_Materia.Find(id)
            If IsNothing(p_Materia) Then
                Return HttpNotFound()
            End If
            Return View(p_Materia)
        End Function

        ' POST: P_Materia/Edit/5
        'Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        'más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        <HttpPost()>
        <ValidateAntiForgeryToken()>
        Function Edit(<Bind(Include:="IdMateria,Nombre")> ByVal p_Materia As P_Materia) As ActionResult
            If ModelState.IsValid Then
                db.Entry(p_Materia).State = EntityState.Modified
                db.SaveChanges()
                Return RedirectToAction("Index")
            End If
            Return View(p_Materia)
        End Function

        ' GET: P_Materia/Delete/5
        Function Delete(ByVal id As Integer?) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim p_Materia As P_Materia = db.P_Materia.Find(id)
            If IsNothing(p_Materia) Then
                Return HttpNotFound()
            End If
            Return View(p_Materia)
        End Function

        ' POST: P_Materia/Delete/5
        <HttpPost()>
        <ActionName("Delete")>
        <ValidateAntiForgeryToken()>
        Function DeleteConfirmed(ByVal id As Integer) As ActionResult
            Dim p_Materia As P_Materia = db.P_Materia.Find(id)
            db.P_Materia.Remove(p_Materia)
            db.SaveChanges()
            Return RedirectToAction("Index")
        End Function

        Protected Overrides Sub Dispose(ByVal disposing As Boolean)
            If (disposing) Then
                db.Dispose()
            End If
            MyBase.Dispose(disposing)
        End Sub
    End Class
End Namespace
