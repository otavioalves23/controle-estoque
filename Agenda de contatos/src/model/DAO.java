package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
	// criando vari�veis encapsuladas para acesso ao banco
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://10.26.49.117:3306/agenda";
	private String user = "root";
	private String password = "123@senac";
	
	/**
	 * M�todo respons�vel por abrir uma conex�o com o banco
	 * @return con
	 */
	public Connection conectar() {
		//Criar um objeto
		Connection con = null;
		//tratamento de exce��es
		try {
			//l�gica principal para abrir a conex�o
			//Uso do driver
			Class.forName(driver);
			//Obter os par�metros da conex�o (informa��es do servidor)
			con = DriverManager.getConnection(url, user, password); //conectar!
			//retornar a conex�o ("abrir a porta da geladeira")
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}		
	}
}
