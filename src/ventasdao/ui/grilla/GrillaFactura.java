/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ventasdao.ui.grilla;

import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;
import ventasdao.objetos.Cliente;
import ventasdao.objetos.Factura;
import ventasdao.objetos.LineaFactura;
import ventasdao.objetos.Producto;
import ventasdao.objetos.ProductoCantidad;


public class GrillaFactura extends AbstractTableModel{
    
    private ArrayList<LineaFactura> productos = new ArrayList<LineaFactura>();

    public ArrayList<LineaFactura> getProductos() {
        return productos;
    }

    public void setProductos(ArrayList<LineaFactura> productos) {
        this.productos = productos;
    }
    public Double total = 0d;

    public GrillaFactura(ArrayList<LineaFactura> datos) {
        this.productos = datos;
    }

    @Override
    public int getRowCount() {
        return productos.size(); 
    }

    @Override
    public int getColumnCount() {
        return 4; 
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
             LineaFactura c = productos.get(rowIndex);
                
          switch(columnIndex){
              case 0: return c.getProducto().getNombre();
              case 1: return c.getProducto().getPrecio();
              case 2: return c.getCantidad();
              case 3: return c.getImporte();
              default: return "";
          }

    }

    @Override
    public String getColumnName(int column) {
        
        switch(column){
            case 0: return "Nombre";
            case 1: return "Precio_Uni";
            case 2: return "Cantidad";
            case 3: return "Importe";
            default: return "";
        
        
        }
        
    }
    
   public LineaFactura getCategoriaFromRow(int rowIndex){
   
            return productos.get(rowIndex);
   }
   
   public void vaciar(){
       productos.clear();
   }
   
   public void reemplazarLista(ArrayList<LineaFactura> nuevaLista){
       productos = nuevaLista;
   }
   
   public void agregar(LineaFactura productoCantidad){
       
       productos.add(productoCantidad);
       calcularTotal();
   }
   
   public void calcularTotal(){
       Double total = 0d; 
       
       for(LineaFactura pr : productos){
           total = total + ( pr.getImporte() );
       }
       
       this.total = total;
   }
    
 
    
}
