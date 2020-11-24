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
import ventasdao.objetos.Producto;
import ventasdao.objetos.ProductoCantidad;


public class GrillaFactura extends AbstractTableModel{
    
    private ArrayList<ProductoCantidad> productos = new ArrayList<ProductoCantidad>();
    public Float total = 0f;

    public GrillaFactura(ArrayList<ProductoCantidad> datos) {
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
             ProductoCantidad c = productos.get(rowIndex);
                
          switch(columnIndex){
              case 0: return c.getNombre();
              case 1: return c.getPrecio();
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
    
   public ProductoCantidad getCategoriaFromRow(int rowIndex){
   
            return productos.get(rowIndex);
   }
   
   public void vaciar(){
       productos.clear();
   }
   
   public void reemplazarLista(ArrayList<ProductoCantidad> nuevaLista){
       productos = nuevaLista;
   }
   
   public void agregar(ProductoCantidad productoCantidad){
       
       productos.add(productoCantidad);
       calcularTotal();
   }
   
   public void calcularTotal(){
       float total = 0f; 
       
       for(ProductoCantidad pr : productos){
           total = total + ( pr.getImporte() );
       }
       
       this.total = total;
   }
    
 
    
}
