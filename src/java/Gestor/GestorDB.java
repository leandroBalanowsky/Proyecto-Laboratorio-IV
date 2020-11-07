
package Gestor;

import Dto.CantPorValoracion;
import Dto.ComentSinResp;
import Dto.ComercioComentario;
import Dto.ComercioCompleto;
import Dto.PromValoracion;
import Models.Comentario;
import Models.Comercio;
import Models.Oferta;
import Models.Respuesta;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Models.Rubro;
import Models.Valoracion;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class GestorDB {
    private Connection con;
    private final String CON_STR = "jdbc:sqlserver://DESKTOP-QKAVOOV\\SQLEXPRESS:1433;databaseName=Parcial2";
    private final String USER = "sa";
    private final String PASS = "137955";

    private void abrirConexion() 
    {
        try 
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();

            con = DriverManager.getConnection(CON_STR, USER, PASS);
        } 
        catch (Exception ex) 
        {
            ex.printStackTrace();
        }
    }
    
    private void cerrarConexion() 
    {
        try 
        {
            if (con != null && !con.isClosed()) 
            {
		con.close();
            }
	} 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
	}
    }
    
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-- INSERTAR --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    //--------------------------Insertar rubro en la bd-----------------------
    public boolean insertarRubro(Rubro rubro) 
    {
        boolean inserto = false;
        try 
        {
            abrirConexion();
            String sql = "INSERT INTO Rubros (rubro) VALUES (?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, rubro.getRubro());
            st.execute();
            inserto = true;
	} 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
	} 
        finally 
        {
            cerrarConexion();
	}

            return inserto;
    }
    //--------------------------Insertar comercio en la bd-----------------------
    public boolean insertarComercio(Comercio comercio) 
    {
        boolean inserto = false;
        try 
        {
            abrirConexion();
            String sql = "INSERT INTO Comercios (Nombre, Descripcion, Direccion, idRubro, imgComercio) VALUES (?,?,?,?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,comercio.getNombre());
            st.setString(2,comercio.getDescripcion());
            st.setString(3,comercio.getDireccion());
            st.setInt(4,comercio.getRubro().getIdRubro());
            st.setString(5,comercio.getImgComercio());
            st.execute();
            inserto = true;
	} 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
	} 
        finally 
        {
            cerrarConexion();
	}

            return inserto;
    }
    //--------------------------Insertar Oferta en la bd-----------------------
    public boolean insertarOferta(Oferta oferta) 
    {
        boolean inserto = false;
        try 
        {
            abrirConexion();
            String sql = "INSERT INTO Ofertas (Producto, idComercio, Precio, imgProducto) VALUES (?,?,?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,oferta.getProducto());
            st.setInt(2,oferta.getIdComercio());
            st.setDouble(3,oferta.getPrecio());
            st.setString(4,oferta.getImgProducto());
            st.execute();
            inserto = true;
	} 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
	} 
        finally 
        {
            cerrarConexion();
	}

            return inserto;
    }
    //--------------------------Insertar Comentario en la bd-----------------------
    public boolean insertarComentario(Comentario comentario) 
    {
        boolean inserto = false;
        try 
        {
            abrirConexion();
            String sql = "INSERT INTO Comentarios (Nombre, Mensaje, idComercio, idValoracion) VALUES (?,?,?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,comentario.getNombre());
            st.setString(2,comentario.getMensaje());
            st.setInt(3,comentario.getIdComercio());
            st.setInt(4,comentario.getValoracion().getIdValoracion());
            st.execute();
            inserto = true;
	} 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
	} 
        finally 
        {
            cerrarConexion();
	}

            return inserto;
    }
    //--------------------------Insertar Respuesta en la bd-----------------------
    public boolean insertarRespuesta(Respuesta respuesta) 
    {
        boolean inserto = false;
        try 
        {
            abrirConexion();
            String sql = "INSERT INTO Respuestas (Respuesta, IdComentario) VALUES (?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,respuesta.getMensaje());
            st.setInt(2, respuesta.getIdComentario());
            st.execute();
            inserto = true;
	} 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
	} 
        finally 
        {
            cerrarConexion();
	}

            return inserto;
    }

    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-- CONSULTAR --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    //----------------------------Consultar Rubros--------------------------------------
    public ArrayList<Rubro> getRubros() 
    {
        ArrayList<Rubro> lista = new ArrayList<Rubro>();
	try 
        {
            abrirConexion();
            String sql = "select * from Rubros";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) 
            {
                int idRubro = rs.getInt("idRubro");
                String rubro = rs.getString("rubro");
                lista.add(new Rubro(idRubro, rubro));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    //----------------------------Consultar Comercios--------------------------------------
    public ArrayList<Comercio> getComercios() 
    {
        ArrayList<Comercio> lista = new ArrayList<Comercio>();
	try 
        {
            abrirConexion();
            String sql = "select * from Comercios";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) 
            {
                int idComercio = rs.getInt("idComercio");
                String nombre = rs.getString("Nombre");
                String descripcion = rs.getString("Descripcion");
                String direccion = rs.getString("Direccion");
                int idRubro = rs.getInt("idRubro");
                Rubro rubro = getRubro(idRubro);
                String imgComercio = rs.getString("imgComercio");
                lista.add(new Comercio(idComercio, nombre, descripcion, direccion, rubro, imgComercio));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    //----------------------------Consultar Rubro con id--------------------------------------
    public Rubro getRubro(int id) 
    {
        Rubro rubro = null;
	try 
        {
            abrirConexion();
            String sql = "select * from Rubros where idRubro = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1 ,id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) 
            {
                int idRubro = rs.getInt("idRubro");
                String nombre = rs.getString("rubro");
                rubro = new Rubro(idRubro, nombre);
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return rubro;
    }
    //----------------------------Consultar Comercio con id--------------------------------------
    public Comercio getComercioCompleto(int id) 
    {
        Comercio comCompleto = null;
	try 
        {
            abrirConexion();
            String sql = "select * from Comercios where idComercio = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1 ,id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
                int idComercio = rs.getInt("idComercio");
                String nombre = rs.getString("Nombre");
                String descripcion = rs.getString("Descripcion");
                String direccion = rs.getString("Direccion");
                int idRubro = rs.getInt("idRubro");
                Rubro rubro = getRubro(idRubro);
                String imgComercio = rs.getString("imgComercio");
                comCompleto = new Comercio(idComercio, nombre, descripcion, direccion, rubro, imgComercio);
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return comCompleto;
    }
    //----------------------------Consultar Ofertas con id comercio--------------------------------------
    public ArrayList<Oferta> getOfertas(int id) 
    {
        ArrayList<Oferta> lista = new ArrayList<>();
	try 
        {
            abrirConexion();
            String sql = "select * from Ofertas where idComercio = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1 ,id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
                int idOferta = rs.getInt("idOfertas");
                String producto = rs.getString("Producto");
                int idComercio = rs.getInt("idComercio");
                double precio = rs.getDouble("Precio");
                String imgProducto = rs.getString("imgProducto");
                lista.add(new Oferta(idOferta, producto, idComercio, precio, imgProducto));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    public ArrayList<Oferta> getBuscarOfertas(String buscar) 
    {
        ArrayList<Oferta> lista = new ArrayList<>();
	try 
        {
            abrirConexion();
            String sql = "select * from Ofertas where Producto like ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1 ,"%" + buscar + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
                int idOferta = rs.getInt("idOfertas");
                String producto = rs.getString("Producto");
                int idComercio = rs.getInt("idComercio");
                double precio = rs.getDouble("Precio");
                String imgProducto = rs.getString("imgProducto");
                lista.add(new Oferta(idOferta, producto, idComercio, precio, imgProducto));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    //----------------------------Consultar Ofertas con id--------------------------------------
    public Oferta getOferta(int id) 
    {
        Oferta oferta = null;
	try 
        {
            abrirConexion();
            String sql = "select * from Ofertas where idOfertas = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1 ,id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
                int idOferta = rs.getInt("idOfertas");
                String producto = rs.getString("Producto");
                int idComercio = rs.getInt("idComercio");
                double precio = rs.getDouble("Precio");
                String imgProducto = rs.getString("imgProducto");
                oferta = new Oferta(idOferta, producto, idComercio, precio, imgProducto);
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return oferta;
    }
    //----------------------------Consultar Ofertas completas--------------------------------------
    public ArrayList<Oferta> getOfertasCompletas() 
    {
        ArrayList<Oferta> lista = new ArrayList<>();
	try 
        {
            abrirConexion();
            String sql = "select idOfertas, Producto, Nombre, Precio from Ofertas o join Comercios c on o.idComercio = c.idComercio";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) 
            {
                int idOferta = rs.getInt("idOfertas");
                String producto = rs.getString("Producto");
                String nombre = rs.getString("Nombre");
                double precio = rs.getDouble("Precio");
                lista.add(new Oferta(idOferta, producto, nombre, precio));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    //----------------------------Consultar Usuario--------------------------------------
    public boolean existeUsuario(String username, String password) {
        String usuario = "";
        String contraseña = "";
        try 
        {
            abrirConexion();
            String sql = "select * from Administrador where Usuario = ? and Password = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1 , username);
            st.setString(2 , password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) 
            {
                usuario = rs.getString("Usuario");
                contraseña = rs.getString("Password");
            }
                rs.close();
        }
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        } 
        finally 
        {
            cerrarConexion();
        }
        if (username.equals(usuario) && password.equals(contraseña)) {
            return true;
	}
	return false;
    }
    //----------------------------Consultar Valoraciones--------------------------------------
    public ArrayList<Valoracion> getValoraciones()
    {
        ArrayList<Valoracion> lista = new ArrayList<>();
        try 
        {
            abrirConexion();
            String sql = "select * from Valoracion";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) 
            {
                int idValoracion = rs.getInt("idValoracion");
                String descripcion = rs.getString("Descripcion");
                int valor = rs.getInt("Valor");
                lista.add(new Valoracion(idValoracion, descripcion, valor));
            }
                rs.close();
        }
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        } 
        finally 
        {
            cerrarConexion();
        }
        return lista;
    }
    //----------------------------Consultar Valoracion por id--------------------------------------
    public Valoracion getValoracion(int id)
    {
        Valoracion val = null;
        try 
        {
            abrirConexion();
            String sql = "select * from Valoracion where idValoracion = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1 ,id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
                int idValoracion = rs.getInt("idValoracion");
                String descripcion = rs.getString("Descripcion");
                int valor = rs.getInt("Valor");
                val = new Valoracion(idValoracion, descripcion, valor);
            }
            rs.close();
        }
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        } 
        finally 
        {
            cerrarConexion();
        }
        return val;
    }
    //----------------------------Consultar Comentarios--------------------------------------
    public ArrayList<Comentario> getComentarios(int id) 
    {
        ArrayList<Comentario> lista = new ArrayList<>();
	try 
        {
            abrirConexion();
            String sql = "select * from Comentarios where idComercio = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1 ,id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
                int idComentario = rs.getInt("idComentario");
                String nombre = rs.getString("Nombre");
                String mensaje = rs.getString("Mensaje");
                int idComercio = rs.getInt("idComercio");
                int idValoracion = rs.getInt("idValoracion");
                Valoracion valoracion = getValoracion(idValoracion);
                lista.add(new Comentario(idComentario, nombre, mensaje, idComercio, valoracion));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    //----------------------------Consultar Respuestas--------------------------------------
    public ArrayList<Respuesta> getRespuestas()
    {
        ArrayList<Respuesta> lista = new ArrayList<>();
	try 
        {
            abrirConexion();
            String sql = "select * from Respuestas";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) 
            {
                int idRespuesta = rs.getInt("idRespuesta");
                String respuesta = rs.getString("Respuesta");
                int idComentario = rs.getInt("idComentario");
                lista.add(new Respuesta(idRespuesta, respuesta, idComentario ));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    //----------------------------Consultar Comercio por rubro--------------------------------------
    public ArrayList<Comercio> getComercioPorRubro(int id) 
    {
        ArrayList<Comercio> lista = new ArrayList<Comercio>();
	try 
        {
            abrirConexion();
            String sql = "select * from Comercios where idRubro = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1 ,id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) 
            {
                int idComercio = rs.getInt("idComercio");
                String nombre = rs.getString("Nombre");
                String descripcion = rs.getString("Descripcion");
                String direccion = rs.getString("Direccion");
                int idRubro = rs.getInt("idRubro");
                Rubro rubro = getRubro(idRubro);
                String imgComercio = rs.getString("imgComercio");
                lista.add(new Comercio(idComercio, nombre, descripcion, direccion, rubro, imgComercio));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    //----------------------------Consultar Cantidad de valoraciones por estrellas--------------------------------------
    public ArrayList<CantPorValoracion> getCantidadPorValoracion()
    {
        ArrayList<CantPorValoracion> lista = new ArrayList<>();
	try 
        {
            abrirConexion();
            String sql = "select * from v_cantidadPorValoracion";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) 
            {
                String descripcion = rs.getString("descripcion");
                int cantidad = rs.getInt("cantidad");
                lista.add(new CantPorValoracion(descripcion, cantidad));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    //----------------------------Consultar Comentarios sin respuestas--------------------------------------
    public ArrayList<ComentSinResp> getComentSinResp()
    {
        ArrayList<ComentSinResp> lista = new ArrayList<>();
	try 
        {
            abrirConexion();
            String sql = "select * from v_comentSinResp";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) 
            {
                int idComentario = rs.getInt("IdComentario");
                String nombre = rs.getString("Nombre");
                String mensaje = rs.getString("Mensaje");
                int idComercio = rs.getInt("idComercio");
                String comercio = rs.getString("Comercio");
                lista.add(new ComentSinResp(idComentario, nombre, mensaje, idComercio, comercio));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    //----------------------------Consultar Comercio por Cantidad de comentarios--------------------------------------
    public ArrayList<ComercioComentario> getComercioComentario()
    {
        ArrayList<ComercioComentario> lista = new ArrayList<>();
	try 
        {
            abrirConexion();
            String sql = "select * from v_comercioComentario order by CantiComentarios desc";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) 
            {
                int idComercio = rs.getInt("IdComercio");
                String nombre = rs.getString("Nombre");
                int cantiComentarios = rs.getInt("CantiComentarios");
                lista.add(new ComercioComentario(idComercio, nombre, cantiComentarios));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    //----------------------------Consultar promedio por valoracion--------------------------------------
    public ArrayList<PromValoracion> getPromValoracion()
    {
        ArrayList<PromValoracion> lista = new ArrayList<>();
	try 
        {
            abrirConexion();
            String sql = "select * from v_promValoracion order by promEstrellas desc";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) 
            {
                int idComercio = rs.getInt("IdComercio");
                String nombre = rs.getString("Nombre");
                String rubro = rs.getString("Rubro");
                int promEstrellas = rs.getInt("promEstrellas");
                lista.add(new PromValoracion(idComercio, nombre, rubro, promEstrellas));
            }
                rs.close();
            }
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            } 
            finally 
            {
                cerrarConexion();
            }
            return lista;
    }
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-- Modificar --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    //---------------------------- Modificar rubros ----------------------------------
    public boolean modificarRubro(Rubro rubro) {
    boolean inserto = false;
    try {
	abrirConexion();
	String sql = "UPDATE Rubros SET rubro=? WHERE idRubro=?";
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, rubro.getRubro());
        st.setInt(2, rubro.getIdRubro());
	st.executeUpdate();
	inserto = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
	} finally {
            cerrarConexion();
	}

	return inserto;
    }
    //---------------------------- Modificar Comercio ----------------------------------
    public boolean modificarComercio(Comercio comercio) {
    boolean inserto = false;
    try {
	abrirConexion();
	String sql = "UPDATE Comercios SET Nombre= ?, Descripcion = ?, Direccion = ?, idRubro = ?, ImgComercio = ?  WHERE idComercio = ?";
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, comercio.getNombre());
        st.setString(2, comercio.getDescripcion());
        st.setString(3, comercio.getDireccion());
        st.setInt(4, comercio.getRubro().getIdRubro());
        st.setString(5, comercio.getImgComercio());
        st.setInt(6, comercio.getIdComercio());
	st.executeUpdate();
	inserto = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
	} finally {
            cerrarConexion();
	}

	return inserto;
    }
    //---------------------------- Modificar Oferta ----------------------------------
    public boolean modificarOferta(Oferta oferta) {
    boolean inserto = false;
    try {
	abrirConexion();
	String sql = "UPDATE Ofertas SET Producto= ?, idComercio = ?, Precio = ?, ImgProducto = ?  WHERE idOfertas = ?";
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, oferta.getProducto());
        st.setInt(2, oferta.getIdComercio());
        st.setDouble(3, oferta.getPrecio());
        st.setString(4, oferta.getImgProducto());
        st.setInt(5, oferta.getIdOferta());
	st.executeUpdate();
	inserto = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
	} finally {
            cerrarConexion();
	}

	return inserto;
    }
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-- Eliminar --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    //-------------------------- Eliminar rubro ---------------------------------
    public boolean eliminarRubro(int id) {
    boolean inserto = false;
    try {
	abrirConexion();
	String sql = "DELETE Rubros WHERE idRubro=?";
	PreparedStatement st = con.prepareStatement(sql);
	st.setInt(1, id);
	st.executeUpdate();
	inserto = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
	} finally {
            cerrarConexion();
	}

	return inserto;
    }
    //-------------------------- Eliminar Comercio ---------------------------------
    public boolean eliminarComercio(int id) {
    boolean inserto = false;
    try {
        eliminarOferta(2, id);
	abrirConexion();
	String sql = "DELETE Comercios WHERE idComercio = ?";
	PreparedStatement st = con.prepareStatement(sql);
	st.setInt(1, id);
	st.executeUpdate();
	inserto = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
	} finally {
            cerrarConexion();
	}

	return inserto;
    }
    //-------------------------- Eliminar Oferta ---------------------------------
    public boolean eliminarOferta(int op, int id) {
    boolean inserto = false;
    String sql ="";
    try {
	abrirConexion();
        if (op == 1) {
            sql = "DELETE Ofertas WHERE idOfertas = ?";
        }
        else if(op == 2)
        {
            sql = "DELETE Ofertas WHERE idComercio = ?";
        }
	PreparedStatement st = con.prepareStatement(sql);
	st.setInt(1, id);
	st.executeUpdate();
	inserto = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
	} finally {
            cerrarConexion();
	}

	return inserto;
    }
    //-------------------------- Eliminar Respuestas ---------------------------------
    public boolean eliminarRespuesta(int op, int id)
    {
        String sql ="";
        boolean inserto = false;
        try 
        {
        abrirConexion();
        if(op == 1)
        {
            sql = "DELETE Respuestas WHERE idRespuesta = ?";
        }
        else if(op == 2)
        {
            sql = "DELETE Respuestas WHERE idComentario = ?";
        }
	PreparedStatement st = con.prepareStatement(sql);
	st.setInt(1, id);
	st.executeUpdate();
        inserto = true;
	} 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
	} 
        finally 
        {
            cerrarConexion();
	}
        return inserto;
    }
    //-------------------------- Eliminar Comentarios ---------------------------------
    public boolean eliminarComentario(int id) {
    boolean inserto = false;
    try {
        eliminarRespuesta(2, id);
	abrirConexion();
	String sql = "DELETE Comentarios WHERE idComentario = ?";
	PreparedStatement st = con.prepareStatement(sql);
	st.setInt(1, id);
	st.executeUpdate();
	inserto = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
	} finally {
            cerrarConexion();
	}

	return inserto;
    }
}


