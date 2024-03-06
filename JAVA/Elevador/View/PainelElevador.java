// PainelElevador.java
package Elevador.View;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import Elevador.Control.ElevadoresControl;
import Elevador.Model.Elevadores;

public class PainelElevador extends JFrame {

    private ElevadoresControl elevadoresControl = new ElevadoresControl();

    public PainelElevador() {
        super("Dividindo um Frame entre Norte, Centro e Sul");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Cria o layout BorderLayout
        setLayout(new BorderLayout());

        // Adiciona componentes aos painéis Norte, Centro e Sul
        JPanel panelNorte = new JPanel(new GridLayout(2, 2));
        panelNorte.setBackground(Color.GRAY);
        add(panelNorte, BorderLayout.NORTH);

        // Adiciona um botão ao painel norte com o texto baseado na variável
        // "andarAtual"
        JButton Elevador1 = new JButton("Elevador 1");
        panelNorte.add(Elevador1);
        JButton Elevador2 = new JButton("Elevador 2");
        panelNorte.add(Elevador2);
        JButton AndarAtualElevador1 = new JButton("" + elevadoresControl.getAndarAtualElevador1());
        panelNorte.add(AndarAtualElevador1);
        JButton AndarAtualElevador2 = new JButton("" + elevadoresControl.getAndarAtualElevador2());
        panelNorte.add(AndarAtualElevador2);

        // Adiciona um JPanel ao centro e define um GridLayout
        JPanel panelCentro = new JPanel(new GridLayout(3, 3));
        panelCentro.setBackground(Color.GRAY);
        add(panelCentro, BorderLayout.CENTER);

        // Array para armazenar os textos dos botões do centro
        String[] textos = { "6", "5", "4", "3", "2", "1", "Térreo", "S1", "S2" };

        // Adiciona 9 botões ao GridLayout no centro com os textos específicos
        for (int i = 0; i < textos.length; i++) {
            JButton button = new JButton(textos[i]);
            button.addActionListener(elevadoresControl.new ElevadorActionListener());
            panelCentro.add(button);
        }

        JPanel panelSul = new JPanel();
        panelSul.setBackground(Color.GRAY);
        add(panelSul, BorderLayout.SOUTH);
        // Adiciona botões ao painel sul
        JButton btnEmergencia = new JButton("Emergência");
        panelSul.add(btnEmergencia);

        setSize(350, 600); // Define o tamanho do frame
        setVisible(true); // Torna o frame visível
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new PainelElevador());
    }
}
