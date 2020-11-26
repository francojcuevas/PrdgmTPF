/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ventasdao.controladores;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import ventasdao.dominio.Conexion;
import ventasdao.objetos.Categoria;
import ventasdao.objetos.Cliente;
import ventasdao.objetos.Factura;
import ventasdao.objetos.LineaFactura;
import ventasdao.objetos.Producto;

/**
 *
 * @author hchanampe
 */
public class LineaFacturaControlador implements ICrud<LineaFactura>{
    
    private Connection connection;
    
    private Statement stmt;
    
    private PreparedStatement ps;
    
    private ResultSet rs;
    
    private String sql;

    @Override
    public boolean crear(LineaFactura entidad) throws SQLException, Exception {
        
        connection = Conexion.obtenerConexion ();
         String sql = "INSERT INTO cantidades_productos (cantidad,producto_id,factura_id) VALUES (?,?,?)";
        
        try {
            ps = connection.prepareStatement(sql);
            ps.setDouble(1, entidad.getCantidad());
            ps.setInt(2, entidad.getProducto().getId());
            ps.setInt(3, entidad.getFactura().getId());
            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
// 
    @Override
    public boolean eliminar(LineaFactura entidad) throws SQLException, Exception {
        
        try {
            connection = Conexion.obtenerConexion ();
            this.sql = "DELETE FROM cantidades_productos WHERE id=?";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, entidad.getId());

            ps.execute();
            connection.close();
            return true;
        } catch (SQLException ex) {
            //notifyListeners(ex.getMessage());
            //Logger.getLogger(CategoriaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public LineaFactura extraer(int id) throws SQLException, Exception {
        
                        
            connection = Conexion.obtenerConexion();
            sql = "SELECT * FROM cantidades_facturas LEFT JOIN productos ON productos.id = cantidades_productos.producto_id LEFT JOIN facturas ON facturas.id = cantidades_productos.factura_id WHERE cantidades_productos.id = ? ";
            ps = connection.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            this.rs   = ps.executeQuery();
            
            connection.close();
            
            this.rs.next();
            
            Producto producto = new Producto();
            producto.setNombre(rs.getString("nombre"));
            producto.setDescripcion(rs.getString("descripcion"));
            producto.setId(rs.getInt("productos.id"));
            producto.setPrecio (rs.getFloat("precio"));
            producto.setFechaCreacion(rs.getDate("fecha_creacion"));
            producto.setCategoriaId(rs.getInt("categoria_id"));
            
            Factura factura = new Factura();
            factura.setId(rs.getInt("facturas.id"));
            factura.setFecha(rs.getDate("fecha"));
            factura.setObservacion(rs.getString("observacion"));
            factura.setTotal(rs.getDouble("total"));
            
            LineaFactura lineaFactura = new LineaFactura();
            lineaFactura.setId(rs.getInt("cantidades_productos.id"));
            lineaFactura.setCantidad(rs.getDouble("cantidad"));
            lineaFactura.setProducto(producto);
            lineaFactura.setFactura(factura);

            

            
            return lineaFactura;
    }

    @Override
    public boolean modificar(LineaFactura entidad) throws SQLException, Exception {
       
       connection = Conexion.obtenerConexion ();
       this.sql = "UPDATE cantidades_productos SET cantidad = ?,producto_id=?,factura_id=? WHERE id=?";
        
       ps = connection.prepareStatement(sql);
       ps.setDouble(1, entidad.getCantidad() );
       ps.setInt(2,entidad.getProducto().getId());
       ps.setInt(3,entidad.getFactura().getId());
       ps.setInt(4, entidad.getId());       
       
       ps.executeUpdate();
       connection.close();
       return true;
    }

    @Override
    public ArrayList<LineaFactura> listar() throws SQLException, Exception {
        
        connection = Conexion.obtenerConexion ();
        try{
            
            this.stmt = connection.createStatement();
            this.sql = "SELECT * FROM cantidades_facturas LEFT JOIN productos ON productos.id = cantidades_productos.producto_id LEFT JOIN facturas ON facturas.id = cantidades_productos.factura_id";
            this.rs   = stmt.executeQuery(sql);
            connection.close();
            
            ArrayList<LineaFactura> lineasFacturas = new ArrayList();
            
            while(rs.next()){
                
                Producto producto = new Producto();
                producto.setNombre(rs.getString("nombre"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setId(rs.getInt("productos.id"));
                producto.setPrecio (rs.getFloat("precio"));
                producto.setFechaCreacion(rs.getDate("fecha_creacion"));
                producto.setCategoriaId(rs.getInt("categoria_id"));

                Factura factura = new Factura();
                factura.setId(rs.getInt("facturas.id"));
                factura.setFecha(rs.getDate("fecha"));
                factura.setObservacion(rs.getString("observacion"));
                factura.setTotal(rs.getDouble("total"));

                LineaFactura lineaFactura = new LineaFactura();
                lineaFactura.setId(rs.getInt("cantidades_productos.id"));
                lineaFactura.setCantidad(rs.getDouble("cantidad"));
                lineaFactura.setProducto(producto);
                lineaFactura.setFactura(factura);
                
       
                lineasFacturas.add(lineaFactura);
                
            }
            //System.out.println(cont);
            //connection.close();
            return lineasFacturas;
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<LineaFactura> listar(int facturaId) throws SQLException, Exception {
        
        connection = Conexion.obtenerConexion ();
        try{
            
            this.stmt = connection.createStatement();
            this.sql = "SELECT cantidades_productos.*, productos.id as productoId, facturas.id as facturaId, cantidades_productos.id as cpid, productos.*, facturas.*  FROM cantidades_productos LEFT JOIN productos ON productos.id = cantidades_productos.producto_id LEFT JOIN facturas ON facturas.id = cantidades_productos.factura_id WHERE cantidades_productos.factura_id = " + facturaId;
            this.rs   = stmt.executeQuery(sql);
            connection.close();
            
            ArrayList<LineaFactura> lineasFacturas = new ArrayList();
            
            while(rs.next()){
                
                Producto producto = new Producto();
                producto.setNombre(rs.getString("nombre"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setId(rs.getInt("productoId"));
                producto.setPrecio (rs.getFloat("precio"));
                producto.setFechaCreacion(rs.getDate("fecha_creacion"));
                producto.setCategoriaId(rs.getInt("categoria_id"));

                Factura factura = new Factura();
                factura.setId(rs.getInt("facturaId"));
                factura.setFecha(rs.getDate("fecha"));
                factura.setObservacion(rs.getString("observacion"));
                factura.setTotal(rs.getDouble("total"));

                LineaFactura lineaFactura = new LineaFactura();
                lineaFactura.setId(rs.getInt("cpid"));
                lineaFactura.setCantidad(rs.getDouble("cantidad"));
                lineaFactura.setProducto(producto);
                lineaFactura.setFactura(factura);
                
       
                lineasFacturas.add(lineaFactura);
                
            }
            //System.out.println(cont);
            //connection.close();
            return lineasFacturas;
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
    
}
