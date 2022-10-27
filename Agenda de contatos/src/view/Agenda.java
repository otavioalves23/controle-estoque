package view;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import Atxy2k.CustomTextField.RestrictedTextField;
import model.DAO;

import java.awt.Toolkit;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.ImageIcon;
import java.awt.Cursor;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Agenda extends JFrame {

	private JPanel contentPane;
	private JTextField txtId;
	private JTextField txtNome;
	private JTextField txtFone;
	private JTextField txtEmail;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Agenda frame = new Agenda();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Construtor
	 */
	public Agenda() {
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowActivated(WindowEvent e) {
				status();
			}
		});
		setResizable(false);
		setTitle("Agenda de contatos");
		setIconImage(Toolkit.getDefaultToolkit().getImage(Agenda.class.getResource("/img/favicon.png")));
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 523, 292);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		JLabel lblNewLabel = new JLabel("ID");
		lblNewLabel.setBounds(385, 27, 39, 14);
		contentPane.add(lblNewLabel);

		txtId = new JTextField();
		txtId.setEditable(false);
		txtId.setBounds(419, 24, 53, 20);
		contentPane.add(txtId);
		txtId.setColumns(10);

		JLabel lblNewLabel_1 = new JLabel("Nome");
		lblNewLabel_1.setBounds(31, 27, 46, 14);
		contentPane.add(lblNewLabel_1);

		txtNome = new JTextField();
		txtNome.setBounds(82, 24, 200, 20);
		contentPane.add(txtNome);
		txtNome.setColumns(10);

		JLabel lblNewLabel_2 = new JLabel("Fone");
		lblNewLabel_2.setBounds(31, 76, 46, 14);
		contentPane.add(lblNewLabel_2);

		txtFone = new JTextField();
		txtFone.setBounds(82, 73, 177, 20);
		contentPane.add(txtFone);
		txtFone.setColumns(10);

		JLabel lblNewLabel_3 = new JLabel("E-mail");
		lblNewLabel_3.setBounds(31, 127, 46, 14);
		contentPane.add(lblNewLabel_3);

		txtEmail = new JTextField();
		txtEmail.setBounds(82, 124, 322, 20);
		contentPane.add(txtEmail);
		txtEmail.setColumns(10);

		btnCreate = new JButton("");
		btnCreate.setEnabled(false);
		btnCreate.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				adicionarContato();
			}
		});
		btnCreate.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnCreate.setContentAreaFilled(false);
		btnCreate.setBorderPainted(false);
		btnCreate.setToolTipText("Adicionar contato");
		btnCreate.setIcon(new ImageIcon(Agenda.class.getResource("/img/create.png")));
		btnCreate.setBounds(251, 167, 64, 64);
		contentPane.add(btnCreate);

		btnUpdate = new JButton("");
		btnUpdate.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				alterarContato();
			}
		});
		btnUpdate.setEnabled(false);
		btnUpdate.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnUpdate.setIcon(new ImageIcon(Agenda.class.getResource("/img/update.png")));
		btnUpdate.setToolTipText("Editar contato");
		btnUpdate.setContentAreaFilled(false);
		btnUpdate.setBorderPainted(false);
		btnUpdate.setBounds(325, 167, 64, 64);
		contentPane.add(btnUpdate);

		btnDelete = new JButton("");
		btnDelete.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				excluirContato();
			}
		});
		btnDelete.setEnabled(false);
		btnDelete.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnDelete.setIcon(new ImageIcon(Agenda.class.getResource("/img/delete.png")));
		btnDelete.setToolTipText("Excluir contato");
		btnDelete.setContentAreaFilled(false);
		btnDelete.setBorderPainted(false);
		btnDelete.setBounds(402, 167, 64, 64);
		contentPane.add(btnDelete);

		btnRead = new JButton("");
		btnRead.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				pesquisarContato();
			}
		});
		btnRead.setIcon(new ImageIcon(Agenda.class.getResource("/img/pesquisar.png")));
		btnRead.setContentAreaFilled(false);
		btnRead.setBorderPainted(false);
		btnRead.setBounds(299, 24, 32, 32);
		contentPane.add(btnRead);

		lblStatus = new JLabel("");
		lblStatus.setIcon(new ImageIcon(Agenda.class.getResource("/img/dboff.png")));
		lblStatus.setBounds(31, 183, 48, 48);
		contentPane.add(lblStatus);

		// Uso da tecla <Enter> junto com um botão
		getRootPane().setDefaultButton(btnRead);

		// Uso da biblioteca atxy2k para restringir o máximo de caracteres
		// txtNome
		RestrictedTextField nome = new RestrictedTextField(txtNome);
		nome.setOnlyText(true);
		nome.setAcceptSpace(true);
		nome.setLimit(50);
		// txtFone
		RestrictedTextField fone = new RestrictedTextField(txtFone);
		fone.setLimit(15);
		// txtEmail
		RestrictedTextField email = new RestrictedTextField(txtEmail);
		email.setOnlyText(true);
		email.setAcceptSpace(true);
		email.setLimit(50);

	}// fim do construtor

	// Criar um objeto para acessar o método conectar() da classe DAO
	DAO dao = new DAO();
	private JLabel lblStatus;
	private JButton btnCreate;
	private JButton btnUpdate;
	private JButton btnDelete;
	private JButton btnRead;

	/**
	 * Método responsável por verificar o status da conexão com o banco
	 */
	private void status() {
		// System.out.println("teste - Janela Ativada");
		// uso da classe Connection (JDBC) para estabelecer a conexão
		try {
			Connection con = dao.conectar();
			if (con == null) {
				// System.out.println("Erro de conexão");
				lblStatus.setIcon(new ImageIcon(Agenda.class.getResource("/img/dboff.png")));
			} else {
				// System.out.println("Banco conectado!");
				lblStatus.setIcon(new ImageIcon(Agenda.class.getResource("/img/dbon.png")));
			}
			// Nunca esquecer de encerrar a conexão
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}// fim do status

	/**
	 * Método responsável pela pesquisa(select) de um contato no banco
	 */
	private void pesquisarContato() {
		// validação
		if (txtNome.getText().isEmpty()) {
			JOptionPane.showMessageDialog(null, "Digite o nome do contato");
			txtNome.requestFocus();
		} else {
			// System.out.println("Teste pesquisar");
			// Iniciar com a instrução sql
			// ? é um parâmetro a ser substituído
			String read = "select * from contatos where nome = ?";
			try {
				// Estabelecer a conexão ("abrir a porta da geladeira")
				Connection con = dao.conectar();
				// Preparar o código sql para execução
				PreparedStatement pst = con.prepareStatement(read);
				// a linha abaixo substitui o ? pelo conteúdo da caixa de texto txtNome, o 1 faz
				// referência a interrogação
				pst.setString(1, txtNome.getText());
				// Obter os dados do contato (resultado)
				ResultSet rs = pst.executeQuery();
				// verificar se existe um contato cadastrado
				// rs.next() significa ter um contato correspondente ao nome pesquisado
				if (rs.next()) {
					// setar as caixas de texto com o resultado da pesquisa
					txtId.setText(rs.getString(1));
					txtFone.setText(rs.getString(3));
					txtEmail.setText(rs.getString(4));
					// habilitar botões (alterar e excluir)
					btnUpdate.setEnabled(true);
					btnDelete.setEnabled(true);

				} else {
					JOptionPane.showMessageDialog(null, "Contato inexistente");
					// setar campos e botões (UX)
					txtFone.setText(null);
					txtEmail.setText(null);
					txtFone.requestFocus();
					btnCreate.setEnabled(true);
					btnRead.setEnabled(false);
				}
				// fechar a conexão
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

	/**
	 * Método responsável pelo cadastro de um novo contato
	 */
	void adicionarContato() {
		// validação de campos obrigatórios
		if (txtNome.getText().isEmpty()) {
			JOptionPane.showMessageDialog(null, "Preencha o nome");
			txtNome.requestFocus();
		} else if (txtFone.getText().isEmpty()) {
			JOptionPane.showMessageDialog(null, "Preencha o fone");
			txtFone.requestFocus();
		} else {
			// System.out.println("teste adicionar");
			String create = "insert into contatos (nome,fone,email) values (?,?,?)";
			try {
				// Abrir a conexão
				Connection con = dao.conectar();
				// Preparar a query (substituição de parâmetros)
				PreparedStatement pst = con.prepareStatement(create);
				pst.setString(1, txtNome.getText());
				pst.setString(2, txtFone.getText());
				pst.setString(3, txtEmail.getText());
				// Executar a query e confirmar a inserção no banco
				int confirma = pst.executeUpdate();
				// System.out.println(confirma);
				if (confirma == 1) {
					JOptionPane.showMessageDialog(null, "Contato adicionado.");
					limpar();
				}

				// Encerrar a conexão
				con.close();

			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}
	
	
	/**
	 * Método responsável pela edição do contato
	 */
	private void alterarContato() {
		// System.out.println("teste do botão Update");

		// validação de campos obrigatórios
		if (txtNome.getText().isEmpty()) {
			JOptionPane.showMessageDialog(null, "Preencha o nome");
			txtNome.requestFocus();
		} else if (txtFone.getText().isEmpty()) {
			JOptionPane.showMessageDialog(null, "Preencha o fone");
			txtFone.requestFocus();
		} else {
			// Lógica principal
			String update = "update contatos set nome = ?, fone = ?, email = ? where id = ?";
			try {
				// abrir a conexão
				Connection con = dao.conectar();
				// preparar a query (instrução sql)
				PreparedStatement pst = con.prepareStatement(update);
				pst.setString(1, txtNome.getText());
				pst.setString(2, txtFone.getText());
				pst.setString(3, txtEmail.getText());
				pst.setString(4, txtId.getText());
				// Executar a query e confirmar as alterações no banco
				int confirma = pst.executeUpdate();
				// System.out.println(confirma);
				if (confirma == 1) {
					JOptionPane.showMessageDialog(null, "Dados do contato atualizados com sucesso");
					limpar();
				}

				// Encerrar a conexão
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}
	
	/**
	 * Método usado para excluir um contato
	 */
	private void excluirContato() {
		//System.out.println("teste do botão Excluir");
		//validação (confirmação)
		int confirma = JOptionPane.showConfirmDialog(null, "Confirma a exclusão deste contato?", "ATENÇÃO", JOptionPane.YES_NO_OPTION);
		if(confirma == JOptionPane.YES_OPTION) {
			String delete = "delete from contatos where id = ?";
			try {
				//abrir a conexão
				Connection con = dao.conectar();
				// preparar a query
				PreparedStatement pst = con.prepareStatement(delete);
				pst.setString(1, txtId.getText());
				//executar o comando sql e confirmar a exclusão
				int confirmaExcluir = pst.executeUpdate();
				if (confirmaExcluir == 1) {
					limpar();
					JOptionPane.showMessageDialog(null, "Contato excluído com sucesso");
				}
				// encerrar a conexão
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}


	/**
	 * Método usado para limpar os campos e setar os botões
	 */
	private void limpar() {
		txtId.setText(null);
		txtNome.setText(null);
		txtFone.setText(null);
		txtEmail.setText(null);
		txtNome.requestFocus();
		btnCreate.setEnabled(false);
		btnUpdate.setEnabled(false);
		btnDelete.setEnabled(false);
		btnRead.setEnabled(true);
	}

}// fim
