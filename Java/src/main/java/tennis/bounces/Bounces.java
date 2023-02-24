package tennis.bounces;

import org.apache.commons.lang3.ArrayUtils;
import org.math.plot.*;
import org.math.plot.plotObjects.BaseLabel;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.List;

public class Bounces {
    static Plot2DPanel plot;
    public static void main (String[] args) {
        plot = new Plot2DPanel();
        double[] bounces = rebonds(2.0);
        graph(bounces);
    }

    /**
     * Cette fonction permet de calculer la hauteur de chaques rebonds.
     * @param h Hauteur initiale.
     * @return Tableau de double contenant la hauteur de chaques rebonds.
     */
    private static double[] rebonds(double h) {
        List<Double> b = new ArrayList<>();
        while (h > 0.1) {
            b.add(h);
            h *= 0.75;
        }
        return listToArray(b);
    }

    /**
     * Cette fonction permet de convertir une liste de Double en tableau de double.
     * @param list Liste à convertir.
     * @return Tableau contenant les éléments de la liste.
     */
    public static double[] listToArray(List<Double> list) {
        Double[] array = new Double[list.size()];
        Double[] finalArray = list.toArray(array);
        return ArrayUtils.toPrimitive(finalArray);
    }

    /**
     * Cette fonction permet de créer un graphique avec la hauteur de chaques rebonds.
     * @param plots Liste contenant la hauteur de chaques rebonds.
     */
    private static void graph (double[] plots) {
        plot.addScatterPlot("Rebonds", plots);
        plot.setAxisLabels("Nombre de rebonds", "Hauteur");
        plot.setName("Hauteur de chaques rebonds");
        plot.addPlotable(new BaseLabel("Hauteur de chaques rebonds", Color.black, 0.5, 1.1));

        JFrame frame = new JFrame("Hauteur de chaques rebonds d'une balle de tennis");
        frame.setContentPane(plot);
        frame.setVisible(true);
        frame.setSize(600, 600);
    }
}
