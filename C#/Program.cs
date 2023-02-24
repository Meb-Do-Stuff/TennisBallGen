internal class TennisBallGenerator
{
    public static void Main(string[] args)
    {
        double[] bounces = Rebonds(2.0);
        Graphique(bounces);
    }
    
    /// <summary>
    /// Cette fonction permet de calculer la hauteur de chaques rebonds d'une balle de tennis.
    /// </summary>
    /// <param name="h">Hauteur de départ.</param>
    /// <returns>Liste contenant la hauteur de chaques rebonds.</returns>
    public static double[] Rebonds(double h)
        {
            List<double> b = new List<double>();
            while (h > 0.1)
            {
                b.Add(h);
                h *= 0.75;
            }

            return b.ToArray();
        }

    /// <summary>
    /// Cette fonction permet de créer un graphique avec la hauteur de chaques rebonds.
    /// </summary>
    /// <param name="bounces">Liste contenant la hauteur de chaques rebonds.</param>
    public static void Graphique(double[] bounces)
    {
        var plt = new ScottPlot.Plot(600, 400);

        List<double> scale = new List<double>();
        for (int i = 0; i < bounces.Length; i++) {scale.Add(i);}

        plt.AddScatter(scale.ToArray(), bounces);
        plt.Title("Hauteur de chaques rebonds");
        plt.XLabel("Nombre de rebonds");
        plt.YLabel("Hauteur");
        plt.SaveFig("fig.png");
    }

    }
