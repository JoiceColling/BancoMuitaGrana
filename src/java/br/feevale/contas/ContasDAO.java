package br.feevale.contas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ContasDAO {
    String uri = "jdbc:derby://localhost:1527/bancoMuitaGrana";
    Connection con;
    private static ContasDAO instance = null;
    
    public static synchronized ContasDAO getInstance(){
        if(instance == null){
            instance = new ContasDAO();
        }
        return instance;
    }
    
    
    private ContasDAO(){
        connect();
    }
    
    
    public void connect(){
        try {
            con = DriverManager.getConnection(uri, "banco", "banco");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Conta> getContas(Integer contaNumero){  
        List<Conta> contas = new ArrayList<>();
        Conta a;
        
        try {
            String sql = "SELECT * FROM CONTAS WHERE CONTA=? ORDER BY DATA";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, contaNumero);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                a = new Conta();
                a.setId(rs.getInt("ID"));
                a.setData(rs.getString("DATA"));
                a.setConta(rs.getInt("CONTA"));
                a.setTipoTransacao(rs.getInt("TIPOTRANSACAO"));
                a.setValor(rs.getDouble("VALOR"));
                contas.add(a);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return contas;
    }
    
    
    public void addConta(Conta a){
        String sql = "INSERT INTO CONTAS (CONTA,TIPOTRANSACAO,VALOR) VALUES (?,?,?)";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, a.getConta());
            pstmt.setInt(2, a.getTipoTransacao());
            pstmt.setDouble(3, a.getValor());
            pstmt.execute(); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
