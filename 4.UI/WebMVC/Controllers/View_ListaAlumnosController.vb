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
    Public Class View_ListaAlumnosController
        Inherits System.Web.Mvc.Controller

        Private db As New GrahamEntities

        ' GET: View_ListaAlumnos
        Function Index() As ActionResult
            Return View(db.View_ListaAlumnos.ToList())
        End Function

        ' GET: View_ListaAlumnos/Details/5
        Function Details(ByVal id As Integer?) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim view_ListaAlumnos As View_ListaAlumnos = db.View_ListaAlumnos.Find(id)
            If IsNothing(view_ListaAlumnos) Then
                Return HttpNotFound()
            End If
            Return View(view_ListaAlumnos)
        End Function

        ' GET: View_ListaAlumnos/Create
        Function Create() As ActionResult
            Return View()
        End Function

        ' POST: View_ListaAlumnos/Create
        'Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        'más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        <HttpPost()>
        <ValidateAntiForgeryToken()>
        Function Create(<Bind(Include:="IdAlumno,Identificacion,FechaIngreso")> ByVal view_ListaAlumnos As View_ListaAlumnos) As ActionResult
            If ModelState.IsValid Then
                db.View_ListaAlumnos.Add(view_ListaAlumnos)
                db.SaveChanges()
                Return RedirectToAction("Index")
            End If
            Return View(view_ListaAlumnos)
        End Function

        ' GET: View_ListaAlumnos/Edit/5
        Function Edit(ByVal id As Integer?) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim view_ListaAlumnos As View_ListaAlumnos = db.View_ListaAlumnos.Find(id)
            If IsNothing(view_ListaAlumnos) Then
                Return HttpNotFound()
            End If
            Return View(view_ListaAlumnos)
        End Function

        ' POST: View_ListaAlumnos/Edit/5
        'Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        'más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        <HttpPost()>
        <ValidateAntiForgeryToken()>
        Function Edit(<Bind(Include:="IdAlumno,Identificacion,FechaIngreso")> ByVal view_ListaAlumnos As View_ListaAlumnos) As ActionResult
            If ModelState.IsValid Then
                db.Entry(view_ListaAlumnos).State = EntityState.Modified
                db.SaveChanges()
                Return RedirectToAction("Index")
            End If
            Return View(view_ListaAlumnos)
        End Function

        ' GET: View_ListaAlumnos/Delete/5
        Function Delete(ByVal id As Integer?) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim view_ListaAlumnos As View_ListaAlumnos = db.View_ListaAlumnos.Find(id)
            If IsNothing(view_ListaAlumnos) Then
                Return HttpNotFound()
            End If
            Return View(view_ListaAlumnos)
        End Function

        ' POST: View_ListaAlumnos/Delete/5
        <HttpPost()>
        <ActionName("Delete")>
        <ValidateAntiForgeryToken()>
        Function DeleteConfirmed(ByVal id As Integer) As ActionResult
            Dim view_ListaAlumnos As View_ListaAlumnos = db.View_ListaAlumnos.Find(id)
            db.View_ListaAlumnos.Remove(view_ListaAlumnos)
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
