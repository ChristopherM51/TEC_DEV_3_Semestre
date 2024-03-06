// ElevadoresControl.java
package Elevador.Control;

import Elevador.Model.Elevadores;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ElevadoresControl {
    // Criando objetos da classe Elevadores
    private Elevadores elevador1 = new Elevadores();
    private Elevadores elevador2 = new Elevadores();
    
    // Lógica para escolher o elevador mais próximo do andar solicitado
    private Elevadores escolherElevadorMaisProximo(int andarSolicitado) {
        int distanciaElevador1 = Math.abs(elevador1.getAndarAtual() - andarSolicitado);
        int distanciaElevador2 = Math.abs(elevador2.getAndarAtual() - andarSolicitado);
        //
        if (distanciaElevador1 < distanciaElevador2) {
            return elevador1;
        } else if (distanciaElevador1 > distanciaElevador2) {
            return elevador2;
        } else { // Se a distância for a mesma
            if (elevador1.getAndarAtual() < elevador2.getAndarAtual()) {
                return elevador2; // Elevador mais alto atende ao chamado
            } else if (elevador1.getAndarAtual() > elevador2.getAndarAtual()) {
                return elevador1; // Elevador mais alto atende ao chamado
            } else { // Se ambos estiverem no mesmo andar
                return elevador1; // Elevador1 atende ao chamado
            }
        }
    }
    
    // Métodos para obter e definir o andar atual de cada elevador
    public int getAndarAtualElevador1() {
        return elevador1.getAndarAtual();
    }

    public void setAndarAtualElevador1(int andarAtualElevador1) {
        this.elevador1.setAndarAtual(andarAtualElevador1);
    }

    public int getAndarAtualElevador2() {
        return elevador2.getAndarAtual();
    }

    public void setAndarAtualElevador2(int andarAtualElevador2) {
        this.elevador2.setAndarAtual(andarAtualElevador2);
    }

    public class ElevadorActionListener implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            JButton btn = (JButton) e.getSource();
            String textos = btn.getText();

            // Convertendo o texto do botão em número
            int andarSolicitado = 0;
            switch (textos) {
                case "6":
                    andarSolicitado = 6;
                    break;
                case "5":
                    andarSolicitado = 5;
                    break;
                case "4":
                    andarSolicitado = 4;
                    break;
                case "3":
                    andarSolicitado = 3;
                    break;
                case "2":
                    andarSolicitado = 2;
                    break;
                case "1":
                    andarSolicitado = 1;
                    break;
                case "Térreo":
                    andarSolicitado = 0;
                    break;
                case "S1":
                    andarSolicitado = -1; // Subsolo 1
                    break;
                case "S2":
                    andarSolicitado = -2; // Subsolo 2
                    break;
                default:
                    break;
            }

            // Executando ação com base no andar solicitado
            if (andarSolicitado != 0) {
                
                // Escolhendo o elevador mais próximo
                Elevadores elevadorMaisProximo = escolherElevadorMaisProximo(andarSolicitado);
                
                // Aqui você pode adicionar lógica para o elevador escolhido atender ao chamado
                // Atualizando o andar atual do elevador e, consequentemente, o texto do botão
                if (elevadorMaisProximo == elevador1) {
                    setAndarAtualElevador1(andarSolicitado);
                } else {
                    setAndarAtualElevador2(andarSolicitado);
                }
            }
        }
    }
}
