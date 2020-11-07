/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validarRubro(){
    let txtRubro= document.getElementById('txtRubro').value;
    if(txtRubro === "" || txtRubro === " ")
    {
        alert('ingrese Rubro');
        return false;
    }
    alert('Insertaste el rubro correctamente');
    return true;
}
function validarComercio(){
    let txtNombre= document.getElementById('txtNombreComercio').value;
    if(txtNombre === "" || txtNombre === " ")
    {
        alert('ingrese Nombre del comercio');
        return false;
    }
    
    let txtDescripcion= document.getElementById('txtDescripcionComercio').value;
    if(txtDescripcion === "" || txtDescripcion === " ")
    {
        alert('ingrese descripcion del comercio');
        return false;
    }
    
    let txtDireccion= document.getElementById('txtDireccionComercio').value;
        if(txtDireccion === "" || txtDireccion === " ")
    {
        alert('ingrese Direccion');
        return false;
    }
    
    let cboRubro= document.getElementById('cboRubros').value;
        if(cboRubro === null)
    {
        alert('seleccione Rubro (En caso de no estar el rubro necesario, Carguelo antes');
        return false;
    }
    alert('Insertaste el comercio correctamente');
    return true;
}
function validarOferta(){
    let txtProducto= document.getElementById('txtProducto').value;
    if(txtProducto === "" || txtProducto === " ")
    {
        alert('ingrese producto en oferta');
        return false;
    }
    
    let txtPrecio= document.getElementById('txtPrecio').value;
    if(txtPrecio === "" || txtPrecio === " ")
    {
        alert('ingrese precio');
        return false;
    }
    
    if(isNaN(txtPrecio))
    {
        alert('El precio debe ser numerico');
        return false;
    }
   
    
    let cboComercios= document.getElementById('cboComercios').value;
        if(cboComercios === null)
    {
        alert('seleccione Comercio (En caso de no estar el comercio necesario, Carguelo antes');
        return false;
    }
    alert('Ingresaste la oferta correctamente');
    return true;
}

function validarComentario(){
    let txtNombreComentario= document.getElementById('txtNombreComentario').value;
    if(txtNombreComentario === "" || txtNombreComentario === " ")
    {
        alert('ingrese el nombre por favor');
        return false;
    }
    let txtComentario= document.getElementById('txtComentarioE').value;
    if(txtComentario === "" || txtComentario === " ")
    {
        alert('No escribio su comentario');
        return false;
    }
    alert('Comentario enviado (Volviendo a la pagina principal)');
    return true;
}
function validarRespuesta(){
    let txtIdComentario= document.getElementById('txtIdComentario').value;
    if(txtIdComentario === "" || txtIdComentario === " ")
    {
        alert('No puede enviar una respuesta vacia!');
        return false;
    }
    alert('Respuesta enviada (Volviendo a la pagina principal)');
    return true;
}

		

