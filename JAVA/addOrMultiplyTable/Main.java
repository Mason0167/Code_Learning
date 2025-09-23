import org.w3c.dom.ls.LSOutput;

import javax.swing.*;
import java.awt.*;
import java.sql.SQLOutput;
import java.text.DecimalFormat;
import java.util.Scanner;

public class Main extends JPanel{
    String type = JOptionPane.showInputDialog("Enter which system you want to use(A or M): ");
    int tableCount = Integer.parseInt(JOptionPane.showInputDialog("How many grid do you want?(?x?) "));

    @Override
    public void paintComponent(Graphics g) {

        int width = getWidth();
        int height = getHeight();
        int rectWidth = width / tableCount;
        int rectHeight = height / tableCount;
        int y = 0;

        for(int i = 1; i <= tableCount; i++){
            int x = 0;
            for(int j = 1; j <= tableCount; j++) {

                if (i == 1 || j == 1) {
                    g.setColor(Color.yellow);
                    g.fillRect(x, y, rectWidth, rectHeight);
                }
                g.setColor(Color.black);
                g.drawRect(x, y, rectWidth, rectHeight);

                if (i == 1) {
                    g.drawString(String.valueOf(j), x + 5, y + 13);
                } else if (j == 1) {
                    g.drawString(String.valueOf(i), x + 5, y + 13);
                } else {
                    int value = 0;
                    if (type.toLowerCase().equals("a")) {
                        value = i + j;
                    } else if (type.toLowerCase().equals("m")) {
                        value = i * j;
                    }
                    g.drawString(String.valueOf(value), x + 5, y + 13);
                }
                x += rectWidth;
            }
            y += rectHeight;
        }

    }
    public static void main(String[] args) {
        JFrame window = new JFrame();
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        window.setSize(300, 300);
        window.setContentPane(new Main());
        window.setVisible(true);

    }

}
