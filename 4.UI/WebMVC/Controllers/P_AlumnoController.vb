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
    Public Class P_AlumnoController
        Inherits System.Web.Mvc.Controller

        Private db As New GrahamEntities

        ' GET: P_Alumno
        Function Index() As ActionResult
            Return View(db.P_Alumno.ToList())
        End Function

        ' GET: P_Alumno/Details/5
        Function Details(ByVal id As Integer?) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim p_Alumno As P_Alumno = db.P_Alumno.Find(id)
            If IsNothing(p_Alumno) Then
                Return HttpNotFound()
            End If
            Return View(p_Alumno)
        End Function

        ' GET: P_Alumno/Create
        Function Create() As ActionResult
            Return View()
        End Function

        ' POST: P_Alumno/Create
        'Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        'más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        <HttpPost()>
        <ValidateAntiForgeryToken()>
        Function Create(<Bind(Include:="IdAlumno,Identificacion,Nombre,FechaIngreso")> ByVal p_Alumno As P_Alumno) As ActionResult
            If ModelState.IsValid Then
                db.P_Alumno.Add(p_Alumno)
                db.SaveChanges()
                Return RedirectToAction("Index")
            End If
            Return View(p_Alumno)
        End Function

        ' GET: P_Alumno/Edit/5
        Function Edit(ByVal id As Integer?) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim p_Alumno As P_Alumno = db.P_Alumno.Find(id)
            If IsNothing(p_Alumno) Then
                Return HttpNotFound()
            End If
            Return View(p_Alumno)
        End Function

        ' POST: P_Alumno/Edit/5
        'Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        'más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        <HttpPost()>
        <ValidateAntiForgeryToken()>
        Function Edit(<Bind(Include:="IdAlumno,Identificacion,Nombre,FechaIngreso")> ByVal p_Alumno As P_Alumno) As ActionResult
            If ModelState.IsValid Then
                db.Entry(p_Alumno).State = EntityState.Modified
                db.SaveChanges()
                Return RedirectToAction("Index")
            End If
            Return View(p_Alumno)
        End Function

        ' GET: P_Alumno/Delete/5
        Function Delete(ByVal id As Integer?) As ActionResult
            If IsNothing(id) Then
                Return New HttpStatusCodeResult(HttpStatusCode.BadRequest)
            End If
            Dim p_Alumno As P_Alumno = db.P_Alumno.Find(id)
            If IsNothing(p_Alumno) Then
                Return HttpNotFound()
            End If
            Return View(p_Alumno)
        End Function

        ' POST: P_Alumno/Delete/5
        <HttpPost()>
        <ActionName("Delete")>
        <ValidateAntiForgeryToken()>
        Function DeleteConfirmed(ByVal id As Integer) As ActionResult
            Dim p_Alumno As P_Alumno = db.P_Alumno.Find(id)
            db.P_Alumno.Remove(p_Alumno)
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
