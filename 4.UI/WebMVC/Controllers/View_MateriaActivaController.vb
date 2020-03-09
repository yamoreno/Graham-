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
    Public Class View_MateriaActivaController
        Inherits System.Web.Mvc.Controller

        Private db As New GrahamEntities

        ' GET: View_MateriaActiva
        Function Index() As ActionResult
            Return View(db.View_MateriaActiva.ToList())
        End Function

        ' GET: View_MateriaActiva/Details/5
        Function Details(ByVal id As String) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim view_MateriaActiva As View_MateriaActiva = db.View_MateriaActiva.Find(id)
            If IsNothing(view_MateriaActiva) Then
                Return HttpNotFound()
            End If
            Return View(view_MateriaActiva)
        End Function

        ' GET: View_MateriaActiva/Create
        Function Create() As ActionResult
            Return View()
        End Function

        ' POST: View_MateriaActiva/Create
        'Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        'más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        <HttpPost()>
        <ValidateAntiForgeryToken()>
        Function Create(<Bind(Include:="Identificacion,Alumno,Carrera,IdMateria,Materia")> ByVal view_MateriaActiva As View_MateriaActiva) As ActionResult
            If ModelState.IsValid Then
                db.View_MateriaActiva.Add(view_MateriaActiva)
                db.SaveChanges()
                Return RedirectToAction("Index")
            End If
            Return View(view_MateriaActiva)
        End Function

        ' GET: View_MateriaActiva/Edit/5
        Function Edit(ByVal id As String) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim view_MateriaActiva As View_MateriaActiva = db.View_MateriaActiva.Find(id)
            If IsNothing(view_MateriaActiva) Then
                Return HttpNotFound()
            End If
            Return View(view_MateriaActiva)
        End Function

        ' POST: View_MateriaActiva/Edit/5
        'Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        'más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        <HttpPost()>
        <ValidateAntiForgeryToken()>
        Function Edit(<Bind(Include:="Identificacion,Alumno,Carrera,IdMateria,Materia")> ByVal view_MateriaActiva As View_MateriaActiva) As ActionResult
            If ModelState.IsValid Then
                db.Entry(view_MateriaActiva).State = EntityState.Modified
                db.SaveChanges()
                Return RedirectToAction("Index")
            End If
            Return View(view_MateriaActiva)
        End Function

        ' GET: View_MateriaActiva/Delete/5
        Function Delete(ByVal id As String) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim view_MateriaActiva As View_MateriaActiva = db.View_MateriaActiva.Find(id)
            If IsNothing(view_MateriaActiva) Then
                Return HttpNotFound()
            End If
            Return View(view_MateriaActiva)
        End Function

        ' POST: View_MateriaActiva/Delete/5
        <HttpPost()>
        <ActionName("Delete")>
        <ValidateAntiForgeryToken()>
        Function DeleteConfirmed(ByVal id As String) As ActionResult
            Dim view_MateriaActiva As View_MateriaActiva = db.View_MateriaActiva.Find(id)
            db.View_MateriaActiva.Remove(view_MateriaActiva)
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
