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
    Public Class View_ListaPromedioController
        Inherits System.Web.Mvc.Controller

        Private db As New GrahamEntities

        ' GET: View_ListaPromedio
        Function Index() As ActionResult
            Return View(db.View_ListaPromedio.ToList())
        End Function

        ' GET: View_ListaPromedio/Details/5
        Function Details(ByVal id As String) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim view_ListaPromedio As View_ListaPromedio = db.View_ListaPromedio.Find(id)
            If IsNothing(view_ListaPromedio) Then
                Return HttpNotFound()
            End If
            Return View(view_ListaPromedio)
        End Function

        ' GET: View_ListaPromedio/Create
        Function Create() As ActionResult
            Return View()
        End Function

        ' POST: View_ListaPromedio/Create
        'Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        'más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        <HttpPost()>
        <ValidateAntiForgeryToken()>
        Function Create(<Bind(Include:="Identificacion,Alumno,Carrera,IdMateria,Materia,Nota,Promedio")> ByVal view_ListaPromedio As View_ListaPromedio) As ActionResult
            If ModelState.IsValid Then
                db.View_ListaPromedio.Add(view_ListaPromedio)
                db.SaveChanges()
                Return RedirectToAction("Index")
            End If
            Return View(view_ListaPromedio)
        End Function

        ' GET: View_ListaPromedio/Edit/5
        Function Edit(ByVal id As String) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim view_ListaPromedio As View_ListaPromedio = db.View_ListaPromedio.Find(id)
            If IsNothing(view_ListaPromedio) Then
                Return HttpNotFound()
            End If
            Return View(view_ListaPromedio)
        End Function

        ' POST: View_ListaPromedio/Edit/5
        'Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        'más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        <HttpPost()>
        <ValidateAntiForgeryToken()>
        Function Edit(<Bind(Include:="Identificacion,Alumno,Carrera,IdMateria,Materia,Nota,Promedio")> ByVal view_ListaPromedio As View_ListaPromedio) As ActionResult
            If ModelState.IsValid Then
                db.Entry(view_ListaPromedio).State = EntityState.Modified
                db.SaveChanges()
                Return RedirectToAction("Index")
            End If
            Return View(view_ListaPromedio)
        End Function

        ' GET: View_ListaPromedio/Delete/5
        Function Delete(ByVal id As String) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim view_ListaPromedio As View_ListaPromedio = db.View_ListaPromedio.Find(id)
            If IsNothing(view_ListaPromedio) Then
                Return HttpNotFound()
            End If
            Return View(view_ListaPromedio)
        End Function

        ' POST: View_ListaPromedio/Delete/5
        <HttpPost()>
        <ActionName("Delete")>
        <ValidateAntiForgeryToken()>
        Function DeleteConfirmed(ByVal id As String) As ActionResult
            Dim view_ListaPromedio As View_ListaPromedio = db.View_ListaPromedio.Find(id)
            db.View_ListaPromedio.Remove(view_ListaPromedio)
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
