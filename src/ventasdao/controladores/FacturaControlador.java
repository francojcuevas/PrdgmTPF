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

/**
 *
 * @author hchanampe
 */
public class FacturaControlador implements ICrud<Factura>{
    
    private Connection connection;
    
    private Statement stmt;
    
    private PreparedStatement ps;
    
    private ResultSet rs;
    
    private String sql;
    
    public Integer crearYRetornarId(Factura entidad) throws SQLException, ClassNotFoundException{
        connection = Conexion.obtenerConexion ();
         String sql = "INSERT INTO facturas (fecha,observacion,cliente_id, total) VALUES (?,?,?,?)";
        
         
         
        try {
            //ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            
            ps.setDate(1, new java.sql.Date(entidad.getFecha().getTime()));
            ps.setString(2, entidad.getObservacion());
            ps.setInt(3, entidad.getCliente().getId());
            ps.setDouble(4, entidad.getTotal()) ;
            
            
            int afectedRow =  ps.executeUpdate();
            
            connection.close();
            
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    
                    return (int)generatedKeys.getLong(1);
                }
                else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
            
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;        
    } 

    @Override
    public boolean crear(Factura entidad) throws SQLException, Exception {
        
        connection = Conexion.obtenerConexion ();
         String sql = "INSERT INTO facturas (fecha,observacion,cliente_id, total) VALUES (?,?,?,?)";
        
        try {
            ps = connection.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(entidad.getFecha().getTime()));
            ps.setString(2, entidad.getObservacion());
            ps.setInt(3, entidad.getCliente().getId());
            ps.setDouble(4, entidad.getTotal()) ;
            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
// 
    @Override
    public boolean eliminar(Factura entidad) throws SQLException, Exception {
        
        try {
            connection = Conexion.obtenerConexion ();
            this.sql = "DELETE FROM facturas WHERE id=?";

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
    public Factura extraer(int id) throws SQLException, Exception {
        
                        
            connection = Conexion.obtenerConexion();
            sql = "SELECT *, clientes.id as clienteId FROM facturas LEFT JOIN clientes ON clientes.id = facturas.cliente_id WHERE facturas.id = ? ";
            ps = connection.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            this.rs   = ps.executeQuery();
            
            connection.close();
            
            this.rs.next();
            
            Cliente cliente = new Cliente();
            cliente.setId(rs.getInt("clienteId"));
            cliente.setNombre(rs.getString("nombre"));
            cliente.setApellido(rs.getString("apellido"));
            cliente.setCuil(rs.getString("cuil"));
            cliente.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
            cliente.setTipoClienteId(rs.getInt("tipo_cliente_id"));
            
            Factura factura = new Factura();
            factura.setId(id);
            factura.setFecha(rs.getDate("fecha"));
            factura.setObservacion(rs.getString("observacion"));
            factura.setCliente(cliente);
            factura.setTotal(rs.getDouble("total"));
            
            return factura;
    }

    @Override
    public boolean modificar(Factura entidad) throws SQLException, Exception {
       
       connection = Conexion.obtenerConexion ();
       this.sql = "UPDATE facturas SET fecha = ?,observacion=?,cliente_id=?, total=? WHERE id=?";
        
       ps = connection.prepareStatement(sql);
       ps.setDate(1, new java.sql.Date(entidad.getFecha().getTime()));
       ps.setString(2,entidad.getObservacion());
       ps.setInt(3,entidad.getCliente().getId());
       ps.setDouble(4, entidad.getTotal());       
       ps.setInt(5, entidad.getId());
       
       ps.executeUpdate();
       connection.close();
       return true;
    }

    @Override
    public ArrayList<Factura> listar() throws SQLException, Exception {
        
        connection = Conexion.obtenerConexion ();
        try{
            
            this.stmt = connection.createStatement();
            this.sql = "SELECT * FROM facturas LEFT JOIN clientes ON clientes.id = facturas.cliente_id";
            this.rs   = stmt.executeQuery(sql);
            connection.close();
            
            ArrayList<Factura> facturas = new ArrayList();
            
            while(rs.next()){
                
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("clientes.id"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setApellido(rs.getString("apellido"));
                cliente.setCuil(rs.getString("cuil"));
                cliente.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
                cliente.setTipoClienteId(rs.getInt("tipo_cliente_id"));

                Factura factura = new Factura();
                factura.setId(rs.getInt("facturas.id"));
                factura.setFecha(rs.getDate("fecha"));
                factura.setObservacion(rs.getString("descripcion"));
                factura.setCliente(cliente);
                factura.setTotal(rs.getDouble("total"));
                
       
                facturas.add(factura);
                
            }
            //System.out.println(cont);
            //connection.close();
            return facturas;
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
    
}
